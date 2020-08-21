package controller;

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
}