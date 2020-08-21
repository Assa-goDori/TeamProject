package logic;

public class Idpw {
	private String member_id;
	private String member_pass;
	private String member_tel;
	private String member_email;
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
	public String getMember_tel() {
		return member_tel;
	}
	public void setMember_tel(String member_tel) {
		this.member_tel = member_tel;
	}
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	@Override
	public String toString() {
		return "Idpw [member_id=" + member_id + ", member_pass=" + member_pass + ", member_tel=" + member_tel
				+ ", member_email=" + member_email + "]";
	}
}
