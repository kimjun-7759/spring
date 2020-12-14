package kr.ync.domain;

import lombok.Data;

@Data
public class MessageVO {
	
	private Long message_idx;
	private String id;
	private String content;
	private String receivce_id;

}
