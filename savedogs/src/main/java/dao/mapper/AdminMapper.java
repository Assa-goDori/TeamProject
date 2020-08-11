package dao.mapper;

import org.apache.ibatis.annotations.Insert;

import logic.Shelter;

public interface AdminMapper {

	@Insert("insert into shelter "
			+ "(shelter_no, shelter_name, shelter_address, shelter_tel) "
			+ " values(#{shelter_no}, #{shelter_name}, #{shelter_address}, #{shelter_tel})")
	void insert(Shelter shelter);

}
