package dao.mapper;

import java.util.List;

import java.util.Map;

import org.apache.ibatis.annotations.Insert;



import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import logic.Board;

import logic.Board;

public interface BoardMapper {

	@Select("select ifnull(max(board_no),0) from board")
	int maxno();


	@Insert("insert into board (board_no, member_id, subject, content, type, grp, grplevel, grpstep, regdate, readcnt, file1) values "
			+ "(${board_no},#{member_id},#{subject},#{content},#{type},#{grp},#{grplevel},#{grpstep},now(),0,#{fileurl})")
	void insertBoard(Board board);

	@Select("select * from board where board_no = #{board_no}")
	Board getBoard(String board_no);

	@Select("select count(*) from board where type = #{type}")
	int getTypecnt(String type);

	@Select({"<script>",
		"select board_no,member_id,subject,content,type,grp,grplevel,grpstep,regdate,readcnt,file1 fileurl from board ",
		"<if test='type != null'> where type = #{type} </if>",
		"<if test='startrow != null and limit != null'>order by grp desc, grpstep limit #{startrow}, #{limit} </if>",
		"</script>"})
	List<Board> boardlist(Map<String, Object> param);

	@Update("update board set readcnt = readcnt+1 where board_no = #{board_no}")
	void cntup(String board_no);

	
													

	@Select("select * from board where type = 1 limit 0,4")
	List<Board> mainnotice();


}
