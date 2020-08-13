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
		String state = "notice";
		String kind = null;
		System.out.println("state :" + state);
		System.out.println("kind :" + kind);

		List<Adopt> go = ApiExplorer.getDogJson(state, kind);
		mav.addObject("go", go);

		mav.setViewName("/adopt/amain");
		return mav;
	}

	/*
	 * @PostMapping("amain") public ModelAndView main2(Adopt adopt) throws Exception
	 * { ModelAndView mav = new ModelAndView(); Map<String, String> result =
	 * AdoptUtils.getKind(); String state = result.get(adopt.getState());
	 * System.out.println("state :" + state); String kind =
	 * result.get(adopt.getKind()); System.out.println("kind :" + kind); if(kind !=
	 * null) { List<Adopt> go = ApiExplorer.getDogJson(state, kind);
	 * mav.addObject("go", go); } mav.setViewName("/adopt/amain"); return mav; }
	 */

	@PostMapping("amain")
	public ModelAndView main2(Adopt adopt, String state, String kind) throws Exception {
		ModelAndView mav = new ModelAndView();
		System.out.println("state :" + state);
		System.out.println("kind :" + kind);
		try {
			List<Adopt> go = ApiExplorer.getDogJson(state, kind);
			mav.addObject("go", go);
			mav.setViewName("/adopt/amain");
		} catch (Exception e) {
			e.printStackTrace();
			String message = "검색결과가 없습니다.";
			mav.addObject("message", message);
		}
		return mav;
	}

}
