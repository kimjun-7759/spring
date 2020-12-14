package kr.ync.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ync.domain.Criteria;
import kr.ync.domain.MessageVO;
import kr.ync.mapper.MessageMapper;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class MessageServiceImpl implements MessageService{
	@Autowired
	private MessageMapper mapper;
	
	@Override
	public void m_register(MessageVO Ms) {
		// TODO Auto-generated method stub
		log.info("register......" + Ms);

		mapper.insert(Ms);
	}
	
	@Override
	public MessageVO m_get(Long message_idx) {
		// TODO Auto-generated method stub
		log.info("get......" + message_idx);

		return mapper.read(message_idx);
	}
	
	@Override
	public boolean remove(Long message_idx) {
		log.info("remove...." + message_idx);

		return mapper.delete(message_idx) == 1;
	}
	
	 @Override
	 public List<MessageVO> getList() {
	
		 log.info("getList..........");
		
		 return mapper.getList();
	 }

	@Override
	public List<MessageVO> getListWithPaging(Criteria cri) {
		
		log.info("get List with criteria: " + cri);

		return mapper.getListWithPaging(cri);
	}
	
	@Override
	public int getTotal(Criteria cri) {

		log.info("get total count");
		return mapper.getTotalCount(cri);
	}


}
