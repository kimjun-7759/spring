package kr.ync.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import kr.ync.domain.Criteria;
import kr.ync.domain.ReplyVO;
import lombok.extern.log4j.Log4j;

@RunWith(SpringRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
// Java Config
// @ContextConfiguration(classes = { org.zerock.config.PersistenceConfig.class
// })
@Log4j
public class ReplyMapperTests {

	// 테스트 전에 해당 번호의 게시물이 존재하는지 반드시 확인할 것
	private Long[] bnoArr = { 2445061L, 134L, 132L, 133L, 135L };

	@Autowired
	private ReplyMapper mapper;

//	@Test
//	public void testCreate() {
//
//		IntStream.rangeClosed(1, 10).forEach(i -> {
//
//			ReplyVO vo = new ReplyVO();
//
//			// 게시물의 번호
//			vo.setBno(bnoArr[i % 5]);
//			vo.setReply("댓글 테스트 " + i);
//			vo.setReplyer("replyer" + i);
//
//			mapper.insert(vo);
//		});
//
//	}

//	@Test
//	public void testRead() {
//
//		Long targetRno = 5L;
//
//		ReplyVO vo = mapper.read(targetRno);
//
//		log.info(vo);
//
//	}

//	@Test
//	public void testMapper() {
//
//		log.info("mapper====" + mapper);
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
//		Long targetRno = 10L;
//
//		ReplyVO vo = mapper.read(targetRno);
//
//		vo.setReply("Update Reply ");
//
//		int count = mapper.update(vo);
//
//		log.info("UPDATE COUNT: " + count);
//	}

//	@Test
//	public void testGetList() {
//
//		Criteria cri = new Criteria();
//
//		List<ReplyVO> replies = mapper.getList(cri, bnoArr[0]);
//
//		replies.forEach(reply -> log.info(reply));
//
//	}
	
	// 테스트 전에 해당 번호의 게시물이 존재하는지 반드시 확인할 것
	@Test
	public void testGetListWithPaging() {
		
		// 1page 10개 출력
		Criteria cri = new Criteria(1, 10);

		List<ReplyVO> replies = mapper.getListWithPaging(cri,2445061L);

		replies.forEach(reply -> log.info(reply));

	}

}
