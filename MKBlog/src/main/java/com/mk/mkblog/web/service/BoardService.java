package com.mk.mkblog.web.service;

import java.util.List;

import com.mk.mkblog.web.model.BoardVO;

public interface BoardService {
	public List<BoardVO> getBoardList() throws Exception;
	public void insertBoard(BoardVO boardVO) throws Exception;
	public BoardVO getBoardContent(int bid) throws Exception;
	public void updateBoard(BoardVO boardVO) throws Exception; 
	public void deleteBoard(int bid) throws Exception;
}
