package kr.ync.domain;

import java.util.List;

import lombok.Data;

@Data
public class PMemberVO {
	private String userid;
	private String pwd;
	private String email;
	private String address;
	private String tel;
	private List<AuthVO> auth;
}
