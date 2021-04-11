package com.ssafy.vue.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.vue.dto.Board;
import com.ssafy.vue.dto.Guguncode;
import com.ssafy.vue.service.BoardService;
import com.ssafy.vue.service.GuguncodeService;
import com.ssafy.vue.dto.QnA;
import com.ssafy.vue.service.QnAService;

import io.swagger.annotations.ApiOperation;

//http://localhost:9999/vue/swagger-ui.html
@CrossOrigin("*")
@RestController
@RequestMapping("/api")
public class BoardController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	private static final String SUCCESS = "success";
	private static final String FAIL = "fail";

	@Autowired
	private BoardService boardService;

	@ApiOperation(value = "모든 게시글의 정보를 반환한다.", response = List.class)
	@GetMapping("/board")
	public ResponseEntity<List<Board>> retrieveBoard() throws Exception {
		return new ResponseEntity<List<Board>>(boardService.retrieveBoard(), HttpStatus.OK);
	}

	@ApiOperation(value = "글번호에 해당하는 게시글의 정보를 반환한다.", response = Board.class)
	@GetMapping("/board/{no}")
	public ResponseEntity<Board> detailBoard(@PathVariable int no) {
		return new ResponseEntity<Board>(boardService.detailBoard(no), HttpStatus.OK);
	}

	@ApiOperation(value = "새로운 게시글 정보를 입력한다. 그리고 DB입력 성공여부에 따라 'success' 또는 'fail' 문자열을 반환한다.", response = String.class)
	@PostMapping("/board")
	public ResponseEntity<String> writeBoard(@RequestBody Board board) {
		if (boardService.writeBoard(board)) {
			return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
		}
		return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
	}

	@ApiOperation(value = "글번호에 해당하는 게시글의 정보를 수정한다. 그리고 DB수정 성공여부에 따라 'success' 또는 'fail' 문자열을 반환한다.", response = String.class)
	@PutMapping("/board/{no}")
	public ResponseEntity<String> updateBoard(@RequestBody Board board) {
		if (boardService.updateBoard(board)) {
			return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
		}
		return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
	}

	@ApiOperation(value = "글번호에 해당하는 게시글의 정보를 삭제한다. 그리고 DB삭제 성공여부에 따라 'success' 또는 'fail' 문자열을 반환한다.", response = String.class)
	@DeleteMapping("/board/{no}")
	public ResponseEntity<String> deleteBoard(@PathVariable int no) {
		if (boardService.deleteBoard(no)) {
			return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
		}
		return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
	}

	///////////////
	@Autowired
	private QnAService qnaService;

	@ApiOperation(value = "모든 게시글의 정보를 반환한다.", response = List.class)
	@GetMapping("/QnA")
	public ResponseEntity<List<QnA>> retrieveQnA() throws Exception {
		return new ResponseEntity<List<QnA>>(qnaService.retrieveQnA(), HttpStatus.OK);
	}

	@ApiOperation(value = "글번호에 해당하는 게시글의 정보를 반환한다.", response = QnA.class)
	@GetMapping("/QnA/{no}")
	public ResponseEntity<QnA> detailQnA(@PathVariable int no) {
		return new ResponseEntity<QnA>(qnaService.detailQnA(no), HttpStatus.OK);
	}

	@ApiOperation(value = "새로운 게시글 정보를 입력한다. 그리고 DB입력 성공여부에 따라 'success' 또는 'fail' 문자열을 반환한다.", response = String.class)
	@PostMapping("/QnA")
	public ResponseEntity<String> writeQnA(@RequestBody QnA qna) {
		if (qnaService.writeQnA(qna)) {
			return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
		}
		return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
	}

	@ApiOperation(value = "글번호에 해당하는 게시글의 정보를 수정한다. 그리고 DB수정 성공여부에 따라 'success' 또는 'fail' 문자열을 반환한다.", response = String.class)
	@PutMapping("/QnA/{no}")
	public ResponseEntity<String> updateQnA(@RequestBody QnA qna) {
		if (qnaService.updateQnA(qna)) {
			return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
		}
		return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
	}

	@ApiOperation(value = "글번호에 해당하는 게시글의 정보를 삭제한다. 그리고 DB삭제 성공여부에 따라 'success' 또는 'fail' 문자열을 반환한다.", response = String.class)
	@DeleteMapping("/QnA/{no}")
	public ResponseEntity<String> deleteQnA(@PathVariable int no) {
		if (qnaService.deleteQnA(no)) {
			return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
		}
		return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
	}
	
	///////////////
	@Autowired
	private GuguncodeService guguncodeService;
	
	@ApiOperation(value = "", response = Guguncode.class)
	@GetMapping("/apt/{gugun_name}")
	public ResponseEntity<String> selectGuguncode(@PathVariable String gugun_name) {
		System.out.println(gugun_name);
		String temp = guguncodeService.selectGuguncode(gugun_name);
		System.out.println(temp);
		return new ResponseEntity<String>(temp, HttpStatus.OK);
	}
	
	@ApiOperation(value = "gugun_code 를 통해 치안등급을 가져옵니다", response = String.class)
  @GetMapping("/apt/degree/{gugun_code}")
  public ResponseEntity<String> getSafetyDegree(@PathVariable String gugun_code) {
    System.out.println(gugun_code);
    String temp = guguncodeService.selectSafetyDegreeValue(gugun_code);
    System.out.println(temp);
    return new ResponseEntity<String>(temp, HttpStatus.OK);
  }

}