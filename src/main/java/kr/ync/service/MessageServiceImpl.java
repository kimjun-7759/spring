package kr.ync.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ync.domain.MessageVO;
import kr.ync.mapper.MessageMapper;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class MessageServiceImpl implements MessageService{
	@Autowired
	private MessageMapper mapper;
	
	@Override
	public void register(MessageVO Ms) {
		// TODO Auto-generated method stub
		log.info("register......" + Ms);

		mapper.insert(Ms);
	}

}
