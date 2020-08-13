package dao.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;

import logic.Shelter;

public interface ShelterMapper {

	@Select("select * from shelter where shelter_no=#{shelter_no}")
	Shelter selectShelter(String shelter_no);

	@Select("select * from shelter where shelter_address=#{goo}")
	List<Shelter> selectShelters(String goo);

	@Select("select * from shelter")
	List<Shelter> selectShelterlist();

}
