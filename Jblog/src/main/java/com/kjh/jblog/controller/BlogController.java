package com.kjh.jblog.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kjh.jblog.service.BlogService;
import com.kjh.jblog.service.CategoryService;
import com.kjh.jblog.service.CommentsService;
import com.kjh.jblog.service.FileUploadService;
import com.kjh.jblog.service.PostService;
import com.kjh.jblog.service.UsersService;
import com.kjh.jblog.vo.BlogVo;
import com.kjh.jblog.vo.CategoryVo;
import com.kjh.jblog.vo.CommentsVo;
import com.kjh.jblog.vo.PostVo;
import com.kjh.jblog.vo.UserVo;

@Controller
@RequestMapping({"/{id}"})
public class BlogController {
	
	private static Logger logger = LoggerFactory.getLogger(BlogController.class);

	
	@Autowired
	BlogService bService;
	@Autowired
	UsersService uService;
	@Autowired
	CategoryService cService;
	@Autowired
	PostService pService;
	@Autowired
	FileUploadService fileuploadService;
	@Autowired
	CommentsService cmtService;
	
	@RequestMapping("")
	public String myBlog(@PathVariable String id, Model model,@RequestParam(required=false) Long cateNo,@RequestParam(required=false) Long postNo,HttpSession session) {
		System.out.println("아이디 값 : "+id);
		Long userNo = uService.selectUserNo(id);
		BlogVo bvo = bService.selectBlog(id);
		session.setAttribute("blogVo", bvo);
		session.setAttribute("b_id", id);
		if(userNo == null) {
			
		}
		System.out.println("유저 넘버 : "+userNo);
		List<CategoryVo> cList = cService.categoryList(userNo);
		
		if(cateNo == null) {
			cateNo = cList.get(0).getCateNo();
		}
		List<PostVo> pList = pService.postList(cateNo);
		System.out.println(cateNo);
		if(postNo == null&&pList.size()==0) {
			postNo = 0L;
		}else if(postNo == null&&pList.size()!=0) {
			postNo = pList.get(0).getPostNo();
		}
		System.out.println(postNo);
		List<CommentsVo> cmtList = cmtService.cmtList(postNo);
		
		PostVo vo = pService.selectPost(postNo);
		System.out.println(vo);
		model.addAttribute("cList", cList);
		model.addAttribute("pList", pList);
		model.addAttribute("pVo", vo);
		model.addAttribute("cmtList", cmtList);
		
		return "jblog/blog/blog";
	}
	
	@RequestMapping(value="/admin/basic",method=RequestMethod.GET)
	public String blogUpdateForm() {
		
		return "jblog/blog/blog_modify";
	}
	
	@RequestMapping(value="/admin/basic",method=RequestMethod.POST)
	public String blogUpdate(HttpSession session,@RequestParam MultipartFile uploadfile,@RequestParam String blogTitle) {
		UserVo vo = (UserVo) session.getAttribute("authUser");
		BlogVo bVo = (BlogVo) session.getAttribute("blogVo");
		String id = vo.getId();
		Long userNo = vo.getUserNo();
		String saveFilename = fileuploadService.store(uploadfile);
		String urlImage =bVo.getLogoFile();
		if(!saveFilename.equals("")) {
			urlImage = saveFilename;
		}
		BlogVo bvo = new BlogVo();
		bvo.setBlogTitle(blogTitle);
		bvo.setLogoFile(urlImage);
		bvo.setUserNo(userNo);
		boolean success = bService.modifyBlog(bvo);
		
		if(success) {
			return "redirect:/"+id;
		}else {
			return "redirect:/"+id+"/admin/basic";
		}
	}
	
	@RequestMapping(value="/admin/category",method=RequestMethod.GET)
	public String categoryForm(HttpSession session,Model model) {
		UserVo vo = (UserVo) session.getAttribute("authUser");
		Long userNo= vo.getUserNo();
		List<CategoryVo> cList = cService.categoryAndCntList(userNo);
		model.addAttribute("list", cList);
		
		return "jblog/blog/category_modify";
	}
	
	@RequestMapping(value="/admin/category_insert",method=RequestMethod.POST)
	public String categoryInsert(@RequestParam String cateName,@RequestParam String description,HttpSession session) {
		UserVo vo = (UserVo) session.getAttribute("authUser");
		Long userNo= vo.getUserNo();
		String id = vo.getId();
		
		CategoryVo cvo = new CategoryVo();
		cvo.setCateName(cateName);
		cvo.setDescription(description);
		cvo.setUserNo(userNo);
		
		boolean success = cService.createCategory(cvo);
		

		if(success) {
			return "redirect:/"+id+"/admin/category";
		}else {
			return "redirect:/"+id+"/admin/category";
		}
		
	}
	
	@ResponseBody
	@RequestMapping(value="/admin/category_delete")
	public Object categoryDelete(@RequestParam(value="cateNo",required = false) Long cateNo,HttpSession session) {
		UserVo vo = (UserVo) session.getAttribute("authUser");
		System.out.println(cateNo);
		PostVo pvo = pService.selectCount(cateNo,vo.getUserNo());
		
		int count = pvo.getCount();
		
		boolean success = false;
		if(count==0) {
			success = cService.categoryDelete(cateNo);
		}
		
		Map<String,Object> map = new HashMap<>();
		map.put("result", "seccess");
		map.put("data", success);
		
		return map;
	}
	
	@RequestMapping(value="/admin/write",method=RequestMethod.GET)
	public String postForm(HttpSession session,Model model) {
		UserVo vo = (UserVo) session.getAttribute("authUser");
		Long userNo= vo.getUserNo();
		List<CategoryVo> cList = cService.categoryList(userNo);
		System.out.println(cList);
		model.addAttribute("list", cList);
		return "jblog/blog/postform";
	}
	
	@RequestMapping(value="/admin/write",method=RequestMethod.POST)
	public String postInsert(@ModelAttribute PostVo pVo,HttpSession session) {
		UserVo vo = (UserVo) session.getAttribute("authUser");
		String id = vo.getId();
		
		System.out.println(pVo);
		boolean success = pService.createPost(pVo);
		
		if(success) {
			return "redirect:/"+id;
		}else {
			return "redirect:/"+id+"/admin/write";
		}
	}
	
	@RequestMapping(value="/admin/cmtInsert")
	public String cmtInsert(@ModelAttribute CommentsVo cmtVo,HttpSession session) {
		System.out.println(cmtVo);
		boolean success = cmtService.cmtInsert(cmtVo);
		
		String id = (String) session.getAttribute("b_id");
		PostVo pvo = pService.selectPost(cmtVo.getPostNo());
		Long cateNo = pvo.getCateNo();
		if(success) {
			return "redirect:/"+id+"?postNo="+cmtVo.getPostNo()+"&cateNo="+cateNo;
		}else {
			logger.error("댓글 인서트 실패!!");
			return "redirect:/"+id;
		}
	}
	
	@RequestMapping(value="/admin/cmtDelete")
	public String cmtDelete(@RequestParam Long cmtNo,@RequestParam Long postNo, HttpSession session) {
		System.out.println(cmtNo);
		boolean success = cmtService.cmtDelete(cmtNo);
		
		String id = (String) session.getAttribute("b_id");
		PostVo pvo = pService.selectPost(postNo);
		Long cateNo = pvo.getCateNo();
		if(success) {
			return "redirect:/"+id+"?postNo="+postNo+"&cateNo="+cateNo;
		}else {
			logger.error("댓글 딜리트 실패!!");
			return "redirect:/"+id;
		}
	}
}
