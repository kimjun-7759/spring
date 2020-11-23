package kr.ync.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import kr.ync.domain.BoardVO;
import kr.ync.domain.Criteria;
import kr.ync.domain.FreeBoardVO;

public interface FreeBoardMapper {
	@Select("select * from freeboard where board_idx > 0")
	public List<FreeBoardVO> getList();
	
	public void insert(FreeBoardVO fb);
	
	public Integer insertSelectKey(FreeBoardVO board);
	
	public FreeBoardVO read(Long board_idx);
	
	public int delete(Long bno);
	
	public int update(FreeBoardVO board);

	public List<FreeBoardVO> getListWithPaging(Criteria cri);

	public int getTotalCount(Criteria cri);
//	
//	// 2개 이상의 파라미터를 넘기기위해 @Param 사용. 댓글 추가/삭제 시 amount에 1/-1 값
//	public void updateReplyCnt(@Param("bno") Long bno, @Param("amount") int amount);
}
