package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import logic.DogService;
import logic.Item;

@Controller
@RequestMapping("item")
public class ItemController {
	@Autowired
	private DogService service;
	
	@RequestMapping("list")
	public ModelAndView list() {
		ModelAndView mav = new ModelAndView();
		List<Item> itemlist = service.getItemList();
		mav.addObject("itemlist",itemlist);
		return mav;
	}
	@RequestMapping("register")
	public ModelAndView add(@Valid Item item, BindingResult bresult, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("item/add");
		if(bresult.hasErrors()) {
			mav.getModel().putAll(bresult.getModel());
			return mav;
		}
		service.itemCreate(item, request);
		mav.setViewName("redirect:/item/list.dog");
		return mav;
	}
	@RequestMapping("insert")
	public String addform(Model model) {
		model.addAttribute(new Item());
		return "item/add";
	}
}
