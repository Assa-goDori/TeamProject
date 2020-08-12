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
	@GetMapping("*") 
	public ModelAndView detail(int item_no) {
		ModelAndView mav = new ModelAndView();
		try{
			Item item = service.itemselect(item_no);
			mav.addObject("item",item);
			return mav;
		}catch (Exception e) {
			throw new ItemException("없는 상품입니다.","list.shop");
		}
	}
	@RequestMapping("cartAdd")
	public ModelAndView add(Integer item_no, Integer item_each, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		Item item = service.itemselect(item_no);
		Cart cart = (Cart)session.getAttribute("CART");
		if(cart == null) {
			cart = new Cart();
			session.setAttribute("CART", cart);
		}
		cart.push(new ItemSet(item, item_each));
		mav.addObject("message",item.getItem_name() + ":" + item_each + "개 장바구니 추가");
		mav.addObject("cart",cart);
		mav.setViewName("redirect:/item/list.dog");
		System.out.println(cart);
		return mav;
		}
}
