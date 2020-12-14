package kr.ync.service;

import java.util.List;

import kr.ync.domain.CommentPageDTO;
import kr.ync.domain.CommentVO;
import kr.ync.domain.Criteria;

public interface CommentService {
	// 글 등록
	public int register(CommentVO vo);

	public CommentVO get(Long comment_idx);

	public List<CommentVO> getList(Criteria cri, Long board_idx);

	public CommentPageDTO getListWithPaging(Criteria cri, Long board_idx);

	public int modify(CommentVO vo);

	public int remove(Long comment_idx);
}