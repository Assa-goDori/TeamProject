package dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.mapper.AdminMapper;
import logic.Shelter;

@Repository
public class AdminDao {
	@Autowired
	private SqlSessionTemplate template;
	Map<String, Object> param = new HashMap<>();

	public void insert(Shelter shelter) {
		template.getMapper(AdminMapper.class).insert(shelter);
	}
}