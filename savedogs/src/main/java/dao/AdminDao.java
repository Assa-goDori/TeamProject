package dao;

import java.util.HashMap;
import java.util.List;
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
		System.out.println("AdminDao : " + shelter);
		template.getMapper(AdminMapper.class).insert(shelter);
	}

	public void deleteAllList() {
		template.getMapper(AdminMapper.class).deleteAll();
	}

	public void insertInit() {
		template.getMapper(AdminMapper.class).insertInit();
	}

	public List<Shelter> getAddressList() {
		return template.getMapper(AdminMapper.class).getAddressList();
	}

	public List<Shelter> getShelterName(String goo) {
		param.clear();
		param.put("goo", goo);
		return template.getMapper(AdminMapper.class).getShelterName(param);
	}
}