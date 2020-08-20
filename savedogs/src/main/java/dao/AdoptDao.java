package dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.mapper.AdoptMapper;
import logic.AdoptSign;

@Repository
public class AdoptDao {
	@Autowired
	private SqlSessionTemplate template;
	Map<String, Object> param = new HashMap<>();
	
	public void adoptInsert(AdoptSign a) {
		template.getMapper(AdoptMapper.class).adoptInsert(a);
	}

}
