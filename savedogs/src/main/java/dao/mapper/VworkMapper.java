package dao.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import logic.Vwork;

public interface VworkMapper {

	@Select("select ifnull(max(vwork_no),0) from vwork")
	int maxno();

	@Insert("insert into vwork (vwork_no, shelter_no, member_id, vwork_date, vwork_member, vwork_content) "
			+ "values (#{vwork_no}, #{shelter_no}, #{member_id}, #{vwork_date}, #{vwork_member}, #{vwork_content})")
	void insertVwork(Vwork vwork);

}
