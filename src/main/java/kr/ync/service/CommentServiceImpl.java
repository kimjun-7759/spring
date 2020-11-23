package kr.ync.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import kr.ync.domain.CommentVO;
import kr.ync.mapper.CommentMapper;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class CommentServiceImpl implements CommentService{

	@Autowired
	private CommentMapper mapper;
	
	@Override
	public void register(CommentVO co) {
		// TODO Auto-generated method stub
		log.info("register......" + co);

		mapper.insert(co);
	}

}
