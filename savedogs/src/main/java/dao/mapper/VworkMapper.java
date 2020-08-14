package dao.mapper;

import java.util.HashSet;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import logic.Vwork;

public interface VworkMapper {

	@Select("select ifnull(max(vwork_no),0) from vwork")
	int maxno();

	@Insert("insert into vwork (vwork_no, shelter_no, member_id, vwork_date, vwork_member, vwork_content) "
			+ "values (#{vwork_no}, #{shelter_no}, #{member_id}, #{vwork_date}, #{vwork_member}, #{vwork_content})")
	void insertVwork(Vwork vwork);

	@Select("select vwork_date from vwork")
	HashSet<String> allvwork();

	@Select("select vwork_date from vwork where shelter_no = #{shelter_no}")
	HashSet<String> sheltervwork(String shelter_no);

	@Select("select count(*) from vworklist where vwork_no = #{vwork_no}")
	int getNowmem(int vwork_no);

	@Select("select count(*) from vwork where vwork_date = #{date}")
	int getListcnt(String date);

	@Select("select * from vwork where vwork_no = #{vwork_no}")
	Vwork getVwork(String vwork_no);

	@Select("select * from vwork where vwork_date = #{date}")
	List<Vwork> getVlist(String date);

}
