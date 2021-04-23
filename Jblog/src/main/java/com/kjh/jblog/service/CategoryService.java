package com.kjh.jblog.service;

import java.util.List;

import com.kjh.jblog.vo.CategoryVo;

public interface CategoryService {

	public List<CategoryVo> categoryAndCntList(Long userNo);
	public List<CategoryVo> categoryList(Long userNo);		//카테고리리스트 출력
	public CategoryVo selectCategory(Long cateNo);			//카테고리 한개 출력
	public boolean createCategory(CategoryVo vo);
	public boolean categoryDelete(Long cateNo);
}
