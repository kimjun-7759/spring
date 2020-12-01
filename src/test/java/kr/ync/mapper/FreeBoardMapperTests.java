package kr.ync.mapper;



import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.ync.domain.Criteria;
import kr.ync.domain.FreeBoardVO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class FreeBoardMapperTests {

	@Setter(onMethod_ = @Autowired)
	private FreeBoardMapper mapper;
	
//	@Test
//	public void testInsert() {
//
//		FreeBoardVO fb = new FreeBoardVO(); 
//		
//
//		fb.setTitle("신동완6");
//		fb.setContent("제발 되게 해주세요ㅠ");
//		fb.setId("shin");
//		fb.setImage1("image1");
//		fb.setImage2("image2");
//		fb.setImage3("image3");
//		
//		mapper.insertSelectKey(fb);
//
//		log.info(fb);
//	}
	
//	@Test
//	public void testGetList() {
//
//		mapper.getList().forEach(freeboard -> log.info("freeboard 객체 내용 : " + freeboard));
//
//	}

//	@Test
//	public void testRead() {
//
//		// 존재하는 게시물 번호로 테스트
//		FreeBoardVO board = mapper.read(4L);
//
//		log.info(board);
//
//	}
	
//	@Test
//	public void testDelete() {
//
//		log.info("DELETE COUNT: " + mapper.delete(5L));
//	}
	
//	@Test
//	public void testUpdate() {
//
//		FreeBoardVO board = new FreeBoardVO();
//		// 실행전 존재하는 번호인지 확인할 것
//		board.setBoard_idx(6);
//		board.setTitle("수정된 제목");
//		board.setContent("수정된 내용");
//		board.setId("shin");
//		board.setImage1("image2");
//		board.setImage2("image1");
//		board.setImage3("image4");
//
//		int count = mapper.update(board);
//		log.info("UPDATE COUNT: " + count);
//
//	}
	
//	@Test
//	public void testPaging() {
//
//		Criteria cri = new Criteria();
//		
//	    //10개씩 3페이지 
//	    cri.setPageNum(2);
//	    cri.setAmount(10);
//
//
//		List<FreeBoardVO> list = mapper.getListWithPaging(cri);
//
//		list.forEach(freeboard -> log.info(freeboard));
//
//	}
}
