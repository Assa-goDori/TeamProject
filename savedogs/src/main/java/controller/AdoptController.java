package controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import logic.Adopt;
import logic.AdoptUtils;
import logic.ApiExplorer;

@Controller
@RequestMapping("adopt")
public class AdoptController {

//	private static final Logger logger = LoggerFactory.getLogger(AdoptController.class);

	@GetMapping("main")
	public ModelAndView main() throws IOException {
		ModelAndView mav = new ModelAndView();
		StringBuilder urlBuilder = new StringBuilder(
				"http://openapi.animal.go.kr/openapi/service/rest/abandonmentPublicSrvc/abandonmentPublic"); // 유기동물 조회
		urlBuilder.append("?" + URLEncoder.encode("ServiceKey", "UTF-8")
				+ "=LkKlaYPxZnedB774kYO9uNzE0Eaa07yjZfE05Sh3BR%2F7GLjPuQd%2BdSErZFAPjdkiyM4cDxpkdBOQZ1ckRjyERw%3D%3D" // 서비스키
				+ "&upkind=417000" // upkind : 개(41700)
				+ "&upr_cd=6110000" // upr_cd : 서울특별시(6110000)
				+ "&state=null" // state : 전체(null)
				+ "&pageNo=1" // pageNo : 페이지 번호(1)
				+ "&numOfRows=16"); // numOfRows : 페이지당 보여줄 개수(4*4 = 16)
		URL url = new URL(urlBuilder.toString());
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("accept", "application/json");
		System.out.println("Response code: " + conn.getResponseCode());
		BufferedReader rd;
		if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
			rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		} else {
			rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		}
		StringBuilder sb = new StringBuilder();
		String line;
		while ((line = rd.readLine()) != null) {
			sb.append(line);
		}
		rd.close();
		conn.disconnect();
		System.out.println(sb.toString());
		
		return mav;
	}

	@RequestMapping("main")
	public String main2(Adopt adopt, Model model) throws Exception {
		
		Map<String, String> result = AdoptUtils.getKind();
		String state = result.get(adopt.getState());
		System.out.println("state :" + state);
		String kind = result.get(adopt.getKind());
		System.out.println("kind :" + kind);
		if(kind != null) {
			List<Adopt> go = ApiExplorer.getDogJson(state, kind);
			model.addAttribute("go", go);
		}
		return "redirect:main.dog";
	}

}
