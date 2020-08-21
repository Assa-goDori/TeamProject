package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.mapper.MemberMapper;
import logic.Idpw;
import logic.Member;

@Repository
public class MemberDao {
	@Autowired
	private SqlSessionTemplate template;
	Map<String, Object> param = new HashMap<>();
	
	public void memberInsert(Member mem) {
		template.getMapper(MemberMapper.class).memberInsert(mem);
	}

	public void smemberInsert(Member mem) {
		template.getMapper(MemberMapper.class).smemberInsert(mem);
	}
	
	public Member getMember(String member_id) {
		return template.getMapper(MemberMapper.class).selectMem(member_id);
	}

	public void memUpdate(Member mem) {
		template.getMapper(MemberMapper.class).memUpdate(mem);
	}

	public void memPassUpdate(String newpass, String id) {
		param.clear();
		param.put("pass", newpass);
		param.put("id", id);
		template.getMapper(MemberMapper.class).memPassUpdate(param);
	}

	public List<Member> memberList(String[] idchks) {
		param.clear();
		param.put("memberids", idchks);
		return template.getMapper(MemberMapper.class).memberList(param);
	}

	public String getMemberPass(String member_id) {
		return template.getMapper(MemberMapper.class).getMemberPass(member_id);
	}

	public List<Idpw> getFindId(String tel, String email) {
		param.clear();
		param.put("member_tel",tel);
		param.put("member_email",email);
		return template.getMapper(MemberMapper.class).selectmem(param);
	}
}