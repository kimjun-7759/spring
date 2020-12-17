package kr.ync.service;

import java.util.List;

import kr.ync.domain.Criteria;
import kr.ync.domain.FreeBoardVO;

public interface FreeBoardService {
	
	// 글 등록
	public void f_register(FreeBoardVO board);
	
	// 글 상세보기
	public FreeBoardVO f_get(int board_idx);
	
	// 글 수정
	public boolean modify(FreeBoardVO board);
	
	// 글 삭제
	public boolean remove(int bno);
	
	// 전체 글 목록
	public List<FreeBoardVO> getList();
	
	// 글 목록 페이징 
	public List<FreeBoardVO> getListWithPaging(Criteria cri);

	//추가
	public int getTotal(Criteria cri);

}
