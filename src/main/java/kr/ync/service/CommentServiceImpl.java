package kr.ync.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.ync.domain.CommentPageDTO;
import kr.ync.domain.CommentVO;
import kr.ync.domain.Criteria;
import kr.ync.domain.ReplyPageDTO;
import kr.ync.domain.ReplyVO;
import kr.ync.mapper.BoardMapper;
import kr.ync.mapper.CommentMapper;
import kr.ync.mapper.FreeBoardMapper;
import kr.ync.mapper.ReplyMapper;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class CommentServiceImpl implements CommentService{
	
	@Autowired
	private CommentMapper mapper;
	
	@Autowired
	private FreeBoardMapper freeboardMapper;
		
	@Transactional
	@Override
	public int register(CommentVO vo) {
		log.info("register......" + vo);
		freeboardMapper.updateReplyCnt(vo.getBoard_idx(), 1);
		return mapper.insert(vo);
	}

	@Override
	public CommentVO get(Long comment_idx) {
		log.info("get......" + comment_idx);
		return mapper.read(comment_idx);
	}

	@Override
	public int modify(CommentVO vo) {
		log.info("modify......" + vo);
		return mapper.update(vo);
	}
	
	@Transactional
	@Override
	public int remove(Long comment_idx) {
		log.info("remove...." + comment_idx);
		
		CommentVO vo = mapper.read(comment_idx);
		freeboardMapper.updateReplyCnt(vo.getBoard_idx(), -1);
		return mapper.delete(comment_idx);
	}

	@Override
	public List<CommentVO> getList(Criteria cri, Long board_idx) {
		log.info("get Reply List of a Board " + board_idx);
		return mapper.getListWithPaging(cri, board_idx);
	}
  
	@Override
	public CommentPageDTO getListWithPaging(Criteria cri, Long board_idx) {
       
		return new CommentPageDTO(
				mapper.getCountByBoard_idx(board_idx), 
				mapper.getListWithPaging(cri, board_idx));
	}

}
