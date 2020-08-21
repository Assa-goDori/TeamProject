package controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
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
	public ModelAndView write(@Valid Board board, BindingResult bresult, HttpServletRequest request, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		if(bresult.hasErrors()) {
			mav.getModel().putAll(bresult.getModel());
			return mav;
		}
		try {
			service.boardWrite(board, request);
			if(board.getType().equals("1")) {
				mav.setViewName("redirect:noticeDetail.dog?no="+board.getBoard_no());
			}
		} catch(Exception e) {
			e.printStackTrace();
			throw new BoardException("게시글 등록에 실패했습니다","noticeWrite.dog?no="+board.getBoard_no());
		}
		return mav;
	}
	
	@GetMapping(value= {"noticeDetail","noticeUpdate"})
	public ModelAndView noticeDetail(String no) {
		ModelAndView mav = new ModelAndView();
		Board board = service.boardDetail(no);
		mav.addObject("board",board);
		return mav;
	}
	
	@RequestMapping("noticeList")
	public ModelAndView noticeList(Integer pageNum, String type) { 
		ModelAndView mav = new ModelAndView();
		if(pageNum == null || pageNum.toString().equals("")) {
			pageNum = 1;
		}
		int limit = 10; 
		int noticecnt = service.noticecnt(type);
		List<Board> boardlist = service.boardlist(pageNum, limit, type);
		
		int maxpage = (int)((double)noticecnt/limit + 0.95);
		int startpage = ((int)(pageNum/10.0 + 0.9)-1) * 10 + 1; 
		int endpage = startpage+9; 
		if(endpage>maxpage) endpage = maxpage; 
		int boardno = noticecnt - (pageNum-1) *limit;
		SimpleDateFormat sf = new SimpleDateFormat("yyyyMMdd");
		String today = sf.format(new Date());
		mav.addObject("today",today);
		mav.addObject("pageNum",pageNum);
		mav.addObject("maxpage",maxpage);
		mav.addObject("startpage",startpage);
		mav.addObject("endpage",endpage);
		mav.addObject("noticecnt",noticecnt);
		mav.addObject("boardlist",boardlist);
		mav.addObject("boardno",boardno);
		return mav;
	}

	@PostMapping("noticeUpdate")
	public ModelAndView update(@Valid Board board, BindingResult bresult, HttpServletRequest request, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		if(bresult.hasErrors()) {
			mav.getModel().putAll(bresult.getModel());
			return mav;
		}
		try {
			service.boardUpdate(board, request);
			if(board.getType().equals("1")) {
				mav.setViewName("redirect:noticeDetail.dog?no="+board.getBoard_no());
			} 
		} catch(Exception e) {
			e.printStackTrace();
			throw new BoardException("게시글 수정을 실패했습니다","noticeUpdate.dog?no="+board.getBoard_no());
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