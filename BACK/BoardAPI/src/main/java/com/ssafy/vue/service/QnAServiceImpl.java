package com.ssafy.vue.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssafy.vue.dao.QnADAO;
import com.ssafy.vue.dto.QnA;

@Service
public class QnAServiceImpl implements QnAService {
    @Autowired
	private QnADAO qnaDao;

    @Override
	public List<QnA> retrieveQnA() {
		return qnaDao.selectQnA();
	}
    
  	@Override
	public boolean writeQnA(QnA qna) {
		return qnaDao.insertQnA(qna) == 1;
	}

	@Override
	public QnA detailQnA(int no) {
		return qnaDao.selectQnAByNo(no);
	}

	@Override
	@Transactional
	public boolean updateQnA(QnA qna) {
		return qnaDao.updateQnA(qna) == 1;
	}

	@Override
	@Transactional
	public boolean deleteQnA(int no) {
		return qnaDao.deleteQnA(no) == 1;
	}
}