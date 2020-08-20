package dao.mapper;

import org.apache.ibatis.annotations.Select;

public interface BoardMapper {

	@Select("select ifnull(max(vwork_no),0) from board")
	int maxno();

}
