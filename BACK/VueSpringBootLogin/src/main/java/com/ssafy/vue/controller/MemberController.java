package com.ssafy.vue.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.*;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.ssafy.vue.model.MemberDto;
import com.ssafy.vue.model.service.JwtService;
import com.ssafy.vue.model.service.MemberService;

@CrossOrigin(origins = { "*" }, maxAge = 6000)
@RestController
@RequestMapping("/user")
public class MemberController {

	@Autowired
	private JwtService jwtService;

	@Autowired
	private MemberService memberService;

	public static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@PostMapping("/confirm/login")
	public ResponseEntity<Map<String, Object>> login(@RequestBody MemberDto memberDto, HttpServletResponse response,
			HttpSession session) {
		Map<String, Object> resultMap = new HashMap<>();
		HttpStatus status = null;
		System.out.println(memberDto);
		try {
			MemberDto loginUser = memberService.login(memberDto);
			if (loginUser != null) {
//				jwt.io에서 확인
//				로그인 성공했다면 토큰을 생성한다.
				String token = jwtService.create(loginUser);
				logger.trace("로그인 토큰정보 : {}", token);

//				토큰 정보는 response의 헤더로 보내고 나머지는 Map에 담는다.
//				response.setHeader("auth-token", token);
				resultMap.put("auth-token", token);
				resultMap.put("user-id", loginUser.getUserid());
				resultMap.put("user-name", loginUser.getUsername());
				System.out.println(resultMap);

				resultMap.put("message", "로그인 성공");
//				resultMap.put("status", true);
//				resultMap.put("data", loginUser);
				status = HttpStatus.ACCEPTED;
			} else {
				resultMap.put("message", "로그인 실패");
				status = HttpStatus.ACCEPTED;
			}
		} catch (Exception e) {
			logger.error("로그인 실패 : {}", e);
			resultMap.put("message", e.getMessage());
			status = HttpStatus.INTERNAL_SERVER_ERROR;
		}
		return new ResponseEntity<Map<String, Object>>(resultMap, status);
	}

	@GetMapping("/info")
	public ResponseEntity<Map<String, Object>> getInfo(HttpServletRequest req) {
		Map<String, Object> resultMap = new HashMap<>();
		HttpStatus status = HttpStatus.ACCEPTED;
		System.out.println(">>>>>> " + jwtService.get(req.getHeader("auth-token")));
		try {
			resultMap.putAll(jwtService.get(req.getHeader("auth-token")));
			status = HttpStatus.ACCEPTED;
		} catch (RuntimeException e) {
			logger.error("정보조회 실패 : {}", e);
			resultMap.put("message", e.getMessage());
			status = HttpStatus.INTERNAL_SERVER_ERROR;
		}
		return new ResponseEntity<Map<String, Object>>(resultMap, status);
	}
	
	@PostMapping("/confirm/join")
	public ResponseEntity<Map<String, Object>> join(@RequestBody MemberDto memberDto) {
		Map<String, Object> resultMap = new HashMap<>();
		System.out.println(memberDto);
		HttpStatus status = HttpStatus.ACCEPTED;
		try {
			memberService.joinMember(memberDto);
			resultMap.put("message", "가입 성공");
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("중복아이디");
			resultMap.put("message", "가입 실패");
		}
		return new ResponseEntity<Map<String, Object>>(resultMap, status);
	}


	@PutMapping("/update")
	public ResponseEntity<Map<String, Object>> update(@RequestBody MemberDto memberDto) {
		Map<String, Object> resultMap = new HashMap<>();
		System.out.println(memberDto);
		HttpStatus status = HttpStatus.ACCEPTED;
		try {
			memberService.updateMember(memberDto);
			resultMap.put("message", "수정 성공");
			String token = jwtService.create(memberDto);
			resultMap.put("auth-token", token);
			System.out.println(resultMap);
		}catch (Exception e) {
			e.printStackTrace();
			resultMap.put("message", "수정 실패");
		}
		return new ResponseEntity<Map<String, Object>>(resultMap, status);
	}	


	@PostMapping("/quit")
	public ResponseEntity<Map<String, Object>> delete(@RequestBody MemberDto memberDto) {
		Map<String, Object> resultMap = new HashMap<>();
		System.out.println(memberDto);
		HttpStatus status = HttpStatus.ACCEPTED;
		try {
			memberService.deleteMember(memberDto.getUserid());
			resultMap.put("message", "삭제 성공");
		}catch (Exception e) {
			e.printStackTrace();
			resultMap.put("message", "삭제 실패");
		}
		return new ResponseEntity<Map<String, Object>>(resultMap, status);
	}	


}
