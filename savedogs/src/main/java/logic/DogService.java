package logic;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import dao.FundingDao;
import dao.MemberDao;

@Service
public class DogService {
	@Autowired
	private MemberDao memberDao;

	public void memberInsert(Member mem) {
		memberDao.memberInsert(mem);
	}

	public Member getMember(String member_id) {
		return memberDao.getMember(member_id);
	}
	//다원
		   @Autowired
		   private FundingDao fundingDao;

			/*
			 * public List<Funding> getFundingList() { return fundingDao.list(); }
			 */

		   public void fundCreate(Funding funding, HttpServletRequest request) { 
		      if(funding.getFund_pic() != null && !funding.getFund_pic().isEmpty()) {
		         uploadFileCreate(funding.getPicture(),request,"funding/img/");
		         funding.setFund_pic
		                    (funding.getPicture().getOriginalFilename());
		      }
		      fundingDao.insert(funding);
		   }

		private void uploadFileCreate(MultipartFile picture, HttpServletRequest request, String path) {
			//fund_pic : ������ ���� ����
			String orgFile = picture.getOriginalFilename();
			String uploadPath=request.getServletContext().getRealPath("/")
					+ path;
			File fpath = new File(uploadPath);
			if(!fpath.exists()) fpath.mkdirs();
			try {
				//������ ������ ���� ���Ϸ� ����
				picture.transferTo(new File(uploadPath + orgFile));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		public void fundUpdate(Funding funding, HttpServletRequest request) {
		  if(funding.getPicture() != null && !funding.getPicture().isEmpty()) {
		   uploadFileCreate(funding.getPicture(),request,"funding/img/");
		   funding.setFund_pic(funding.getPicture().getOriginalFilename());	
		}
		  fundingDao.update(funding); //다원
		}
}