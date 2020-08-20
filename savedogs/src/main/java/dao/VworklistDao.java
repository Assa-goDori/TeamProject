package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.mapper.vworklistMapper;
import logic.Vwork;
import logic.Vworklist;

@Repository
public class VworklistDao {
	@Autowired
	private SqlSessionTemplate template;
	private Map<String, String> param = new HashMap<>();

	public List<Vwork> getMyvworkList(String id) {
		param.clear();
		param.put("id", id);
		return template.getMapper(vworklistMapper.class).getMyvworkList(id);
	}

	public List<Vworklist> getOnevworklist(String vwork_no) {
		param.clear();
		param.put("vwork_no", vwork_no);
		return template.getMapper(vworklistMapper.class).getOnevworklist(param);
	}
}