package com.mk.mkblog.web.service;

import java.util.List;
import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.mk.mkblog.web.dao.BoardDAO;
import com.mk.mkblog.web.model.BoardVO;

@Service
public class BoardServiceImpl implements BoardService{
	
	@Inject
	private BoardDAO boardDAO;
	
	@Override
	public List<BoardVO> getBoardList() throws Exception{
		return boardDAO.getBoardList();
	}

	@Override
	public void insertBoard(BoardVO boardVO) throws Exception {
		//臨時のカテゴリー（まだ、作らなかったんです。）
		boardVO.setCate_cd("日常");
		boardDAO.insertBoard(boardVO);
	}

	@Override
	public BoardVO getBoardContent(int bid) throws Exception {
		boardDAO.updateViewCnt(bid);
		return boardDAO.getBoardContent(bid);
	}

	@Override
	public void updateBoard(BoardVO boardVO) throws Exception {
		//臨時のカテゴリー（まだ、作らなかったんです。）
		boardVO.setCate_cd("日常");
		boardDAO.updateBoard(boardVO);		
	}

	@Override
	public void deleteBoard(int bid) throws Exception {
		boardDAO.deleteBoard(bid);
	}
}
