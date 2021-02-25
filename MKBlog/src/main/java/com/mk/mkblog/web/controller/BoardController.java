package com.mk.mkblog.web.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mk.mkblog.common.Search;
import com.mk.mkblog.web.model.BoardVO;
import com.mk.mkblog.web.model.ReplyVO;
import com.mk.mkblog.web.service.BoardService;

@Controller
@RequestMapping(value = "/board")
public class BoardController {
	
	@Inject
	private BoardService boardService;
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	//@RequestParam、required = false -> ゲットしたパラメータがない場合、例外の処理
	@RequestMapping(value = "/getBoardList", method = RequestMethod.GET)
	public String getBoardList(Model model, @RequestParam(required = false, defaultValue = "1")int page,
			@RequestParam(required = false, defaultValue = "1")int range,
			@RequestParam(defaultValue = "title")String searchType,
			@RequestParam(required = false, defaultValue = "")String keyword,
			@ModelAttribute("search")Search search
			) throws Exception{
		
		model.addAttribute("search", search);
		search.setSearchType(searchType);
		search.setKeyword(keyword);
		
		int listCnt = boardService.getBoardListCnt(search);
		
		search.pageInfo(page, range, listCnt);
		
		model.addAttribute("pagination", search);
		model.addAttribute("boardList", boardService.getBoardList(search));
		return "/board/index";
	}
	
	@RequestMapping("/boardForm")
	public String boardForm(@ModelAttribute("BoardVO")BoardVO boardVO, Model model) {
		return "/board/boardForm";
	}
	
	@RequestMapping(value = "/saveBoard", method = RequestMethod.POST)
	public String saveBoard(@ModelAttribute("BoardVO")BoardVO boardVO, @RequestParam("mode")String mode,
			RedirectAttributes rttr) throws Exception{
		
		if(mode.equals("edit")) {
			boardService.updateBoard(boardVO);
		} else {
			boardService.insertBoard(boardVO);
		}
		return "redirect:/board/getBoardList";
	}
	
	@RequestMapping(value = "/getBoardContent", method = RequestMethod.GET)
	public String getBoardContent(Model model, @RequestParam("bid")int bid) throws Exception{
		model.addAttribute("boardContent", boardService.getBoardContent(bid));
		model.addAttribute("replyVO", new ReplyVO());
		return "board/boardContent";
	}
	
	@RequestMapping(value = "/editForm", method = RequestMethod.GET)
	public String editForm(@ModelAttribute("BoardVO")BoardVO boardVO, @RequestParam("bid")int bid, 
			@RequestParam("mode")String mode, Model model) throws Exception{
		model.addAttribute("boardContent", boardService.getBoardContent(bid));
		model.addAttribute("mode", mode);
		model.addAttribute("boardVO", new BoardVO());
		return "board/boardForm";
	}
	
	@RequestMapping(value = "/deleteBoard", method = RequestMethod.GET)
	public String deleteBoard(@RequestParam("bid")int bid,RedirectAttributes rttr) throws Exception{
		boardService.deleteBoard(bid);
		return "redirect:/board/getBoardList";
	}
	
	
	 @ExceptionHandler(RuntimeException.class) 
	 public String exceptionHandler(Model model, Exception e) { 
		 logger.info("exception : " +
		 e.getMessage()); return "error/exception"; 
	}
	 
	 @ResponseBody //　非同期化の為
	 @RequestMapping(value="/getReplyList", method = RequestMethod.POST)
	 public List<ReplyVO> getReplyList(int bid) throws Exception{
		 return boardService.getReplyList(bid);
	 }
	 
}
