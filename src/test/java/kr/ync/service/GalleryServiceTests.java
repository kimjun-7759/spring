package kr.ync.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.ync.domain.GalleryVO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
// Java Config
// @ContextConfiguration(classes = {org.zerock.config.RootConfig.class} )
@Log4j
public class GalleryServiceTests {
	@Setter(onMethod_ = { @Autowired })
	private GalleryService service;
	
	@Test
	public void testRegister() {

		GalleryVO ga = new GalleryVO();
		ga.setAdmin_image("admin.jpg");
		ga.setMain_image("main.jpg");
		ga.setImage_type("2");
		
		service.register(ga);

		log.info("생성된 게시물의 번호: " + ga.getGallery_idx());
	}
}
