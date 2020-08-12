package controller;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import logic.Adopt;
import logic.AdoptUtils;
import logic.ApiExplorer;

@Controller
@RequestMapping("adopt")
public class AdoptController {

	@GetMapping("main")
	public ModelAndView main1(Adopt adopt) throws Exception {
		ModelAndView mav = new ModelAndView();
		String state = null;
		String kind = "000000";
		Map<String, String> result = AdoptUtils.getKind();
		state = result.get(adopt.getState());
		System.out.println("state :" + state);
		kind = result.get(adopt.getKind());
		System.out.println("kind :" + kind);
		if(kind != null) {
			List<Adopt> go = ApiExplorer.getDogJson(state, kind);
			mav.addObject("go", go);
		}
		mav.setViewName("amain.dog");
		return mav;
	}
	
	@PostMapping("main")
	public ModelAndView main2(Adopt adopt) throws Exception {
		ModelAndView mav = new ModelAndView();
		Map<String, String> result = AdoptUtils.getKind();
		String state = result.get(adopt.getState());
		System.out.println("state :" + state);
		String kind = result.get(adopt.getKind());
		System.out.println("kind :" + kind);
		if(kind != null) {
			List<Adopt> go = ApiExplorer.getDogJson(state, kind);
			mav.addObject("go", go);
		}
		mav.setViewName("amain.dog");
		return mav;
	}

}
