package dao;

import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.mapper.VworkMapper;
import logic.Vwork;

@Repository
public class VworkDao {
	@Autowired
	private SqlSessionTemplate template;
	Map<String, Object> param = new HashMap<>();
	
	public int maxno() {
		return template.getMapper(VworkMapper.class).maxno();
	}

	public void insertVwork(Vwork vwork) {
		template.getMapper(VworkMapper.class).insertVwork(vwork);
		
	}

	public HashSet<String> allvwork() {
		return template.getMapper(VworkMapper.class).allvwork();
	}

	public HashSet<String> sheltervwork(String shelter_no) {
		return template.getMapper(VworkMapper.class).sheltervwork(shelter_no);
	}
}
