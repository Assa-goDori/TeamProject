package dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import logic.Funding;
import dao.mapper.FundingMapper;

@Repository
public class FundingDao {
	@Autowired
	  private SqlSessionTemplate template;
	  private Map<String,Object> param = new HashMap<>();
	  
	  public void insert(Funding funding) {
		   template.getMapper(FundingMapper.class).insert(funding);
		}

	/*
	 * public Funding selectOne(String userid) { param.clear();
	 * param.put("userid",userid); return
	 * template.getMapper(FundingMapper.class).select(param).get(0);
	 * 
	 * }
	 */

		public void update(Funding funding) {
				   template.getMapper(FundingMapper.class).update(funding);
		}

	/*
	 * public void delete(String userid) { param.clear();
	 * param.put("userid",userid);
	 * template.getMapper(FundingMapper.class).delete(param); }
	 * 
	 * public List<Funding> list() { return
	 * template.getMapper(FundingMapper.class).select(null); }
	 * 
	 * public List<Funding> list(String[] idchks) { //select * from useraccount
	 * where userid in ('test1','test3') param.clear(); param.put("userids",idchks);
	 * return template.getMapper(FundingMapper.class).select(param); }
	 */
		}