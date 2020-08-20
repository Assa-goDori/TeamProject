package dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.mapper.BoardMapper;
import logic.Board;

@Repository
public class BoardDao {
	@Autowired
	private SqlSessionTemplate template;
	Map<String, Object> param = new HashMap<>();
	
	public int maxno() {
		return template.getMapper(BoardMapper.class).maxno();
	}
	
	public void insertBoard(Board board) {
		
		
	}
	
	
}
