package kr.ync.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import kr.ync.domain.FreeBoardVO;
import kr.ync.domain.MemberVO;
import kr.ync.domain.MessageVO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringRunner.class)
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml" })
@Log4j
public class MessageMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private MessageMapper ms;
	
	@Test
	public void testInsert() {

		MessageVO mm = new MessageVO(); 
		
		
		mm.setId("www");
		mm.setContent("shindongwan123");
		mm.setReceivce_id("admin");
		
		ms.insert(mm);

		log.info(mm);
	}

}
