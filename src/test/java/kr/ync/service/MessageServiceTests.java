package kr.ync.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.ync.domain.MessageVO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
// Java Config
// @ContextConfiguration(classes = {org.zerock.config.RootConfig.class} )
@Log4j
public class MessageServiceTests {
	@Setter(onMethod_ = { @Autowired })
	private MessageService service;
	
	@Test
	public void testRegister() {

		MessageVO ms = new MessageVO();
		ms.setId("www");
		ms.setContent("메세지 시도123");
		ms.setReceivce_id("admin");
		
		service.register(ms);

		log.info("생성된 게시물의 번호: " + ms.getMessage_idx());
	}
}
