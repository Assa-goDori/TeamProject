package controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
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
	public ModelAndView main(HttpServletRequest request) throws IOException {
		ModelAndView mav = new ModelAndView();
		Member mem = new Member();
		mav.addObject(mem);
		
		String url = "https://search.naver.com/search.naver?where=news&sm=tab_jum&query=%EC%9C%A0%EA%B8%B0%EA%B2%AC";
		List<String> list = new ArrayList<String>();
		int a = 0;
		try{
			Document doc = Jsoup.connect(url).get();
			Elements body = doc.select(".type01> li");
			for(Element li : body){
				Elements dl = li.select("dl");
				for(Element dt : dl){
					Elements atag = dt.select("dt");
					for(Element val : atag){
						Elements title = val.select("a");
						if(a<5) {
							list.add(title.toString());
							a++;
						}
					}
				}
			}
		} catch(IOException e){
			e.printStackTrace();
		}
		List<String> imglist = new ArrayList();
		String imgurl = "http://openapi.animal.go.kr/openapi/service/rest/abandonmentPublicSrvc/abandonmentPublic?upr_cd=6110000&care_reg_no=311320201300001&bgnde=20200801&endde=20200805&upkind=417000&pageNo=1&numOfRows=10&ServiceKey=LBFXEs0hIGvsna06ms6DL%2BOAQJeCCzkEcJLsSEjqrgxVvyB6owDk7VJh8QnuXz9qthbzx%2FqHbGbPP1MbJH7agA%3D%3D";
		URL u = new URL(imgurl); 
		HttpURLConnection urlcon = (HttpURLConnection)u.openConnection(); //실제  url에 맞도록 url에 접속
		urlcon.setRequestProperty("Accept", "application/xml");
		String line = "";
		String title = "";
		Document doc = null ;
		StringBuilder sb = new StringBuilder();
		int im = 0;
		try{
			BufferedReader in = new BufferedReader(new InputStreamReader(urlcon.getInputStream(),"UTF-8"));
			int len = 0;
			char[] buf = new char[8096];
			while((len = in.read(buf)) != -1){
				sb.append(new String(buf,0,len));
			}
			doc = Jsoup.parse(sb.toString());  
			Elements body = doc.select("item");
			for(Element ele : body){
				Elements picture = ele.select("popfile");
				if(im<9) {
					imglist.add(picture.html());
				}
			}
		}catch(IOException e){e.printStackTrace();}
		request.setAttribute("list", list);
		request.setAttribute("imglist", imglist);
		return mav; 
	}
}