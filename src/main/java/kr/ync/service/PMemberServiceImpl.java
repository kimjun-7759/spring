package kr.ync.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import kr.ync.domain.PMemberVO;
import kr.ync.mapper.PMemberMapper;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class PMemberServiceImpl implements PMemberService {

	@Autowired
	private PMemberMapper mapper;
	
	@Override
	public void register(PMemberVO pm) {
		// TODO Auto-generated method stub
		
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String pwd = encoder.encode(pm.getPwd());
		pm.setPwd(pwd);
		log.info(pm);
		
		mapper.insert(pm);
	}

}
