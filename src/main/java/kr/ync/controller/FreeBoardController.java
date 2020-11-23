package kr.ync.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.ync.domain.BoardVO;
import kr.ync.domain.Criteria;
import kr.ync.domain.FreeBoardVO;
import kr.ync.domain.PageDTO;
import kr.ync.service.FreeBoardService;
import kr.ync.util.UploadUtils;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/front/*")
public class FreeBoardController {
	@Value("${globalConfig.uploadPath}")
	   private String uploadPath;
	   
	   @Autowired
	   private FreeBoardService service;
	   
//	   @GetMapping("/insert")
//	   @PreAuthorize("isAuthenticated()")
//	   public void insert() {
//
//	   }
//	   @PostMapping("/register")
//	   public String register(FreeBoardVO board, RedirectAttributes rttr) {
//		   log.info("register : " + board);
//		   
//		   service.register(board);
//		   
//		   rttr.addFlashAttribute("result", board.getBoard_idx());
//		   
//		   return "redirect:/Freeboard";
//	   }
//	   
	   @GetMapping("/free_board")
	   public void free_board(Criteria cri, Model model) {
		   log.info("f_board: " + cri);
		   
		   int total = service.getTotal(cri);
		   log.info("total: " + total);
		   model.addAttribute("f_board", service.getListWithPaging(cri));
		   model.addAttribute("pageMaker", new PageDTO(cri, total));
	   }
	   
	   
//	   @GetMapping("/writer")
//	   public void writer() {
//		   
//	   }
	   
	   @GetMapping("/f_register")
//	   @PreAuthorize("isAuthenticated()")
	   public void register() {

	   }
	   
//	   @PreAuthorize("isAuthenticated()")
	   @PostMapping("/f_register")
	   public String register(MultipartFile[] uploadFile, FreeBoardVO board, RedirectAttributes rttr) {
	      
	      int index = 0;
	      for (MultipartFile multipartFile : uploadFile) {
	         if(multipartFile.getSize() > 0) {
	            switch (index) {
	            case 0:
	               board.setImage1(UploadUtils.uploadFormPost(multipartFile, uploadPath));
	               break;
	            case 1:
	               board.setImage2(UploadUtils.uploadFormPost(multipartFile, uploadPath));
	               break;
	            default:
	               board.setImage3(UploadUtils.uploadFormPost(multipartFile, uploadPath));
	               break;
	            }
	         }
	         index++;
	      }
	      
	      log.info("f_register: " + board);

	      service.f_register(board);

	      rttr.addFlashAttribute("result", board.getBoard_idx());

	      return "redirect:/front/free_board";
	   }
	   
	   @GetMapping("/f_get")
	   public void f_get(@RequestParam("board_idx") Long board_idx, Model model, @ModelAttribute("cri") Criteria cri) {
		   
		   log.info("/f_get");
		   model.addAttribute("freeboard", service.f_get(board_idx));
	   }
	   
	
}
