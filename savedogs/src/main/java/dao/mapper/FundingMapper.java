package dao.mapper;



import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import logic.Funding;

public interface FundingMapper {
	

	
	 @Select("select ifnull(max(fund_no),0) from funding") int maxfundno();
	
	
	 @Insert(" insert into funding (fund_no, member_id,sheltername,funding_subject, count, start_date,end_date,fund_pic)"
			   + " values (2, #{member_id}, #{sheltername}, #{funding_subject}, #{count}, #{start_date}, #{end_date}, #{fund_pic})")
	  void insert(Funding funding);

	/*
	 * @Select({"<script>", "select * from usersecurity",
	 * "<if test='userid != null'> where userid=#{userid} </if>",
	 * "<if test='userid == null'> where userid !='admin' </if>",
	 * "<if test='userids != null'> and userid in"
	 * +"<foreach collection='userids' item='id' separator=',' " +
	 * "open='(' close=')'>#{id}</foreach></if>", "</script>"}) List<Funding>
	 * select(Map<String, Object> param);
	 */

	@Update(" update funding set funding_subject = #{funding_subject},"
		   + " count=#{count}, start_date=#{start_date},"
		   + " end_date=#{end_date}, picture=#{fund_pic} where fund_no=#{fund_no}")
	void update(Funding funding);

	int maxfund_no();

    @Select({"<script>" ,
    		"select * from funding",
    		"<if test='fund_no != null'> where fund_no=#{fund_no} </if>",
    		"</script>"})
	List<Funding> select(Map<String, Object> param);
	 
	/*
	 * @Delete( "delete from usersecurity where userid = #{userid} ") void
	 * delete(Map<String, Object> param);
	 */
	  
	       		

	  }


