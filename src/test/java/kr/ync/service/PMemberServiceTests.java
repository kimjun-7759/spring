package kr.ync.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.ync.domain.PMemberVO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
// Java Config
// @ContextConfiguration(classes = {org.zerock.config.RootConfig.class} )
@Log4j
public class PMemberServiceTests {
	
	@Setter(onMethod_ = { @Autowired })
	private PMemberService service;
	
	@Test
	public void testRegister() {

		PMemberVO pm = new PMemberVO();
		pm.setId("www121");
		pm.setPwd("www");
		pm.setEmail("www@naver.com");
		pm.setAddress("대구시");
		pm.setTel("01012341234");

		service.register(pm);

		log.info("생성된 맴버의 아이디: " + pm.getId());
	}
}
