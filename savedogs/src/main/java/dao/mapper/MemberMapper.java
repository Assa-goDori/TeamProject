package dao.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import logic.Member;

public interface MemberMapper {

	@Insert("insert into member "
			+ "(member_id, shelter_no, member_pass, member_name, member_email, member_tel, member_postcode, member_address, member_daddress, member_birthday, del_tf, member_type)"
			+ " values (#{member_id}, 111111111111111, #{member_pass}, #{member_name}, #{member_email}, #{member_tel}, #{member_postcode}, #{member_address}, #{member_daddress}, #{member_birthday}, true, 0)")
	void memberInsert(Member mem);

	@Insert("insert into member "
			+ "(member_id, member_name, shelter_no, member_pass, member_email, member_tel, del_tf, member_type, file1, file2)"
			+ " values (#{member_id}, #{member_name}, #{shelter_no}, #{member_pass}, #{member_email}, #{member_tel}, true, 1, #{file1}, #{file2})")
	void smemberInsert(Member mem);
	
	@Select("select * from member where member_id=#{member_id}")
	Member selectMem(String member_id);

}