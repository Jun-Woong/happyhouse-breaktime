package com.ssafy.vue.model.mapper;

import java.sql.SQLException;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.vue.model.MemberDto;

@Mapper
public interface MemberMapper {

	public MemberDto login(MemberDto memberDto) throws SQLException;
	public int joinMember(MemberDto memberDto);
	public int updateMember(MemberDto memberDto);
	public int deleteMember(String userid);
	
}
