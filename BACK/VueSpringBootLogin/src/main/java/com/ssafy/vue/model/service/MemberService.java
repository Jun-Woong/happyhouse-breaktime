package com.ssafy.vue.model.service;

import com.ssafy.vue.model.MemberDto;

public interface MemberService {

	public MemberDto login(MemberDto memberDto) throws Exception;
	public String getServerInfo() throws Exception;
	public int joinMember(MemberDto memberDto) throws Exception;
	public int updateMember(MemberDto memberDto) throws Exception;
	public int deleteMember(String userid) throws Exception;
	
}
