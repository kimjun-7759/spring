package kr.ync.domain;


import lombok.Data;

@Data
public class GalleryVO {
	private int gallery_idx;
	private String admin_image;
	private String main_image;
	private String image_type;
}
