package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
		List<Adopt> go = ApiExplorer.getDogsJson(state, kind);
		mav.addObject("go", go);

		mav.setViewName("/adopt/amain");
		return mav;
	}

	@PostMapping("amain")
	public ModelAndView main2(Adopt adopt, String state, String kind) throws Exception {
		ModelAndView mav = new ModelAndView();
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
	public ModelAndView chkmasignup(Model model, String noticeNo, String careNm, String orgNm, HttpSession session)
			throws Exception {
		ModelAndView mav = new ModelAndView();
		model.addAttribute(new AdoptSign());
		return mav;
	}

	@PostMapping("adoptSignup")
	public ModelAndView asignup2(String careNm, String orgNm, AdoptSign a, HttpServletRequest request)
			throws Exception {
		String[] orgNms = orgNm.split(" ");
		String split1 = orgNms[0];
		String split2 = null;
		if (orgNms.length > 1)
			split2 = orgNms[1];
		String co = "";
		if (split2 == "") {
			co = split1.concat(careNm); // 서울특별시 구디보호소
		} else if (split2 != "") {
			co = split2.concat(" " + careNm); // 구로구 구디보호소
		}
		System.out.println(co);

		ModelAndView mav = new ModelAndView();
		List<Shelter> hap = service.getHaplist();
		String num = "";
		for (Shelter ss : hap) {
			if (ss.getHap().equals(co)) {
				num = ss.getShelter_no();
			}
		}
		a.setShelter_no(num);
		System.out.println(a);
		service.adoptInsert(a, request);
		mav.setViewName("redirect:../member/adoptMypage.dog?type=4");
		return mav;
	}

}
