package dao.mapper;

import org.apache.ibatis.annotations.Select;

import logic.Shelter;

public interface ShelterMapper {

	@Select("select * from shelter where shelter_no=#{shelter_no}")
	Shelter selectShelter(String shelter_no);

}
