package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import exception.ItemException;
import logic.Cart;
import logic.DogService;
import logic.Item;
import logic.ItemSet;

@Controller
@RequestMapping("item")
public class ItemController {
	@Autowired
	private DogService service;
	
	@RequestMapping("list")
	public ModelAndView chkmlist(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		List<Item> itemlist = service.getItemList();
		mav.addObject("itemlist",itemlist);
		return mav;
	}
	@RequestMapping("register")
	public ModelAndView addadmin(@Valid Item item, BindingResult bresult, HttpServletRequest request,HttpSession session) {
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
	public String addformadmin(Model model,HttpSession session) {
		model.addAttribute(new Item());
		return "item/add";
	}
	@GetMapping("detail") 
	public ModelAndView chkmdetail(int item_no,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		try{
			Item item = service.itemselect(item_no);
			mav.addObject("item",item);
			return mav;
		}catch (Exception e) {
			throw new ItemException("없는 상품입니다.","list.dog");
		}
	}
}
