package com.kjh.jblog.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kjh.jblog.service.BlogService;
import com.kjh.jblog.service.UsersService;
import com.kjh.jblog.vo.BlogVo;
import com.kjh.jblog.vo.CategoryVo;
import com.kjh.jblog.vo.UserVo;

@Controller
@RequestMapping({"","/","/user"})
public class UsersController {
	
	@Autowired
	UsersService uService;
	@Autowired
	BlogService bService;
	
	private static Logger logger = LoggerFactory.getLogger(UsersController.class);

	@RequestMapping({"","/"})
	public String Main() {
		return "jblog/main";
	}
	
	@RequestMapping(value="/login",method=RequestMethod.GET)
	public String loginForm() {
		
		
		return "jblog/user/loginform";
	}
	
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public String login(@RequestParam String id, @RequestParam String password,HttpSession session,RedirectAttributes attributes) {
		
		UserVo authUser = uService.login(id, password);
		
		if(authUser !=null) {
			session.setAttribute("authUser", authUser);
			return "redirect:/";
		}else {
			attributes.addFlashAttribute("msg", "로그인실패<br/> 아이디/패스워드를 확인해 주세요.");
			return "redirect:/login";
		}
	}
	
	@RequestMapping(value="/join",method=RequestMethod.GET)
	public String userJoinForm(@ModelAttribute UserVo userVo) {
		return "jblog/user/userJoin";
	}
	
	@RequestMapping(value="/join",method=RequestMethod.POST)
	public String userJoin(@ModelAttribute @Valid UserVo userVo,BindingResult result,Model model) {
		
		if(result.hasErrors()) {
			List<ObjectError> errors = result.getAllErrors();
			for(ObjectError e: errors) {
				logger.error("valid error"+e);
			}
			model.addAttribute(result.getModel());
			
			return "jblog/user/userJoin";
		}
		
		boolean success = uService.userInsert(userVo);
		
		
		if(success) {
			return "redirect:/joinsuccess";
		}else {
			return "redirect:/";
		}
	}
	
	@ResponseBody
	@RequestMapping("/idCheck")
	public Object existsId(@RequestParam(value="id",required=false,defaultValue="") String id) {
		boolean yn = uService.idCheck(id);
		Map<String,Object> map = new HashMap<>();
		map.put("result", "seccess");
		map.put("data", yn);
		
		return map;
	}
	
	@RequestMapping("/joinsuccess")
	public String joinsuccess() {
		return "jblog/user/joinsuccess";
	}
	
	@RequestMapping("/logout")
	public String logoutAction(HttpSession session) {
		//세션 지우기
		session.removeAttribute("authUser");
		//세션 무효화
		session.invalidate();
		
		return "redirect:/";
	}
}
