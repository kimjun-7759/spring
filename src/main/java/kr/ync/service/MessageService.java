package kr.ync.service;

import java.util.List;


import kr.ync.domain.Criteria;
import kr.ync.domain.MessageVO;

public interface MessageService {
	
	// 글 등록
	public void m_register(MessageVO mss);
	
	// 글 상세보기
	public MessageVO m_get(Long message_idx);

	// 글 삭제
	public boolean remove(Long message_idx);
	
	// 전체 글 목록
	public List<MessageVO> getList();
	
	// 글 목록 페이징 
	public List<MessageVO> getListWithPaging(Criteria cri);

	public int getTotal(Criteria cri);
}
