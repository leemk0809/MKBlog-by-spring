package com.mk.mkblog.web.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.mk.mkblog.common.Pagination;
import com.mk.mkblog.common.Search;
import com.mk.mkblog.web.model.BoardVO;
import com.mk.mkblog.web.model.ReplyVO;

@Repository
public class BoardDAOImpl implements BoardDAO{

	@Inject
	private SqlSession sqlSession;
	
	@Override
	public List<BoardVO> getBoardList(Search search) throws Exception {
		return sqlSession.selectList("com.mk.mkBlog.web.board.boardMapper.getBoardList", search);
	}

	@Override
	public BoardVO getBoardContent(int bid) throws Exception {
		return sqlSession.selectOne("com.mk.mkBlog.web.board.boardMapper.getBoardContent", bid);
	}

	@Override
	public int insertBoard(BoardVO boardVO) throws Exception {
		return sqlSession.insert("com.mk.mkBlog.web.board.boardMapper.insertBoard", boardVO);
	}

	@Override
	public int updateBoard(BoardVO boardVO) throws Exception {
		return sqlSession.update("com.mk.mkBlog.web.board.boardMapper.updateBoard", boardVO);
	}

	@Override
	public int deleteBoard(int bid) throws Exception {
		return sqlSession.delete("com.mk.mkBlog.web.board.boardMapper.deleteBoard", bid);
	}

	@Override
	public int updateViewCnt(int bid) throws Exception {
		return sqlSession.update("com.mk.mkBlog.web.board.boardMapper.updateViewCnt", bid);
	}

	@Override
	public int getBoardListCnt(Search search) throws Exception {
		return sqlSession.selectOne("com.mk.mkBlog.web.board.boardMapper.getBoardListCnt", search);
	}

	@Override
	public List<ReplyVO> getReplyList(int bid) throws Exception {
		return sqlSession.selectList("com.mk.mkblog.web.board.replyMapper.getReplyList", bid);
	}

	@Override
	public int saveReply(ReplyVO replyVO) throws Exception {
		return sqlSession.insert("com.mk.mkblog.web.board.replyMapper.saveReply", replyVO);
	}

	@Override
	public int updateReply(ReplyVO replyVO) throws Exception {
		return sqlSession.update("com.mk.mkblog.web.board.replyMapper.updateReply", replyVO);
	}

	@Override
	public int deleteReply(int rid) throws Exception {
		return sqlSession.delete("com.mk.mkblog.web.board.replyMapper.deleteReply", rid);
	}

}
