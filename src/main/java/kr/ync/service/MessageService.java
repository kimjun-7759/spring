package kr.ync.service;

import java.util.List;


import kr.ync.domain.Criteria;
import kr.ync.domain.MessageVO;

public interface MessageService {
	
	// 글 등록
	public void register(MessageVO Ms);
	
//	// 글 상세보기
//	public BoardVO get(Long bno);
//	
//	// 글 수정
//	public boolean modify(BoardVO board);
//	
//	// 글 삭제
//	public boolean remove(Long bno);
//	
//	// 전체 글 목록
//	public List<BoardVO> getList();
//	
//	// 글 목록 페이징 
//	public List<BoardVO> getListWithPaging(Criteria cri);
//
//	//추가
//	public int getTotal(Criteria cri);

}
