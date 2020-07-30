package controller;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import logic.Member;

@Controller
@RequestMapping("member")
public class MemberController {
	
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
		return mav;
	}
}