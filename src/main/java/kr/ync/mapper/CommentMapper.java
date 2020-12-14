package kr.ync.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.ync.domain.CommentVO;
import kr.ync.domain.Criteria;

public interface CommentMapper {
	public int insert(CommentVO vo);

	public CommentVO read(Long board_idx);

	public int delete(Long board_idx);

	public int update(CommentVO comments);
	
	public List<CommentVO> getList(@Param("cri") Criteria cri, @Param("board_idx") Long board_idx);
	
	public List<CommentVO> getListWithPaging(@Param("cri") Criteria cri, @Param("board_idx") Long board_idx);

	public int getCountByBoard_idx(Long board_idx);
}
