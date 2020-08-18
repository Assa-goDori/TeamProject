package logic;

import java.io.File;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import dao.AdminDao;
import dao.BuyitemDao;
import dao.BuylistDao;
import dao.FundingDao;
import dao.FundinglistDao;
import dao.ItemDao;
import dao.MemberDao;
import dao.ShelterDao;
import dao.VworkDao;
import dao.VworklistDao;

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
	@Autowired
	private BuylistDao buylistDao;
	@Autowired
	private BuyitemDao buyitemDao;
	@Autowired
	private VworklistDao vworklistDao;
	@Autowired
	private FundinglistDao fundlistDao;
	
//-------------------회원관련 시작-------------------------------------------------
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

	public void insertSlist(Map<String, Map<String, String>> data) {
		for(Map.Entry<String, Map<String,String>> me : data.entrySet()) {
			Shelter shelter = new Shelter();
			shelter.setShelter_no(me.getKey().toString());
			shelter.setShelter_name(me.getValue().toString().split("=")[0].substring(1));
			shelter.setShelter_address(me.getValue().toString().split("=")[1].substring(0, me.getValue().toString().split("=")[1].indexOf("}")));
			shelter.setShelter_tel(" ");
			//System.out.println("보호소 코드 : " + me.getKey() + " 보호소명 : " + me.getValue().toString().split("=")[0].substring(1) + " 지역구 : " + me.getValue().toString().split("=")[1].substring(0, me.getValue().toString().split("=")[1].indexOf("}")) + "<br>");
			try {
			    adminDao.insert(shelter);
			} catch (Exception e) {
//				adminDao.update(shelter);
			}
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
	
	public void memUpdate(Member mem) {
		memberDao.memUpdate(mem);
	}
	
	public void memPassUpdate(String newpass, String id) {
		memberDao.memPassUpdate(newpass,id);
	}
	
	public List<Vwork> getMyvworkList(String id) {
		return vworklistDao.getMyvworkList(id);
	}
	
	public List<Buylist> getbuylist(String id) {
		return buylistDao.list(id);
	}
	
	public List<BuyItem> getbuyitemlist(int buy_no) {
		return buyitemDao.list(buy_no);
	}
	
	public List<Fundinglist> getMyfundlist(String id) {
		return fundlistDao.list(id);
	}
	
	public List<Fundinglist> getMyendfundlist(String id) {
		return fundlistDao.endlist(id);
	}
	
//-------------------회원관련 끝-------------------------------------------------
	
//-------------------봉사관련 시작------------------------------------------------- 
	public Shelter getShelter(String shelter_no) {
		return shelterDao.getShelter(shelter_no);
	}
	
	public List<Shelter> getShelters(String goo) {
		return shelterDao.getShelters(goo);
	}

	public List<Shelter> getShelterlist() {
		return  shelterDao.getShelterlist();
	}
	public void vWrite(Vwork vwork, HttpServletRequest request) {
		int max = vworkDao.maxno();
		vwork.setVwork_no(++max);
		
		vworkDao.insertVwork(vwork);
	}
	
	public HashSet<String> allvwork() {
		return vworkDao.allvwork();
	}
	
	public HashSet<String> sheltervwork(String shelter_no) {
		return vworkDao.sheltervwork(shelter_no);
	}

	public int getNowmem(int Vno) {
		return vworkDao.getNowmem(Vno);
	}
	
	public int getListcnt(String date) {
		return vworkDao.getListcnt(date);
	}
	
	public Vwork getVwork(String vwork_no) {		
		return vworkDao.getVwork(vwork_no);
	}

	public List<Vwork> getVlist(String date) {
		return vworkDao.getVlist(date);
	}

	public void vJoin(Vworklist vworklist, HttpServletRequest request) {
		vworkDao.vJoin(vworklist);
	}
	
	public void vUpdate(Vwork vwork, HttpServletRequest request) {
		vworkDao.updateVwork(vwork);
	}
	
	public void vdelete(String vwork_no) {
		vworkDao.deleteVwork(vwork_no);
	}


	

//-------------------봉사관련 끝-------------------------------------------------

//-------------------펀딩관련 시작-------------------------------------------------
		   
	
			  public List<Funding> getFundingList() { 
				  return fundingDao.list();
			  }
			 

		   public void fundCreate(Funding funding, HttpServletRequest request) { 
		      if(funding.getPicture() != null && !funding.getPicture().isEmpty()) {
		         uploadFileCreate(funding.getPicture(),request,"funding/img/");
		         funding.setFund_pic(funding.getPicture().getOriginalFilename());
		      }
		      int fund_no =fundingDao.maxfundno() ;
		      funding.setFund_no(++fund_no);
		      fundingDao.fundinsert(funding);
		   }

		public void fundUpdate(Funding funding, HttpServletRequest request) {
		  if(funding.getPicture() != null && !funding.getPicture().isEmpty()) {
		   uploadFileCreate(funding.getPicture(),request,"funding/img/");
		   funding.setFund_pic(funding.getPicture().getOriginalFilename());	
		}
		  fundingDao.fundupdate(funding); 
		}
		public void fundDelete(String fund_no) {
			fundingDao.fundDelete(fund_no);		
		}
		
		public Funding getfundingdetail(String fund_no) {
	           return fundingDao.selectOne(fund_no);
			}
			

		
		
//-------------------펀딩관련 끝-------------------------------------------------
//-------------------쇼핑관련 시작-------------------------------------------------
		public List<Item> getItemList() {
			return itemDao.list();
		}
		
		private void uploadItemImg(MultipartFile itemimg, HttpServletRequest request, String path) {
			String orgFile = itemimg.getOriginalFilename();
			String uploadPath = request.getServletContext().getContextPath()+ "/" + path;
			System.out.println(uploadPath);	
			File fpath = new File(uploadPath);
			if(!fpath.exists()) fpath.mkdirs();
			try {
				itemimg.transferTo(new File(uploadPath + orgFile));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		public void itemCreate(@Valid Item item, HttpServletRequest request) {
			if(item.getPicture() != null && !item.getPicture().isEmpty()) {
				uploadFileCreate(item.getPicture(),request,"item/img");
				item.setItem_picture(item.getPicture().getOriginalFilename());
			}
			itemDao.insert(item);
		}


		public Item itemselect(Integer item_no) {
			return itemDao.selectOne(item_no);
		}

		public Buylist checkend(Member loginmem, Cart cart) {
			Buylist buylist = new Buylist();
			int buy_no = buylistDao.getMaxSaleid();
			buylist.setBuy_no(++buy_no);
			buylist.setMember_id(loginmem.getMember_id());
			buylist.setBuy_address(loginmem.getMember_address());
			buylist.setBuy_daddress(loginmem.getMember_daddress());
			buylist.setBuy_postcode(loginmem.getMember_postcode());
			buylist.setBuy_tel(loginmem.getMember_tel());
			buylist.setMember(loginmem);
			buylistDao.insert(buylist);
			List<ItemSet> itemList = cart.getItemSetList(); //cart 상품 정보
			int i = 0;
			for(ItemSet is : itemList) {
				int seq = ++i;
				BuyItem saleItem = new BuyItem(buylist.getBuy_no(),seq,is);
				buylist.getItemList().add(saleItem);
				buyitemDao.insert(saleItem);
			}
			return buylist;
		}

		public Buylist checkend2(@Valid Buylist buylist, Cart cart) {
			int buy_no = buylistDao.getMaxSaleid();
			buylist.setBuy_no(++buy_no);
			buylistDao.insert(buylist);
			List<ItemSet> itemList = cart.getItemSetList(); //cart 상품 정보
			int i = 0;
			for(ItemSet is : itemList) {
				int seq = ++i;
				BuyItem saleItem = new BuyItem(buylist.getBuy_no(),seq,is);
				buylist.getItemList().add(saleItem);
				buyitemDao.insert(saleItem);
			}
			return buylist;
		}



//-------------------쇼핑관련 끝--------------------------------------------------

	
}