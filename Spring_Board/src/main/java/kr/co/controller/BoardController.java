package kr.co.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.service.BoardService;
import kr.co.vo.BoardVO;

@Controller
@RequestMapping("/board/*")
public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Inject
	BoardService service;
	
	// 게시물 작성 화면
	@RequestMapping(value="/board/writeView", method=RequestMethod.GET)
	public void writeView() throws Exception{
		logger.info("writeView");
	}
	
	// 게시물 생성
	@RequestMapping(value="/board/write", method=RequestMethod.POST)
	public String write(BoardVO boardVO) throws Exception{
		logger.info("write");
		
		service.write(boardVO);
		
		return "redirect:/board/list";
	}
	
	// 게시물 목록 출력
	@RequestMapping(value="/board/list", method=RequestMethod.GET)
	public String list(Model model) throws Exception{
		logger.info("list");
		
		model.addAttribute("list", service.list());
		
		return "board/list";
	}
	
	// 게시물 중 하나 클릭시
	@RequestMapping(value="/board/readView", method=RequestMethod.GET)
	public String read(BoardVO boardVO, Model model) throws Exception{
		logger.info("read");
		
		model.addAttribute("read", service.read(boardVO.getBno()));
		
		return "board/readView";
	}
	
	// 게시물 수정 화면
	@RequestMapping(value="/board/updateView", method=RequestMethod.POST)
	public String updateView(BoardVO boardVO, Model model) throws Exception{
		logger.info("updateView");
		
		model.addAttribute("update", service.read(boardVO.getBno()));
		
		return "board/updateView";
	}
	
	// 게시물 수정
	@RequestMapping(value="/board/update", method=RequestMethod.POST)
	public String update(BoardVO boardVO) throws Exception{
		logger.info("update");
		
		service.update(boardVO);
		
		return "redirect:/board/list";
	}
	
	// 게시물 삭제
	@RequestMapping(value="/board/delete", method=RequestMethod.POST)
	public String delete(int bno) throws Exception{
		logger.info("delete");
		
		service.delete(bno);
		
		return "redirect:/board/list";
	}
}
