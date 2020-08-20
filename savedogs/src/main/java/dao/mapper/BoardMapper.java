package dao.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import logic.Board;

public interface BoardMapper {

	@Select("select ifnull(max(vwork_no),0) from board")
	int maxno();

	@Select("select * from board where type = 1 limit 0,4")
	List<Board> mainnotice();

}
