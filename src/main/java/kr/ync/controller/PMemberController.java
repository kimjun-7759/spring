package kr.ync.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.ync.domain.PMemberVO;
import kr.ync.service.PMemberService;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/front/*")
public class PMemberController {
	   @Autowired
	   private PMemberService service;
	   	  
	   @GetMapping("/sign_up")
	   public void sign_up() {
		   
	   }
	   
//	   @PreAuthorize("isAuthenticated()")
	   @PostMapping("/sign_up")
	   public String register(PMemberVO member, RedirectAttributes rttr) {
	      
	      log.info("register: " + member);

	      service.register(member);

	      //rttr.addFlashAttribute("result", member.getId());

	      return "redirect:/front/sign_in";
	   }	  
}
