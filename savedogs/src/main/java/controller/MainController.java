package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import logic.Member;

@Controller
public class MainController {
	@RequestMapping("main")
	public ModelAndView main(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		Member mem = new Member();
		mav.addObject(mem);
		
		String url = "https://search.naver.com/search.naver?where=news&sm=tab_jum&query=%EC%9C%A0%EA%B8%B0%EA%B2%AC";
		List<String> list = new ArrayList<String>(); 
		try{
			Document doc = Jsoup.connect(url).get();
			Elements body = doc.select(".type01> li");
			for(Element li : body){
				Elements dl = li.select("dl");
				for(Element dt : dl){
					Elements atag = dt.select("dt");
					for(Element val : atag){
						Elements title = val.select("a");
						list.add(title.toString());
					}
				}
			}
		} catch(IOException e){
			e.printStackTrace();
		}
		request.setAttribute("list", list);
		return mav; 
	}
}