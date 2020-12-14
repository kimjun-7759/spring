package kr.ync.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.ync.domain.CommentVO;
import kr.ync.domain.Criteria;
import kr.ync.domain.ReplyVO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class CommentMapperTests {
	// 테스트 전에 해당 번호의 게시물이 존재하는지 반드시 확인할 것
	private Long[] board_idxArr = {809L };

	@Setter(onMethod_ = @Autowired)
	private CommentMapper mapper;
	
//	@Test
//	public void testInsert() {
//
//		CommentVO co = new CommentVO(); 
//		
//		co.setBoard_idx(809L);
//		co.setUserid("bae");
//		co.setComments("댓글입니다111.");
//
//		
//		mapper.insert(co);
//
//		log.info(co);
//	}

//	@Test
//	public void testRead() {
//
//		Long board_idx = 1L;
//		CommentVO vo = mapper.read(board_idx );
//
//		log.info(vo);
//
//	}
	
//	@Test
//	public void testDelete() {
//
//		Long targetRno = 1L;
//
//		mapper.delete(targetRno);
//	}
	
//	@Test
//	public void testUpdate() {
//
//		Long targetRno = 2L;
//
//		CommentVO vo = mapper.read(targetRno);
//
//		vo.setComments("Update Reply ");
//
//		int count = mapper.update(vo);
//
//		log.info("UPDATE COUNT: " + count);
//	}
	
	@Test
	public void testList() {

		Criteria cri = new Criteria();

		List<CommentVO> replies = mapper.getList(cri, board_idxArr[0]);

		replies.forEach(reply -> log.info(reply));

	}
	
//	@Test
//	public void testGetListWithPaging() {
//		
//		// 1page 10개 출력
//		Criteria cri = new Criteria(1, 10);
//
//		List<CommentVO> replies = mapper.getListWithPaging(cri,809L);
//
//		replies.forEach(reply -> log.info(reply));
//
//	}
}
