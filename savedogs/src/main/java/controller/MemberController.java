package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import exception.CartEmptyException;
import exception.LoginException;
import exception.VworkException;
import logic.BuyItem;
import logic.Buylist;
import logic.Cart;
import logic.DogService;
import logic.Fundinglist;
import logic.Item;
import logic.Member;
import logic.Shelter;
import logic.Vwork;
import util.MemberValidator;
import util.ShelterValidator;

@Controller
@RequestMapping("member")
public class MemberController {
	@Autowired
	private DogService service;
	@Autowired
	private MemberValidator memvalidator;
	@Autowired
	private ShelterValidator shelvalidator;
	
	@GetMapping("alerturl")
	public ModelAndView alerturl(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		/*
		 * Member smem = (Member)session.getAttribute("loginsmem"); if(smem != null) {
		 * mav.addObject("smem",smem); } else { Member mem =
		 * (Member)session.getAttribute("loginmem"); mav.addObject("mem",mem); }
		 */
		return mav;
	}
	
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
			bresult.reject("error.input.member");
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
	
	@GetMapping("shelterlist")
	public ModelAndView shelterlistmain() {
		ModelAndView mav = new ModelAndView();
		List<Shelter> list = service.getShelterAddress();
		mav.addObject("list",list);
		return mav;
	}
	
	@PostMapping("shelterlist")
	public ModelAndView shelterlist(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		String goo = request.getParameter("goo");
		List<Shelter> list = service.getShelterAddress();
		List<Shelter> namelist = service.getShelterName(goo);
		mav.addObject("list",list);
		mav.addObject("namelist", namelist);
		return mav;
	}
	
	@PostMapping("smemberSignup")
	public ModelAndView smemberSignup(@Valid Member mem, BindingResult bresult, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		if (bresult.hasErrors()) {
			bresult.reject("error.input.member");
			mav.getModel().putAll(bresult.getModel());
			return mav;
		}
		try {
			service.smemberInsert(mem, request);
			mav.setViewName("redirect:login.dog");
		} catch(Exception e) {
			e.printStackTrace();
			mav.getModel().putAll(bresult.getModel());
		}
		return mav;
	}
	
	@GetMapping("memberMypage")
	public ModelAndView memberMypageMain(String type, String id, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		Member mem = service.getMember(id);
		mav.addObject("type", type);
		mav.addObject("mem", mem);
		return mav;
	}
	
	@GetMapping("vworkMypage")
	public ModelAndView vworkMypageMain(String type, String id, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		List<Vwork> list = service.getMyvworkList(id);
		mav.addObject("type", type);
		mav.addObject("list", list);
		return mav;
	}
	
	@GetMapping("shopMypage")
	public ModelAndView shopMypageMain(String type, String id, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		List<Buylist> buylist = service.getbuylist(id);
		for(Buylist bl : buylist) {
			List<BuyItem> buyitemlist = service.getbuyitemlist(bl.getBuy_no());
			for(BuyItem bi : buyitemlist) {
				Item item = service.itemselect(Integer.parseInt(bi.getItem_no()));
				bi.setItem(item);
			}
			bl.setItemList(buyitemlist);
		}
		mav.addObject("buylist", buylist);
		Cart cart = (Cart)session.getAttribute("CART");
		mav.addObject("cart",cart);
		return mav;
	}
	
	@GetMapping("fundMypage")
	public ModelAndView fundMypageMain(String type, String id, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		List<Fundinglist> fundlist = service.getMyfundlist(id);
		List<Fundinglist> endfundlist = service.getMyendfundlist(id);
		mav.addObject("fundlist", fundlist);
		mav.addObject("endfundlist", endfundlist);
		return mav;
	}
	
	@PostMapping("checkpass")
	public ModelAndView checkpass(String member_pass, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		Member loginmem = (Member)session.getAttribute("loginmem");
		Member loginsmem = (Member)session.getAttribute("loginsmem");
		if(loginmem != null) {
			Member mem = service.getMember(loginmem.getMember_id());
			if(member_pass.equals(mem.getMember_pass())) {
				mav.setViewName("redirect:updateMember.dog?type=1&id=" + mem.getMember_id());
			} else {
				throw new LoginException("비밀번호 오류","../member/memberMypage.dog?type=1&id=" + mem.getMember_id());
			}
		} else {
			Member mem = service.getMember(loginsmem.getMember_id());
			if(member_pass.equals(mem.getMember_pass())) {
				mav.setViewName("redirect:updateMember.dog?type=1&id=" + mem.getMember_id());
			} else {
				throw new LoginException("비밀번호 오류","../member/shelterMypage.dog?type=1&id=" + mem.getMember_id());
			}
		}
		
		return mav;
	}
	
	@GetMapping({"updateMember", "updateShelter"})
	public ModelAndView updateform(String id) {
		ModelAndView mav = new ModelAndView();
		Member mem = service.getMember(id);
		mav.addObject("member", mem);
		return mav;
	}
	
	@PostMapping("updateMember")
	public ModelAndView memberupdate(Member mem, BindingResult bresult, HttpSession session, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		Member login = null;
		int type = 0;
		if(session.getAttribute("loginmem") != null) {
			memvalidator.validate(mem, bresult);
			login = (Member)session.getAttribute("loginmem");
		} else {
			shelvalidator.validate(mem, bresult);
			login = (Member)session.getAttribute("loginsmem");
			type = 1;
		}
		if (bresult.hasErrors()) {
			mav.getModel().putAll(bresult.getModel());
			mav.setViewName("redirect:updateMember.dog?id="+mem.getMember_id());
			return mav;
		}
		try {
			mem.setMember_pass(login.getMember_pass());
			service.memUpdate(mem, request);
			if(type == 0) {
				mav.setViewName("redirect:memberMypage.dog?type=1&id="+mem.getMember_id());
				if(login.getMember_id().equals(mem.getMember_id())) {
					session.setAttribute("loginmem", mem);
				}
			} else {
				mav.setViewName("redirect:shelterMypage.dog?type=1&id="+mem.getMember_id());
				if(login.getMember_id().equals(mem.getMember_id())) {
					session.setAttribute("loginsmem", mem);
				}
			}
			
		} catch(Exception e) {
			e.printStackTrace();
			mav.getModel().putAll(bresult.getModel());
		}
		return mav;
	}
	
	@PostMapping("changepass")
	public ModelAndView changepass(String inputpass, String newpass, String id, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		Member mem = service.getMember(id);
		if(inputpass.equals(mem.getMember_pass())) {
			service.memPassUpdate(newpass, id);
		} else {
			throw new LoginException("현재 비밀번호가 틀립니다.", "../member/changepass.dog?id="+id);
		}
		mav.addObject("msg", "비밀번호 변경 완료");
		mav.addObject("url", "memberMypage.dog?type=1&id="+id);
		mav.setViewName("redirect:alerturl.dog");
		return mav;
	}
	
	@PostMapping("login")
	public ModelAndView login(@Valid Member mem, BindingResult bresult, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		if(bresult.hasErrors()) {
			bresult.reject("error.login.member");
			System.out.println(bresult);
			return mav;
		}	
		try {
		   Member dbmem = service.getMember(mem.getMember_id());
		   if(mem.getMember_pass().equals(dbmem.getMember_pass())) {
			  int type = dbmem.getMember_type();
			  if(type == 0) {
				  session.setAttribute("loginmem", dbmem);
			  } else if (type == 1) {
				  session.setAttribute("loginsmem", dbmem);
				  System.out.println(service.getShelter(dbmem.getShelter_no()).getShelter_name());
				  session.setAttribute("smemName", service.getShelter(dbmem.getShelter_no()).getShelter_name());
			  }
			  mav.setViewName("redirect:../main.dog");
		   } else {
			  bresult.reject("error.login.member_pass");
		   }
		} catch (Exception e) {
			e.printStackTrace();
			bresult.reject("error.login.member_id");
		}
		return mav;
	}
	
	@RequestMapping("logout")
	public String loginChecklogout(HttpSession session) {
		session.invalidate();
		return "redirect:login.dog";
	}
	
	//보호소관리자
	
	@GetMapping("shelterMypage")
	public ModelAndView shelterMypageMain(String type, String id) {
		ModelAndView mav = new ModelAndView();
		Member mem = service.getMember(id);
		System.out.println(mem);
		mav.addObject("mem", mem);
		return mav;
	}
}