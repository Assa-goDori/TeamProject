package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import exception.VworkException;
import logic.DogService;
import logic.Member;
import logic.Shelter;
import logic.Vwork;


@Controller
@RequestMapping("vwork")
public class VworkController {
	@Autowired
	private DogService service;
	
	@RequestMapping("vmain")
	public ModelAndView vmain(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		Member smem = (Member)session.getAttribute("loginsmem");
		if(smem != null) {
			mav.addObject("smem",smem);
		} else {
			Member mem = (Member)session.getAttribute("loginmem");
			mav.addObject("mem",mem);
		}
		
		
		return mav;
	}
	
	@GetMapping("vwrite")
	public ModelAndView vwriteform(Model model, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		model.addAttribute(new Vwork());
		Member smem = (Member)session.getAttribute("loginsmem");
		String shelter_no = smem.getShelter_no();
		Shelter shelter = service.getShelter(shelter_no);
		mav.addObject("shelter",shelter);
		return mav;
	}
	
	
	@PostMapping("vregister")
	public ModelAndView write(@Valid Vwork vwork, BindingResult bresult, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("");
		if(bresult.hasErrors()) {
			mav.setViewName("vwrite.dog?date="+vwork.getVwork_date());
			mav.getModel().putAll(bresult.getModel());
			
			return mav;
		}
		try {
			service.vRegister(vwork, request);
			//mav.setViewName("redirect:detail.dog?vwork_no="+vwork.getVwork_no());
			mav.setViewName("redirect:vmain.dog");
		} catch(Exception e) {
			e.printStackTrace();
			throw new VworkException("봉사 등록에 실패했습니다","vwrite.dog");
		}
		return mav;
	}
}
