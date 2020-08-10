package dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.mapper.MemberMapper;
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
}