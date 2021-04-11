package com.ssafy.vue.dao;


import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface GuguncodeDAO {
	public String selectGuguncode(String gugun_name);
	public String selectSafetyDegreeValue(String gugun_code);
}