package com.ssafy.vue.model.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.vue.model.MemberDto;
import com.ssafy.vue.model.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private SqlSession sqlSession;
		
	@Override
	public MemberDto login(MemberDto memberDto) throws Exception {
		return sqlSession.getMapper(MemberMapper.class).login(memberDto);
	}

	@Override
	public String getServerInfo() {
		return "사용자에게 전달하고 싶은 중요정보";
	}

	@Override
	public int joinMember(MemberDto memberDto) {
		  return sqlSession.getMapper(MemberMapper.class).joinMember(memberDto);
	}
	
	@Override
	public int updateMember(MemberDto memberDto) {
		  return sqlSession.getMapper(MemberMapper.class).updateMember(memberDto);
	}
	@Override
	public int deleteMember(String userid) {
		  return sqlSession.getMapper(MemberMapper.class).deleteMember(userid);
	}
}
