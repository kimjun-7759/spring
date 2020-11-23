package kr.ync.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ync.domain.GalleryVO;
import kr.ync.mapper.GalleryMapper;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class GalleryServiceImpl implements GalleryService{
	@Autowired
	private GalleryMapper mapper;

	@Override
	public void register(GalleryVO ga) {
		// TODO Auto-generated method stub
		log.info("register......" + ga);

		mapper.insert(ga);
	}
}
