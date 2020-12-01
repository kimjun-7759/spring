package kr.ync.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.ync.domain.MemberVO;
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
	public void testRead() {

		PMemberVO vo = member.read("shin");

		log.info(vo);
		
		vo.getAuth().forEach(authVO -> log.info(authVO));

	}
	
}
