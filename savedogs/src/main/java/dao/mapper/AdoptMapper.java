package dao.mapper;

import org.apache.ibatis.annotations.Insert;

import logic.AdoptSign;

public interface AdoptMapper {

	@Insert("insert into adopt "
			+ " (member_id, dog_no, shelter_no, adopt_date, adopt_etc, adopt_file) "
			+ " values (#{member_id}, #{dog_no}, #{shelter_no}, now(), 0, #{adopt_file})")
	void adoptInsert(AdoptSign a);

}
