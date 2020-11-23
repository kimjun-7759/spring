package kr.ync.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import kr.ync.domain.MemberVO;
import kr.ync.mapper.MemberMapper;
import kr.ync.security.domain.CustomUser;
import lombok.extern.log4j.Log4j;

@Log4j
public class CustomUserDetailsService implements UserDetailsService {

	@Autowired
	private MemberMapper memberMapper;

	@Override
	public UserDetails loadUserByUsername(String userName) throws UsernameNotFoundException {

		log.warn("Load User By UserName : " + userName);

		// userName means userid
		MemberVO vo = memberMapper.read(userName);

		log.warn("queried by member mapper: " + vo);

//		return null;
		return vo == null ? null : new CustomUser(vo);
	}

}
