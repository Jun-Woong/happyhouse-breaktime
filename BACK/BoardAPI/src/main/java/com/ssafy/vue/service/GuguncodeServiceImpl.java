package com.ssafy.vue.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssafy.vue.dao.GuguncodeDAO;


@Service
public class GuguncodeServiceImpl implements GuguncodeService {
    @Autowired
	private GuguncodeDAO guguncodeDao;

	@Override
	public String selectGuguncode(String gugun_name) {
		return guguncodeDao.selectGuguncode(gugun_name);
	}

  @Override
  public String selectSafetyDegreeValue(String gugun_code) {
    return guguncodeDao.selectSafetyDegreeValue(gugun_code);
  }
	
}