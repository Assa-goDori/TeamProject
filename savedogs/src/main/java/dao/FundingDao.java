package dao;

import java.util.HashMap;
import java.util.List;
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
	  
	  public List<Funding> list() { //list() -> foreach items
		  return template.getMapper(FundingMapper.class).select(null); 
	  }
	  
	// fund_no 증가
	  public int maxfundno() { return
	  template.getMapper(FundingMapper.class).maxfundno(); }
	 
	 
	  public void fundinsert(Funding funding) {
		   template.getMapper(FundingMapper.class).fundinsert(funding);
		}

	
	 public Funding selectOne(Integer fund_no) {
	 param.clear();
	 param.put("fund_no",fund_no); 
	 return template.getMapper(FundingMapper.class).select(param).get(0);
	 
	 }

	 public void fundupdate(Funding funding) {
	 template.getMapper(FundingMapper.class).fundupdate(funding);
		}
	 
	 public void fundDelete(Integer fund_no) {
		 param.clear();
		 param.put("fund_no",fund_no);
		 template.getMapper(FundingMapper.class).funddelete(param);
			}

	/*
	 * public void delete(String userid) { param.clear();
	 * param.put("userid",userid);
	 * template.getMapper(FundingMapper.class).delete(param); }
	 * 
	 
	 * 
	 * public List<Funding> list(String[] idchks) { //select * from useraccount
	 * where userid in ('test1','test3') param.clear(); param.put("userids",idchks);
	 * return template.getMapper(FundingMapper.class).select(param); }
	 */
		}