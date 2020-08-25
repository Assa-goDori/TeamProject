package dao.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import logic.AdoptSign;

public interface AdoptMapper {

	@Insert("insert into adopt "
			+ " (member_id, dog_no, shelter_no, adopt_date, adopt_etc, adopt_file) "
			+ " values (#{member_id}, #{dog_no}, #{shelter_no}, now(), 0, #{adopt_file})")
	void adoptInsert(AdoptSign a);

	@Select("select * from adopt where member_id=#{id}")
	List<AdoptSign> getMyadoptlist(String id);

	@Select("select * from adopt" +
			" where shelter_no = (" +
			" select shelter_no from member where member_id=#{id})")
	List<AdoptSign> getShelteradoptlist(String id);

	@Update("update adopt set adopt_etc=${adopt_etc} where dog_no=#{dog_no}")
	void updateEtc(Map<String, Object> param);

	
}
