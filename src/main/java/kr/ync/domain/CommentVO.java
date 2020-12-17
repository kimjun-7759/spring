package kr.ync.domain;


import lombok.Data;

@Data
public class CommentVO {
	private int comment_idx;
	private int board_idx;
	
	private String replyer;
	private String reply;
	private String reg_date;
	private String update_date;
}
