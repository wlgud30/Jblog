package com.kjh.jblog.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kjh.jblog.repository.CategoryDao;
import com.kjh.jblog.vo.CategoryVo;

@Service
public class CategoryServiceImpl implements CategoryService {
	
	@Autowired
	CategoryDao categoryDaoImpl;

	@Override
	public List<CategoryVo> categoryList(Long userNo) {
		List<CategoryVo> list = categoryDaoImpl.categoryList(userNo);
		return list;
	}

	@Override
	public CategoryVo selectCategory(Long cateNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean createCategory(CategoryVo vo) {
		int result = categoryDaoImpl.categoryInsert(vo);
		return result==1;
	}

	@Override
	public boolean categoryDelete(Long cateNo) {
		int result = categoryDaoImpl.categoryDelete(cateNo);
		return result==1;
	}

	@Override
	public List<CategoryVo> categoryAndCntList(Long userNo) {
		List<CategoryVo> list = categoryDaoImpl.categoryAndCntList(userNo);
		return list;
	}

}
