package dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.mapper.ItemMapper;
import logic.Item;

@Repository
public class ItemDao {
	@Autowired
	private SqlSessionTemplate template;
	private Map<String, Object> param = new HashMap<String, Object>();

	public List<Item> list() {
		return template.getMapper(ItemMapper.class).select(null);
	}

	public void insert(@Valid Item item) {
		param.clear();
		int item_no = template.getMapper(ItemMapper.class).maxitem_no();
		item.setItem_no(++item_no+"");
		param.put("item", item);
		template.getMapper(ItemMapper.class).insert(item);		
	}

	public Item selectOne(Integer item_no) {
		param.clear();
		param.put("item_no", item_no);
		return template.getMapper(ItemMapper.class).select(param).get(0);
	}

	public List<Item> bestItem() {
 		return template.getMapper(ItemMapper.class).bestitem();
	}

}
