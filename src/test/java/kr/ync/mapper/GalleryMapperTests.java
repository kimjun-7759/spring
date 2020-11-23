package kr.ync.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import kr.ync.domain.GalleryVO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringRunner.class)
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml" })
@Log4j
public class GalleryMapperTests {
	@Setter(onMethod_ = @Autowired)
	private GalleryMapper mapper;
	
	@Test
	public void testInsert() {

		GalleryVO ga = new GalleryVO(); 
		

		ga.setAdmin_image("image.jpg");
		ga.setMain_image("main.jpg");
		ga.setImage_type("1");
		
		mapper.insert(ga);

		log.info(ga);
	}
}
