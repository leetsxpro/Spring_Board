package kr.co.service;

import java.util.List;

import kr.co.vo.BoardVO;

public interface BoardService {

	// 게시물 작성
	public void write(BoardVO boardVO) throws Exception;
	
	// 게시물 목록 출력
	public List<BoardVO> list() throws Exception;
	
	// 게시물 중 하나 클릭시
	public BoardVO read(int bno) throws Exception;
	
	// 게시물 수정
	public void update(BoardVO boardVO) throws Exception;
	
	// 게시물 삭제
	public void delete(int bno) throws Exception;
}
