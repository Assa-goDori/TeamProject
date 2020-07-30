package logic;

import java.util.Date;

public class Member {
	private String member_id;
	private String member_pass;
	private String member_email;
	private String member_tel;
	private int member_postcode;
	private String member_address;
	private String member_daddress;
	private Date member_birthday;
	private boolean del_df;
	
	//getter,setter
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_pass() {
		return member_pass;
	}
	public void setMember_pass(String member_pass) {
		this.member_pass = member_pass;
	}
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	public String getMember_tel() {
		return member_tel;
	}
	public void setMember_tel(String member_tel) {
		this.member_tel = member_tel;
	}
	public int getMember_postcode() {
		return member_postcode;
	}
	public void setMember_postcode(int member_postcode) {
		this.member_postcode = member_postcode;
	}
	public String getMember_address() {
		return member_address;
	}
	public void setMember_address(String member_address) {
		this.member_address = member_address;
	}
	public String getMember_daddress() {
		return member_daddress;
	}
	public void setMember_daddress(String member_daddress) {
		this.member_daddress = member_daddress;
	}
	public Date getMember_birthday() {
		return member_birthday;
	}
	public void setMember_birthday(Date member_birthday) {
		this.member_birthday = member_birthday;
	}
	public boolean isDel_df() {
		return del_df;
	}
	public void setDel_df(boolean del_df) {
		this.del_df = del_df;
	}
	@Override
	public String toString() {
		return "Member [member_id=" + member_id + ", member_pass=" + member_pass + ", member_email=" + member_email
				+ ", member_tel=" + member_tel + ", member_postcode=" + member_postcode + ", member_address="
				+ member_address + ", member_daddress=" + member_daddress + ", member_birthday=" + member_birthday
				+ ", del_df=" + del_df + "]";
	}
}