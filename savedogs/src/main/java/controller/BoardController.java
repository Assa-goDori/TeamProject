package controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import logic.Reply;

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
	
	@GetMapping(value= {"noticeWrite","reviewWrite","qnaWrite"}) 
	public ModelAndView writeform(Model model, HttpServletRequest request) {
		ModelAndView mav= new ModelAndView();
		model.addAttribute(new Board());
		model.addAttribute(new Reply()); //review만 사용 
		return mav;
	}
	
	@PostMapping(value= {"noticeWrite","reviewWrite","qnaWrite"})
	public ModelAndView write(@Valid Board board, BindingResult bresult, HttpServletRequest request, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		if(bresult.hasErrors()) {
			mav.getModel().putAll(bresult.getModel());
			return mav;
		}
		try {
			service.boardWrite(board, request);
			if(board.getType().equals("0")) {
				mav.setViewName("redirect:reviewDetail.dog?no="+board.getBoard_no());
			}else if(board.getType().equals("1")) {
				mav.setViewName("redirect:noticeDetail.dog?no="+board.getBoard_no());
			}else if(board.getType().equals("2")) {
				mav.setViewName("redirect:qnaDetail.dog?no="+board.getBoard_no());
			}
			
		} catch(Exception e) {
			e.printStackTrace();
			if(board.getType().equals("0")) {
				throw new BoardException("게시글 등록에 실패했습니다","reviewWrite.dog?no="+board.getBoard_no());
			}else if(board.getType().equals("1")) {
				throw new BoardException("게시글 등록에 실패했습니다","noticeWrite.dog?no="+board.getBoard_no());
			}else if(board.getType().equals("2")) {
				throw new BoardException("게시글 등록에 실패했습니다","qnaWrite.dog?no="+board.getBoard_no());
			}
			
		}
		return mav;
	}
	
	@GetMapping(value= {"noticeDetail","noticeUpdate","reviewDetail","qnaDetail"})
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

	@RequestMapping("qnaList")
	public ModelAndView list(Integer pageNum,String searchtype, String searchcontent,String type) {
		ModelAndView mav = new ModelAndView();
		if(pageNum == null || pageNum.toString().equals("")) {
			pageNum = 1;
		}
		int limit = 10; 
		
		//검색 부분
		if(searchtype == null || searchtype.trim().equals("")||searchcontent == null || searchcontent.trim().equals("")) {
			searchtype = null;
			searchcontent = null;
		}
		//검색 정보까지 집어넣기
		int listcount = service.qnacnt(searchtype,searchcontent,type);  
		List<Board> boardlist = service.qnalist(pageNum, limit,searchtype,searchcontent,type);
		
		int maxpage = (int)((double)listcount/limit + 0.95);
		int startpage = ((int)(pageNum/10.0 + 0.9)-1) * 10 + 1; 
		int endpage = startpage+9; 
		if(endpage>maxpage) endpage = maxpage; 
		int boardno = listcount - (pageNum-1) *limit;
		SimpleDateFormat sf = new SimpleDateFormat("yyyyMMdd");
		String today = sf.format(new Date());
		mav.addObject("today",today);
		mav.addObject("pageNum",pageNum);
		mav.addObject("maxpage",maxpage);
		mav.addObject("startpage",startpage);
		mav.addObject("endpage",endpage);
		mav.addObject("listcount",listcount);
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
	
	@GetMapping("noticeDelete")
	public ModelAndView deleteform(String no) {
		ModelAndView mav = new ModelAndView();
		String type = service.getBoardType(no);
		mav.addObject("board_no", no);
		return mav;
	}
	
	@PostMapping("noticeDelete")
	public ModelAndView delete(String no) {
		ModelAndView mav = new ModelAndView();
		try {
			
			String type = service.getBoardType(no);
			service.boardDelete(no);
			if(type.equals("1")) {
				mav.setViewName("redirect:noticeList.dog?type=1");
			} 
		} catch(Exception e) {
			e.printStackTrace();
			throw new BoardException("게시글 삭제를 실패했습니다","noticeDetail.dog?no="+no);
		}
		return mav;
	} 
	
//===========댓글===============
	
	@PostMapping(value="replyList", produces="text/plain; charset=UTF-8")
	public String replyList(String board_no, BindingResult bresult, HttpServletRequest request, HttpSession session) {
		List<Reply> list = service.replyList(board_no);
		StringBuilder html = new StringBuilder();
		html.append("<table>");
		if(list.size()>0 ) {
			for(Reply r : list) {
				String date = new SimpleDateFormat("yyyy-MM-dd").format(r.getBoard_regdate());
				html.append("<tr><th>"+r.getMember_id()+"</th><td rowspan='2'>"+"<td></tr>");
				html.append("<tr><td>"+date+"</td></tr>");
			}
		} else {
			html.append("<tr><th>해당 게시글의 댓글이 없습니다.</th></tr>");
		}
		html.append("</table>");
		return html.toString();
	}
	
	@PostMapping(value="replyInsert", produces="text/plain; charset=UTF-8")
	public String replyInsert(Reply reply, BindingResult bresult, HttpServletRequest request, HttpSession session) {
		int rmax = service.getRmax();
		reply.setBoard_replyno(++rmax);
		String s = service.insertReply(reply);
		return s;
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