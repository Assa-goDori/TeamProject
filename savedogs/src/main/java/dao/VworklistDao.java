package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.mapper.vworklistMapper;
import logic.Vwork;

@Repository
public class VworklistDao {
	@Autowired
	private SqlSessionTemplate template;
	private Map<String, String> param = new HashMap<>();

	public List<Vwork> getVworkList(String id) {
		param.clear();
		param.put("id", id);
		return template.getMapper(vworklistMapper.class).getVworkList(id);
	}
}