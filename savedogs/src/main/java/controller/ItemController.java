package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import logic.Item;

@Controller
@RequestMapping("item")
public class ItemController {
	@RequestMapping("*")
	public ModelAndView list() {
		ModelAndView mav = new ModelAndView();
		Item item = new Item();
		mav.addObject(item);
		return mav;
	}
}
