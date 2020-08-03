package logic;

import java.util.Date;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Past;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.DateTimeFormat;

public class Member {
	@Size(min=4, message="아이디는 4자 이상으로 입력하세요.")
	private String member_id;
	@NotEmpty(message="이름을 입력하세요.")
	private String member_name;
	@Size(min=4, message="비밀번호는 4자리 이상으로 입력하세요.")
	private String member_pass;
	private String member_pass2;
	@NotEmpty(message="이메일을 입력하세요.")
	@Email(message="email형식에 맞게 입력하세요.")
	private String member_email;
	@NotNull(message="전화번호를 입력하세요.")
	private String member_tel;
	private int member_postcode;
	private String member_address;
	private String member_daddress;
	@NotNull(message="생일을 입력하세요.")
	@Past(message="생일은 과거 날짜만 가능합니다..")
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date member_birthday;
	private boolean del_df;
	
	//getter,setter
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getMember_pass() {
		return member_pass;
	}
	public void setMember_pass(String member_pass) {
		this.member_pass = member_pass;
	}
	public String getMember_pass2() {
		return member_pass2;
	}
	public void setMember_pass2(String member_pass2) {
		this.member_pass2 = member_pass2;
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
		return "Member [member_id=" + member_id + ", member_name=" + member_name + ", member_pass=" + member_pass
				+ ", member_pass2=" + member_pass2 + ", member_email=" + member_email + ", member_tel=" + member_tel
				+ ", member_postcode=" + member_postcode + ", member_address=" + member_address + ", member_daddress="
				+ member_daddress + ", member_birthday=" + member_birthday + ", del_df=" + del_df + "]";
	}
}