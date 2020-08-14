package controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

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
	
	@GetMapping("vmain")
	public ModelAndView vmain(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		Member smem = (Member)session.getAttribute("loginsmem");
		if(smem != null) {
			mav.addObject("smem",smem);
		} else {
			Member mem = (Member)session.getAttribute("loginmem");
			mav.addObject("mem",mem);
		}
		
		HashSet<String> hashSet = new HashSet<>(); 
		hashSet = service.allvwork();
		StringBuilder json = new StringBuilder("[");
		int i = 0;
		for(String h : hashSet) {
			json.append("{\"start\":\""+h +"\",");
			json.append("\"title\":\"봉사신청\",");
			json.append("\"color\":\"#AAD292\"},");
			i++;
		}
		if(i<hashSet.size()) json.append(",");
		
		json.append("]");
		mav.addObject("json", json.toString().trim());
		
		List<Shelter> list = service.getShelterlist();
		mav.addObject("list",list);
		
		return mav;
	}
	
	@PostMapping("vmain")
	public ModelAndView vmain2(String shelter_no,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		Member smem = (Member)session.getAttribute("loginsmem");
		if(smem != null) {
			mav.addObject("smem",smem);
		} else {
			Member mem = (Member)session.getAttribute("loginmem");
			mav.addObject("mem",mem);
		}
		
		HashSet<String> hashSet = new HashSet<>(); 
		
		if (shelter_no == null || shelter_no.equals("")) {
			hashSet = service.allvwork();
		} else {
			hashSet = service.sheltervwork(shelter_no);
		}
		
		StringBuilder json = new StringBuilder("[");
		int i = 0;
		for(String h : hashSet) {
			json.append("{\"start\":\""+h +"\",");
			json.append("\"title\":\"봉사신청\",");
			json.append("\"color\":\"#AAD292\"},");
			i++;
		}
		if(i<hashSet.size()) json.append(",");
		
		json.append("]");
		mav.addObject("json", json.toString().trim());
	
		
		List<Shelter> list = service.getShelterlist();
		mav.addObject("list",list);
		
		mav.addObject("shelter_no",shelter_no);
		
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
	
	@PostMapping("shelterNames")
	public ModelAndView shelterNames(String goo) {
		ModelAndView mav = new ModelAndView();
		List<Shelter> shelters = service.getShelters(goo);
		mav.addObject("shelters",shelters);
		mav.setViewName("redirect:vmain.dog");
		return mav;
	}
	
	@RequestMapping("vlist")
	public ModelAndView vlist(String date, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		Member smem = (Member)session.getAttribute("loginsmem");
		if(smem != null) {
			mav.addObject("smem",smem);
		} else {
			Member mem = (Member)session.getAttribute("loginmem");
			mav.addObject("mem",mem);
		}

		List<Vwork> vworklist = service.vworklist(date); //해당 날짜의 봉사들
		//ArrayList<String> list = new ArrayList(); //지역구, 보호소. 현재인원, 총 인원
		ArrayList<Map<String,String>> list = new ArrayList();
		
		for (Vwork v : vworklist) {
			Shelter shelter = service.getShelter(v.getShelter_no());
			Map<String,String> map = new HashMap();
			map.put("address",shelter.getShelter_address());
			map.put("name",shelter.getShelter_name());
			
			int Nowmem = service.getNowmem(v.getVwork_no());
			String Nmem = String.valueOf(Nowmem);
			map.put("Nmem",Nmem);
			String Vmem = String.valueOf(v.getVwork_member()); 
			map.put("Vmem",Vmem);
			String vno = String.valueOf(v.getVwork_no());
			map.put("vwork_no",vno);
			list.add(map);
		}
		int listcnt = service.getListcnt(date);
		mav.addObject("listcnt",listcnt);
		mav.addObject("list",list);

		return mav;
	}
	
	@GetMapping("vdetail")
	public ModelAndView vdetail(String vwork_no, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		Member smem = (Member)session.getAttribute("loginsmem");
		if(smem != null) {
			mav.addObject("smem",smem);
		} else {
			Member mem = (Member)session.getAttribute("loginmem");
			mav.addObject("mem",mem);
		}
		Vwork vwork = service.getVwork(vwork_no);
		mav.addObject("vwork",vwork);
		return mav;
	}
	
}
