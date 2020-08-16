package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.mapper.FundlistMapper;
import logic.Fundinglist;

@Repository
public class FundinglistDao {
	
	@Autowired
	private SqlSessionTemplate template;
	Map<String, Object> param = new HashMap<>();
	
	public List<Fundinglist> list(String id) {
		param.clear();
		param.put("id", id);
		return template.getMapper(FundlistMapper.class).list(id);
	}

	public List<Fundinglist> endlist(String id) {
		param.clear();
		param.put("id", id);
		return template.getMapper(FundlistMapper.class).endlist(id);
	}
	
	
}