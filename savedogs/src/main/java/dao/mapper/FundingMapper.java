package dao.mapper;



import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import logic.Board;
import logic.Funding;

public interface FundingMapper {
	

	
	 @Select("select ifnull(max(fund_no),0) from funding") int maxfundno();
	
	
	 @Insert(" insert into funding (fund_no, member_id,sheltername,fund_subject, fund_count, start_date,end_date,fund_pic )"
			   + " values (#{fund_no}, #{member_id}, #{sheltername}, #{fund_subject}, #{fund_count}, #{start_date}, #{end_date}, #{fund_pic})")
	  void fundinsert(Funding funding);

	/*
	 * @Select({"<script>", "select * from usersecurity",
	 * "<if test='userid != null'> where userid=#{userid} </if>",
	 * "<if test='userid == null'> where userid !='admin' </if>",
	 * "<if test='userids != null'> and userid in"
	 * +"<foreach collection='userids' item='id' separator=',' " +
	 * "open='(' close=')'>#{id}</foreach></if>", "</script>"}) List<Funding>
	 * select(Map<String, Object> param);
	 */

	@Update(" update funding set fund_subject = #{fund_subject},"
		   + " fund_subject=#{fund_subject}, start_date=#{start_date},"
		   + " end_date=#{end_date}, fund_count=#{fund_count}, fund_pic=#{fund_pic} where fund_no=#{fund_no}")
	void fundupdate(Funding funding);

	int maxfund_no();

    @Select({"<script>" ,
		"select f.fund_no, f.member_id, f.fund_subject, f.fund_count, f.sheltername, f.start_date, f.end_date, f.fund_pic, datediff(f.end_date,now()) restdate, ifnull(if(ROUND(sum(l.fund_cost)*100/(f.fund_count))>100,100,ROUND(sum(l.fund_cost)*100/(f.fund_count))),0) 'complete' from funding f left join fundinglist l ON f.fund_no = l.fund_no",
		"<if test='fund_no != null'> where f.fund_no=${fund_no} </if>",
		"<if test='member_id != null'> where f.member_id=#{member_id} </if>",
		"<if test='startrow != null and limit != null'> where datediff(f.end_date,now()) > 0 GROUP BY f.fund_no order by datediff(f.end_date,now()) limit ${startrow},${limit} </if>",
    "</script>"})
     List<Funding> select(Map<String, Object> param);
	
    @Delete( "delete from funding where fund_no = ${fund_no}")
	void funddelete(Map<String, Object> param);


    @Select(" SELECT COUNT(*) FROM funding where datediff(end_date,now()) > 0")
	int listcount();

    @Select("SELECT l.fund_no,f.end_date,f.fund_subject,"
    		+ "if(ROUND(sum(l.fund_cost)*100/(f.fund_count))>100,100,ROUND(sum(l.fund_cost)*100/(f.fund_count))) 'complete' "
    		+ "FROM funding f JOIN fundinglist l ON f.fund_no=l.fund_no WHERE f.end_date > NOW() GROUP BY l.fund_no order BY f.end_date ASC limit 0,4")
    List<Funding> duefunding();

	
    
 
	/*  //shelter_name 가져오기 shelter_no 겹침
	 * @Select({"<script>" "select shelter_name, "<if test='shelter_no != null'> }
	 */
    
	  }

