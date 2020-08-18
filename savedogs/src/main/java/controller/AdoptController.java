package controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import logic.Adopt;
import logic.ApiExplorer;

@Controller
@RequestMapping("adopt")
public class AdoptController {

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

	@RequestMapping("adoptSignup")
	public ModelAndView asignup() throws Exception {
		ModelAndView mav = new ModelAndView();
		return mav;
	}

}
