package logic;

import java.util.Date;

import javax.validation.constraints.FutureOrPresent;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;

public class Funding {

	private int fund_no;
	private String member_id;
	private String sheltername;
	private String funding_subject;
	@NotEmpty(message="제목을 입력하세요")
	private int count;
	@NotEmpty(message="목표금액을 입력하세요")
	private Date start_date;
	@NotEmpty(message="날짜를 선택하세요")
	@FutureOrPresent(message="과거날짜는 입력할 수 없습니다.")
	private Date end_date;
	@NotEmpty(message="날짜를 선택하세요")
	@FutureOrPresent(message="과거날짜는 입력할 수 없습니다.")
	private String fund_pic; //사진 파일 명
	private MultipartFile picture; //사진
	public int getFundno() {
		return fund_no;
		
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getSheltername() {
		return sheltername;
	}
	public void setSheltername(String sheltername) {
		this.sheltername = sheltername;
	}
	public String getFunding_subject() {
		return funding_subject;
	}
	public void setFunding_subject(String funding_subject) {
		this.funding_subject = funding_subject;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public Date getStart_date() {
		return start_date;
	}
	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}
	public Date getEnd_date() {
		return end_date;
	}
	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}
	public String getFund_pic() {
		return fund_pic;
	}
	public void setFund_pic(String fund_pic) {
		this.fund_pic = fund_pic;
	}
	public MultipartFile getPicture() {
		return picture;
	}
	public void setPicture(MultipartFile picture) {
		this.picture = picture;
	}
	public void setFundno(int fund_no) {
		this.fund_no = fund_no;
	}
	@Override
	public String toString() {
		return "Funding [fund_no=" + fund_no + ", member_id=" + member_id + ", funding_subject=" + funding_subject
				+ ", sheltername=" + sheltername + ", count=" + count + ", start_date=" + start_date + ", end_date="
				+ end_date + "]";
	} 
	
	
}
