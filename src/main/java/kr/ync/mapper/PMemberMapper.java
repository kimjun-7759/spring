package kr.ync.mapper;

import kr.ync.domain.PMemberVO;

public interface PMemberMapper {
	
	public void insert(PMemberVO pm);

	public PMemberVO read(String userid);

}
