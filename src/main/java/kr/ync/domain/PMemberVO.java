package kr.ync.domain;

import java.util.List;

import lombok.Data;

@Data
public class PMemberVO {
	private String id;
	private String pwd;
	private String email;
	private String address;
	private String tel;
	private List<AuthVO> authList;
}
