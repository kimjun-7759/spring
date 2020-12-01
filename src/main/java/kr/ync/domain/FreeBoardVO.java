package kr.ync.domain;

import java.util.Date;

import lombok.Data;

@Data
public class FreeBoardVO {
	private int board_idx;
	private String title;
	private String content;
	private String userid;
	private Date reg_date;
	private Date update_date;
	private String image1;
	private String image2;
	private String image3;
}
