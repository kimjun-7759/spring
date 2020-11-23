package kr.ync.mapper;

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
@Log4j
public class PMemberMapperTests {

	@Setter(onMethod_ = @Autowired)
	private PMemberMapper member;
	
	@Test
	public void testInsert() {

		PMemberVO pm = new PMemberVO(); 
		
		pm.setId("kkk");
		pm.setPwd("1234");
		pm.setEmail("wwoo7759@naver.com");
		pm.setAddress("daegu");
		pm.setTel("01012345678");
		

		member.insert(pm);

		log.info(pm);
	}
	
}
