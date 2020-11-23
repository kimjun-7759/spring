package kr.ync.mapper;

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
@Log4j
public class CommentMapperTests {

	@Setter(onMethod_ = @Autowired)
	private CommentMapper mapper;
	
	@Test
	public void testInsert() {

		CommentVO co = new CommentVO(); 
		
		co.setBoard_idx(1);
		co.setId("www");
		co.setComments("댓글입니다.");

		
		mapper.insert(co);

		log.info(co);
	}

}
