package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import logic.Adopt;
import logic.AdoptSign;
import logic.ApiExplorer;
import logic.DogService;
import logic.Shelter;

@Controller
@RequestMapping("adopt")
public class AdoptController {

	@Autowired
	private DogService service;

	@GetMapping("amain")
	public ModelAndView main1(Adopt adopt) throws Exception {
		ModelAndView mav = new ModelAndView();
		String state = "";
		String kind = null;
		System.out.println("state :" + state);
		System.out.println("kind :" + kind);

		List<Adopt> go = ApiExplorer.getDogsJson(state, kind);
		mav.addObject("go", go);

		mav.setViewName("/adopt/amain");
		return mav;
	}

	@PostMapping("amain")
	public ModelAndView main2(Adopt adopt, String state, String kind) throws Exception {
		ModelAndView mav = new ModelAndView();
		System.out.println("state :" + state);
		System.out.println("kind :" + kind);
		try {
			List<Adopt> go = ApiExplorer.getDogsJson(state, kind);
			mav.addObject("go", go);
			mav.setViewName("/adopt/amain");
		} catch (Exception e) {
			e.printStackTrace();
			String message = "검색결과가 없습니다.";
			mav.addObject("message", message);
		}
		return mav;
	}

	@RequestMapping("adetail")
	public ModelAndView detail(String desertionNo) throws Exception {
		ModelAndView mav = new ModelAndView();
		Adopt go = ApiExplorer.getDogJson(desertionNo);
		mav.addObject("go", go);
		return mav;
	}

	@GetMapping("adoptSignup")
	public ModelAndView asignup(String noticeNo, String careNm, String orgNm) throws Exception {
		ModelAndView mav = new ModelAndView();
		return mav;
	}

	@RequestMapping("adoptSignup")
	public ModelAndView asignup2(String careNm, String orgNm, AdoptSign a) throws Exception {
		System.out.println(a);
		System.out.println(careNm);
		System.out.println(orgNm);
		
		String co = careNm.concat(orgNm);
		System.out.println(co);
		
		ModelAndView mav = new ModelAndView();
		List<Shelter> hap = service.getHaplist();
		System.out.println(hap);
		
		Shelter s = new Shelter();
		for(Shelter ss : hap) {
			ss.setHap(ss.getHap());
			ss.setShelter_no(ss.getShelter_no());
			s=ss;
			if(s.getHap().equals(co)) {
				a.setShelter_no(s.getShelter_no());
			}
		}
		
		
		/*
		orgNm : 서울특별시, 구로구
		String split1 = orgNm.split(" ")[0];
		String split2 = orgNm.split(" ")[1];
		System.out.println(split1);
		System.out.println(split2);
		*/
		service.adoptInsert(a);
		mav.setViewName("redirect:../member/adoptMypage.dog?type=4");
		return mav;
	}

}
