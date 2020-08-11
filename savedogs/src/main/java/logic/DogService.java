package logic;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import dao.AdminDao;
import dao.FundingDao;
import dao.ItemDao;
import dao.MemberDao;
import dao.ShelterDao;
import dao.VworkDao;

@Service
public class DogService {
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private AdminDao adminDao;
	@Autowired
	private FundingDao fundingDao;
	@Autowired
	private VworkDao vworkDao;
	@Autowired
	private ShelterDao shelterDao;
	@Autowired
	private ItemDao itemDao;
	
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

	//다원
		   	/*
			 * public List<Funding> getFundingList() { return fundingDao.list(); }
			 */

		   public void fundCreate(Funding funding, HttpServletRequest request) { 
		      if(funding.getPicture() != null && !funding.getPicture().isEmpty()) {
		         uploadFileCreate(funding.getPicture(),request,"funding/img/");
		         funding.setFund_pic
		                    (funding.getPicture().getOriginalFilename());
		      }
		      fundingDao.insert(funding);
		   }

		public void fundUpdate(Funding funding, HttpServletRequest request) {
		  if(funding.getPicture() != null && !funding.getPicture().isEmpty()) {
		   uploadFileCreate(funding.getPicture(),request,"funding/img/");
		   funding.setFund_pic(funding.getPicture().getOriginalFilename());	
		}
		  fundingDao.update(funding); //다원
		}

		public void insertSlist(Map<String, Map<String, String>> data) {
			for(Map.Entry<String, Map<String,String>> me : data.entrySet()) {
				Shelter shelter = new Shelter();
				shelter.setShelter_no(me.getKey().toString());
				shelter.setShelter_name(me.getValue().toString().split("=")[0].substring(1));
				shelter.setShelter_address(me.getValue().toString().split("=")[1].substring(0, me.getValue().toString().split("=")[1].indexOf("}")));
				shelter.setShelter_tel(" ");
				//System.out.println("보호소 코드 : " + me.getKey() + " 보호소명 : " + me.getValue().toString().split("=")[0].substring(1) + " 지역구 : " + me.getValue().toString().split("=")[1].substring(0, me.getValue().toString().split("=")[1].indexOf("}")) + "<br>");
				adminDao.insert(shelter);
			}
		}

		public void deleteAllList() {
			adminDao.deleteAllList();
		}

		public void insertInit() {
			adminDao.insertInit();
		}


		public List<Shelter> getShelterAddress() {
			return adminDao.getAddressList();
		}

		public List<Shelter> getShelterName(String goo) {
			return adminDao.getShelterName(goo);
		}
	
		public Shelter getShelter(String shelter_no) {
			return shelterDao.getShelter(shelter_no);

		}
		
		
//-------------------쇼핑관련 시작-------------------------------------------------
		public List<Item> getItemList() {
			return itemDao.list();
		}

		public void itemCreate(@Valid Item item, HttpServletRequest request) {
			if(item.getPicture() != null && !item.getPicture().isEmpty()) {
				uploadFileCreate(item.getPicture(),request,"item/img/");
				item.setItem_picture(item.getPicture().getOriginalFilename());
			}
			itemDao.insert(item);
		}
		
//-------------------쇼핑관련 끝--------------------------------------------------
}