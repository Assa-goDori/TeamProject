package controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import logic.DogService;
import logic.Member;

@Controller
@RequestMapping("member")
public class MemberController {
	@Autowired
	private DogService service;
	
	@GetMapping("*")
	public ModelAndView memberEntry() {
		ModelAndView mav = new ModelAndView();
		Member mem = new Member();
		mav.addObject(mem);
		return mav;
	}
	
	@PostMapping("memberSignup")
	public ModelAndView memberSignup(@Valid Member mem, BindingResult bresult) {
		ModelAndView mav = new ModelAndView();
		if (bresult.hasErrors()) {
			bresult.reject("error.input.user");
			mav.getModel().putAll(bresult.getModel());
			return mav;
		}
		try {
			service.memberInsert(mem);
			mav.setViewName("redirect:login.dog");
		} catch(Exception e) {
			e.printStackTrace();
			mav.getModel().putAll(bresult.getModel());
		}
		return mav;
	}
	
	@PostMapping("login")
	public ModelAndView login(@Valid Member mem, BindingResult bresult, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		/*
		 * if(bresult.hasErrors()) { bresult.reject("error.input.user"); return mav; }
		 */
		try {
		   Member dbmem = service.getMember(mem.getMember_id());
		   if(mem.getMember_pass().equals(dbmem.getMember_pass())) {
 			  session.setAttribute("login", dbmem);
			  mav.setViewName("redirect:../main.dog");
		   } else {
			  bresult.reject("error.login.password");
		   }
		} catch (Exception e) {
			e.printStackTrace();
			bresult.reject("error.login.id");
		}
		return mav;
	}
}