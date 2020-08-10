package logic;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import dao.MemberDao;
import dao.VworkDao;

@Service
public class DogService {
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private VworkDao vworkDao;

	public void memberInsert(Member mem) {
		memberDao.memberInsert(mem);
	}

	public void smemberInsert(Member mem, HttpServletRequest request) {
		if(mem.getF1() != null && !mem.getF1().isEmpty()) {
			uploadFileCreate(mem.getF1(),request,"member/img/");
			mem.setFile1(mem.getF1().getOriginalFilename());
		}
		memberDao.smemberInsert(mem);
	}
	
	private void uploadFileCreate(MultipartFile picture, HttpServletRequest request, String path) {
		String orgFile = picture.getOriginalFilename();
		String uploadPath = request.getServletContext().getRealPath("/") + path;
		File fpath = new File(uploadPath);
		if(!fpath.exists()) fpath.mkdirs();
		try {
			picture.transferTo(new File(uploadPath + orgFile));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public Member getMember(String member_id) {
		return memberDao.getMember(member_id);
	}

	
	//봉사 관련 
	public void vworkWrite(Vwork vwork, HttpServletRequest request) {
		
		
	}
}