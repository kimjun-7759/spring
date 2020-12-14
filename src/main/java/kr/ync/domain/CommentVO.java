package kr.ync.domain;


import lombok.Data;

@Data
public class CommentVO {
	private Long comment_idx;
	private Long board_idx;
	
	private String userid;
	private String comments;
	private String reg_date;
	private String update_date;
}
