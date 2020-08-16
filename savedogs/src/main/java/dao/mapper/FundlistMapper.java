package dao.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import logic.Fundinglist;

public interface FundlistMapper {

	@Select("SELECT * FROM funding f join fundinglist fl WHERE f.fund_no=fl.fund_no AND fund_id=#{id} AND DATEDIFF(f.end_date, NOW()) >= 0")
	List<Fundinglist> list(String id);
	
	@Select("select * from funding f join fundinglist fl where f.fund_no=fl.fund_no and fund_id=#{id} and datediff(f.end_date, now()) < 0")
	List<Fundinglist> endlist(String id);
}