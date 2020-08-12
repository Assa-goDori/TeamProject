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
	
	@RequestMapping("gotoMain")
	public ModelAndView gotoMain(HttpSession session) {
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
	
	@PostMapping("vwrite")
	public ModelAndView vwrite(@Valid Vwork vwork, BindingResult bresult, HttpServletRequest request, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		Member smem = (Member)session.getAttribute("loginsmem");
		String shelter_no = smem.getShelter_no();
		Shelter shelter = service.getShelter(shelter_no);
		mav.addObject("shelter",shelter);
		if(bresult.hasErrors()) {
			mav.getModel().putAll(bresult.getModel());
			return mav;
		}
		
		try {
			service.vWrite(vwork, request);
			
		} catch(Exception e) {
			e.printStackTrace();
			throw new VworkException("봉사 등록에 실패했습니다","vwrite.dog?date="+vwork.getVwork_date());
		}
		mav.setViewName("redirect:gotoMain.dog");
		return mav;
	}
}
