package controller;

import java.io.File;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import exception.BoardException;
import logic.Board;
import logic.DogService;



@Controller
@RequestMapping("board")
public class BoardController {
	@Autowired
	private DogService service;
	
	@RequestMapping("*")
	public ModelAndView noticeList() {
		ModelAndView mav = new ModelAndView();
		return mav;
	}
	
	@GetMapping("noticeWrite") 
	public ModelAndView writeform(Model model, HttpServletRequest request) {
		ModelAndView mav= new ModelAndView();
		model.addAttribute(new Board());
		return mav;
	}
	
	
	@PostMapping("noticeWrite")
	public ModelAndView nwrite(@Valid Board board, BindingResult bresult, HttpServletRequest request, Session session) {
		ModelAndView mav = new ModelAndView();
		if(bresult.hasErrors()) {
			mav.getModel().putAll(bresult.getModel());
			return mav;
		}
		try {
			service.boardWrite(board, request);
			if(board.getType().equals("1")) {
				mav.setViewName("redirect:noticeList.dog");
			}
		} catch(Exception e) {
			e.printStackTrace();
			throw new BoardException("게시글 등록에 실패했습니다","write.shop");
		}
		return mav;
	}
	
	
	
	
	
	
	
	
	
	@RequestMapping("imgupload")
	public String imgupload(MultipartFile upload, String CKEditorFuncNum, HttpServletRequest request, Model model) {
		String path = request.getServletContext().getRealPath("/") + "board/imgfile/"; 
		File f = new File(path);
		if(!f.exists()) f.mkdirs();
		if(!upload.isEmpty()) { 
			File file = new File(path, upload.getOriginalFilename()); 
			try {
				upload.transferTo(file); 
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		String fileName = request.getServletContext().getContextPath()+"/board/imgfile/"+upload.getOriginalFilename();
		model.addAttribute("fileName",fileName);
		model.addAttribute("CKEditorFuncNum",CKEditorFuncNum);
		return "ckedit";
	}
	
}