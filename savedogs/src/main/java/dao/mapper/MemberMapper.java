package dao.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import logic.Member;

public interface MemberMapper {

	@Insert("insert into member "
			+ "(member_id, member_pass, member_email, member_tel, member_postcode, member_address, member_daddress, member_birthday, del_tf)"
			+ " values (#{member_id}, #{member_pass}, #{member_email}, #{member_tel}, #{member_postcode}, #{member_address}, #{member_daddress}, #{member_birthday}, true)")
	void memberInsert(Member mem);

	@Select("select * from member where member_id=#{member_id}")
	Member selectMem(String member_id);

}