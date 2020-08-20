package dao;

import java.util.HashMap;
import java.util.List;
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
	private Map<String,Object> param = new HashMap<>();
	
	public int maxno() {
		return template.getMapper(BoardMapper.class).maxno();
	}
	
	public void insertBoard(Board board) {
		template.getMapper(BoardMapper.class).insertBoard(board);
		
	}

	public Board getBoard(String board_no) {
		return template.getMapper(BoardMapper.class).getBoard(board_no);
	}

	public int getTypecnt(String type) {
		return template.getMapper(BoardMapper.class).getTypecnt(type);
	}

	public List<Board> boardlist(Integer pageNum, int limit, String type) {
		param.clear();
		param.put("startrow",(pageNum-1) * limit);
		param.put("limit",limit);
		param.put("type",type);
		return template.getMapper(BoardMapper.class).boardlist(param);
	}

	public void cntup(String board_no) {
		template.getMapper(BoardMapper.class).cntup(board_no);
		
	}
	
	
}
