package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("vwork")
public class VworkController {
	@RequestMapping("vmain")
	public ModelAndView vmain() {
		ModelAndView mav = new ModelAndView();
		return mav;
	}
}
