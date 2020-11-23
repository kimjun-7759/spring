package kr.ync.domain;

import java.util.Date;

import lombok.Data;

@Data
public class CommentVO {
	private int idx;
	private int board_idx;
	private String id;
	private String reg_date;
	private String update_date;
	private String comments;
}
