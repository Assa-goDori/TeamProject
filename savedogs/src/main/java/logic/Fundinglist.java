package logic;

import java.util.Date;

public class Fundinglist {

	private int fund_no;
	private String fund_id;
	private Date fund_date;
	private int fund_cost;
	public int getFund_no() {
		return fund_no;
	}
	public void setFund_no(int fund_no) {
		this.fund_no = fund_no;
	}
	public String getFund_id() {
		return fund_id;
	}
	public void setFund_id(String fund_id) {
		this.fund_id = fund_id;
	}
	public Date getFund_date() {
		return fund_date;
	}
	public void setFund_date(Date fund_date) {
		this.fund_date = fund_date;
	}
	public int getFund_cost() {
		return fund_cost;
	}
	public void setFund_cost(int fund_cost) {
		this.fund_cost = fund_cost;
	}
	@Override
	public String toString() {
		return "Fundinglist [fund_no=" + fund_no + ", fund_id=" + fund_id + ", fund_date=" + fund_date + ", fund_cost="
				+ fund_cost + "]";
	}
	
	
	}
