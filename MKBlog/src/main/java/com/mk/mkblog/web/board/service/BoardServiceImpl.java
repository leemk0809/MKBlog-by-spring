package com.mk.mkblog.web.board.service;

import java.util.List;
import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mk.mkblog.common.Pagination;
import com.mk.mkblog.common.Search;
import com.mk.mkblog.web.board.dao.BoardDAO;
import com.mk.mkblog.web.board.model.BoardVO;
import com.mk.mkblog.web.board.model.ReplyVO;

@Service
public class BoardServiceImpl implements BoardService{
	
	@Inject
	private BoardDAO boardDAO;
	
	@Override
	public List<BoardVO> getBoardList(Search search) throws Exception{
		return boardDAO.getBoardList(search);
	}

	@Override
	public void insertBoard(BoardVO boardVO) throws Exception {
		//臨時のカテゴリー（まだ、作らなかったんです。）
		boardVO.setCate_cd("日常");
		boardDAO.insertBoard(boardVO);
	}

	@Transactional
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

	@Transactional
	@Override
	public void deleteBoard(int bid) throws Exception {
		boardDAO.deleteBoard(bid);
	}

	@Override
	public int getBoardListCnt(Search search) throws Exception {
		return boardDAO.getBoardListCnt(search);
	}

	@Override
	public List<ReplyVO> getReplyList(int bid) throws Exception {
		return boardDAO.getReplyList(bid);
	}

	@Override
	public int saveReply(ReplyVO replyVO) throws Exception {
		return boardDAO.saveReply(replyVO);
	}

	@Override
	public int updateReply(ReplyVO replyVO) throws Exception {
		return boardDAO.updateReply(replyVO);
	}

	@Override
	public int deleteReply(int rid) throws Exception {
		return boardDAO.deleteReply(rid);
	}
}
