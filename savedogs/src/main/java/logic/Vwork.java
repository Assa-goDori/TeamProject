package logic;

import java.util.Date;

import org.hibernate.validator.constraints.NotEmpty;

public class Vwork {
	private int vwork_no;
	private int shelter;
	private String member_id;
	private Date vwork_date;
//	@NotEmpty(message="모집인원을 입력해주세요")
	private int vwork_member;
//	@NotEmpty(message="설명을 입력해주세요")
	private String vwork_content;
	
	public int getVwork_no() {
		return vwork_no;
	}
	public void setVwork_no(int vwork_no) {
		this.vwork_no = vwork_no;
	}
	public int getShelter() {
		return shelter;
	}
	public void setShelter(int shelter) {
		this.shelter = shelter;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public Date getVwork_date() {
		return vwork_date;
	}
	public void setVwork_date(Date vwork_date) {
		this.vwork_date = vwork_date;
	}
	public int getVwork_member() {
		return vwork_member;
	}
	public void setVwork_member(int vwork_member) {
		this.vwork_member = vwork_member;
	}
	public String getVwork_content() {
		return vwork_content;
	}
	public void setVwork_content(String vwork_content) {
		this.vwork_content = vwork_content;
	}
	@Override
	public String toString() {
		return "Vwork [vwork_no=" + vwork_no + ", shelter=" + shelter + ", member_id=" + member_id + ", vwork_date="
				+ vwork_date + ", vwork_member=" + vwork_member + ", vwork_content=" + vwork_content + "]";
	}
	
}
