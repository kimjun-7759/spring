package kr.ync.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.ync.domain.Criteria;
import kr.ync.domain.PageDTO;
import kr.ync.service.MessageService;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/admin/*")
public class AdminController {

	@Autowired
	private MessageService service;

	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping("/list")
	public void list(Criteria cri, Model model) {

		log.info("list: " + cri);

		// 게시판의 글은 지속적으로 등록, 삭제 되기에 매번 list를 호출 할때 total을 구해와야 한다.
		int total = service.getTotal(cri);
		log.info("total: " + total);
		model.addAttribute("list", service.getListWithPaging(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, total));

	}
	
	@GetMapping("/m_get")
	   public void m_get(@RequestParam("message_idx") Long message_idx, Model model, @ModelAttribute("cri") Criteria cri) {
		   
		   log.info("/m_get");
		   model.addAttribute("message", service.m_get(message_idx));
	   }
	
	@PostMapping("/m_remove")
	   public String remove(@RequestParam("message_idx") Long message_idx, Criteria cri, RedirectAttributes rttr, String userid) {

	      log.info("remove..." + message_idx);
	      if (service.remove(message_idx)) {
	         rttr.addFlashAttribute("result", "success");
	      }

	      return "redirect:/admin/list" + cri.getListLink();
	   }

}
