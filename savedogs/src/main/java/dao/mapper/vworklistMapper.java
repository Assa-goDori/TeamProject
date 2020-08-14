package dao.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import logic.Vwork;

public interface vworklistMapper {
	@Select("SELECT a.vwork_no, a.vwork_id, a.vwork_date, shelter.shelter_no, shelter.shelter_name, shelter.shelter_address"
			+ " FROM (SELECT vl.vwork_no, vl.vwork_id, vl.vwork_date, vl.vwork_tel, v.shelter_no FROM vwork v, vworklist vl WHERE v.vwork_no = vl.vwork_no AND vl.vwork_id=#{id}) a, shelter"
			+ " WHERE a.shelter_no=shelter.shelter_no")
	List<Vwork> getMyvworkList(String id);

}
