package kr.ync.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import kr.ync.domain.Criteria;
import kr.ync.domain.MessageVO;


public interface MessageMapper {
	
	
	public List<MessageVO> getList();
	
	public void insert(MessageVO ms);

	public Integer insertSelectKey(MessageVO board);
	
	public MessageVO read(Long message_idx); 
	
	public int delete(Long message_idx);
	
	public List<MessageVO> getListWithPaging(Criteria cri);

	public int getTotalCount(Criteria cri);

	
}
