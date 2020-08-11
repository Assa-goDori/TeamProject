package dao.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;

import logic.Shelter;

public interface AdminMapper {

	@Insert("insert into shelter "
			+ "(shelter_no, shelter_name, shelter_address, shelter_tel) "
			+ " values(#{shelter_no}, #{shelter_name}, #{shelter_address}, #{shelter_tel})")
	void insert(Shelter shelter);

	@Delete("delete from shelter")
	void deleteAll();

	@Insert("insert into shelter (shelter_no, shelter_name) values('111111111111111', '일반회원')")
	void insertInit();

}
