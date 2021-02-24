package com.mk.mkblog.web.dao;

import java.util.List;

import com.mk.mkblog.common.Pagination;
import com.mk.mkblog.common.Search;
import com.mk.mkblog.web.model.BoardVO;

public interface BoardDAO {
	public List<BoardVO> getBoardList(Search search) throws Exception;
	public BoardVO getBoardContent(int bid) throws Exception;
	public int insertBoard(BoardVO boardVO) throws Exception;
	public int updateBoard(BoardVO boardVO) throws Exception;
	public int deleteBoard(int bid) throws Exception;
	public int updateViewCnt(int bid) throws Exception;
	public int getBoardListCnt(Search search) throws Exception;
}


