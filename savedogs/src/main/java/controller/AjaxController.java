package controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import logic.DogService;

@RestController
@RequestMapping("ajax")
public class AjaxController {
	@Autowired
	private DogService service;
	
	@RequestMapping("changestate")
	public String changestate(String item_no, String item_state) {
		service.updateState(item_no, item_state);
		return null;
	}
	
	@RequestMapping("changeauth")
	public String changeauth(String member_id, String member_auth) {
		service.updateAuth(member_id, member_auth);
		return null;
	}
	
	@RequestMapping(value="vworkgraph", produces="text/plain; charset=UTF8")
	public String vworkgraph(String year, String member_id) {
		Map<String, Object> map = service.vworkgraph(year, member_id);
		StringBuilder json = new StringBuilder("[");
		int i = 0;
		for(Map.Entry<String,Object> me : map.entrySet()) {
			json.append("{\"m\":\""+me.getKey() + "\"," + "\"cnt\":\""+me.getValue()+"\"}");
			i++;
			if(i<map.size())
				json.append(",");
		}
		json.append("]");
		return json.toString();
	}
}