package kr.ync.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ync.domain.BoardVO;
import kr.ync.domain.Criteria;
import kr.ync.domain.FreeBoardVO;
import kr.ync.mapper.FreeBoardMapper;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class FreeBoardServiceImpl implements FreeBoardService{
	@Autowired
	private FreeBoardMapper mapper;
	
	@Override
	public void f_register(FreeBoardVO Freeboard) {
		// TODO Auto-generated method stub
		log.info("register......" + Freeboard);

		//mapper.insert(Freeboard);
		mapper.insertSelectKey(Freeboard);
	}

	@Override
	public FreeBoardVO f_get(Long board_idx) {

		log.info("get......" + board_idx);

		return mapper.read(board_idx);

	}

	@Override
	public boolean modify(FreeBoardVO board) {

		log.info("modify......" + board);
		
		// SQL 성공 시 <update tag에서 update 된 갯수를 리턴. 따라서 mapper.update(board)의 값은 1이됨. 
		// return true 가 됨.
		return mapper.update(board) == 1;
	}

	@Override
	public boolean remove(Long bno) {

		log.info("remove...." + bno);

		return mapper.delete(bno) == 1;
	}

	 @Override
	 public List<FreeBoardVO> getList() {
	
		 log.info("getList..........");
		
		 return mapper.getList();
	 }

	@Override
	public List<FreeBoardVO> getListWithPaging(Criteria cri) {

		log.info("get List with criteria: " + cri);

		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getTotal(Criteria cri) {

		log.info("get total count");
		return mapper.getTotalCount(cri);
	}

}
