package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainController {
	@RequestMapping("main")
	public ModelAndView main() {
		ModelAndView mav = new ModelAndView();
		return mav;
	}
}