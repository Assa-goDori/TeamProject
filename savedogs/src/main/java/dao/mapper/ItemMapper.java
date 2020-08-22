package dao.mapper;

import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import logic.Item;

public interface ItemMapper {
	
	@Select({"<script>",
		"select * from item ",
		"<if test ='item_no !=null'> where item_no=#{item_no} </if>",
		"</script>"})
	List<Item> select(Map<String, Object> param);
	
	@Select("select ifnull(max(item_no),0) from item")
	int maxitem_no();

	@Insert("insert into item (item_no,item_name,item_price,item_content,item_picture,item_code,item_state) values(#{item_no}, #{item_name}, #{item_price}, #{item_content}, #{item_picture}, #{item_code},0)")
	void insert(@Valid Item item);

	@Select("SELECT i.item_picture,i.item_name,b.item_no,SUM(b.item_each) 'sellCnt' FROM buydetail b join item i on i.item_no=b.item_no where i.item_state = 0 GROUP BY item_no ORDER BY sellCnt DESC LIMIT 0,3")
	List<Item> bestitem();

	@Select("SELECT i.item_no, i.item_code, i.item_name, i.item_price, i.item_state, sum(item_each) sellCnt FROM item i JOIN buydetail b ON i.item_no = b.item_no GROUP BY i.item_no")
	List<Item> getShopall();

	@Update("update item set item_state=${item_state} where item_no=${item_no}")
	void updateState(Map<String, Object> param);

	@Update("update item set item_name=#{item_name}, item_price=#{item_price}, item_content=#{item_content}, item_picture=${item_picture}, item_code=#{item_code} where item_no=#{item_no}")
	void UpdateItem(@Valid Map<String, Object> param);
}
