package kr.ync.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.ync.domain.CommentVO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
// Java Config
// @ContextConfiguration(classes = {org.zerock.config.RootConfig.class} )
@Log4j
public class CommnetServiceTests {
	@Setter(onMethod_ = { @Autowired })
	private CommentService service;
	
	@Test
	public void testRegister() {

//		CommentVO co = new CommentVO();
//		co.setBoard_idx(1);
//		co.setId("www");
//		co.setComments("서비스 글 등록 테스트");

//		service.register(co);
//
//		log.info("생성된 게시물의 번호: " + co.getIdx());
	}
}
