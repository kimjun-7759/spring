package kr.ync.service;

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
// Java Config
// @ContextConfiguration(classes = {org.zerock.config.RootConfig.class} )
@Log4j
public class FreeBoardServiceTests {

	@Setter(onMethod_ = { @Autowired })
	private FreeBoardService service;
//	@Test
//	public void testGet() {
//
//		log.info(service.f_get(384L));
//	}
//	@Test
//	public void testRegister() {
//
//		FreeBoardVO fb = new FreeBoardVO();
//		fb.setTitle("새로 작성하는 글55555");
//		fb.setContent("새로 작성하는 내용3");
//		fb.setId("shin");
//		fb.setImage1("image1");
//		fb.setImage2("image2");
//		fb.setImage3("image3");
//
//		service.register(fb);
//
//		log.info("생성된 게시물의 번호: " + fb.getBoard_idx());
//	}
	
//	@Test
//	public void testGetList() {
//		service.getList().forEach(freeboard -> log.info(freeboard));
//	}
	
//	@Test
//	public void testGet() {
//		log.info(service.get(6L));
//	}
	
//	@Test
//	public void testDelete() {
//		log.info("REMOVE RESULT : " + service.get(11L));
//	}
//	
//	@Test
//	public void testUpdate() {
//		FreeBoardVO board = service.get(6L);
//		
//		if(board == null) {
//			return;
//		}
//		
//		board.setTitle("제목 수정하겠습니다.");
//		log.info("MODIFY RESULT : " + service.modify(board));
//	}
//	@Test
//	public void testGetListWithPaging() {
//
//		service.getListWithPaging(new Criteria(1, 10)).forEach(freeboard -> log.info(freeboard));
//	}
}
