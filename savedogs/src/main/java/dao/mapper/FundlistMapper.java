package dao.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import logic.Funding;
import logic.Fundinglist;

public interface FundlistMapper {

	@Select("SELECT * FROM funding f join fundinglist fl WHERE f.fund_no=fl.fund_no AND fund_id=#{id} AND DATEDIFF(f.end_date, NOW()) >= 0")
	List<Fundinglist> list(String id);
	
	@Select("select * from funding f join fundinglist fl where f.fund_no=fl.fund_no and fund_id=#{id} and datediff(f.end_date, now()) < 0")
	List<Fundinglist> endlist(String id);

	@Select("SELECT f.fund_id, m.member_email, f.fund_cost FROM member m, fundinglist f WHERE m.member_id=f.fund_id and fund_no=${fund_no}")
	List<Fundinglist> getOnefundlist(Map<String, Object> param);
	
	@Insert(" insert into fundinglist (fund_no, fund_subject,fund_id, fund_date, fund_cost,member_email)"
			   + " values (#{fund_no}, #{fund_subject}, #{fund_id}, now(), #{fund_cost}, #{member_email})")
	  void applyinsert(Fundinglist fundinglist);
	
}