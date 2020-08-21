package controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import exception.VworkException;
import logic.DogService;
import logic.Funding;
import logic.Fundinglist;
import logic.Member;
import logic.Shelter;
import logic.Vwork;

@Controller  // @Component + controller(요청을 받을 수 있는 객체)
@RequestMapping("funding") // /funding/ 요청시
public class FundingController {

      @Autowired
      private DogService service;
      
      @RequestMapping("*")
      public ModelAndView fregForm() {
          ModelAndView mav = new ModelAndView();
          Funding f = new Funding();
          mav.addObject("f",f);
          return mav; // WEB-INF/view/userEntry.jsp
        }
      
      @PostMapping("fregForm") 
        public ModelAndView fregForm(@Valid Funding funding, BindingResult bresult, HttpServletRequest request) {
            ModelAndView mav = new ModelAndView();
		/*
		 * if(bresult.hasErrors()) { mav.getModel().putAll(bresult.getModel()); return
		 * mav; }
		 */
            System.out.println(funding);
            service.fundCreate(funding,request);
            mav.setViewName("redirect:/list.dog");
            return mav;      
        
          }
  	@PostMapping("fregupdateForm")
  	public ModelAndView fregupdateForm(@Valid Funding funding, 
  			BindingResult bresult,HttpServletRequest request) {
  		ModelAndView mav = new ModelAndView("funding/fregupdateForm");
  		if(bresult.hasErrors()) {
  			mav.getModel().putAll(bresult.getModel());
  			return mav;
  		}
  		//db,파일업로드
  		service.fundUpdate(funding,request);
  		mav.setViewName("redirect:/funding/fregForm.dog?id="+funding.getFund_no());
  		return mav;
  	}
	@PostMapping("delete")
	public ModelAndView fundDelete(String fund_no) {
		ModelAndView mav = new ModelAndView();
		System.out.println(fund_no);
		service.fundDelete(fund_no);
		mav.setViewName("redirect:/funding/list.dog");
		return mav;		
	}	
	 @RequestMapping("list") // /item/list.shop
	  public ModelAndView list() {
	  ModelAndView mav = new ModelAndView(); 
	  List<Funding> fundinglist = service.getFundingList(); 
	  mav.addObject("fundinglist",fundinglist); 
	 return mav; 
	 }
	 @GetMapping({"detail", "fundingapply"})
	   public ModelAndView detail(String fund_no) {
		 ModelAndView mav = new ModelAndView();
		 Funding funding = service.getfundingdetail(fund_no);
		 //service.readcnt(num);
		 mav.addObject("funding",funding);
		 return mav;
	 }
	

	 @PostMapping("fundingapply")
	  public ModelAndView apply(@Valid Fundinglist fundinglist, BindingResult bresult, HttpServletRequest request) {
          ModelAndView mav = new ModelAndView();
          System.out.println(fundinglist);
          service.fundingapply(fundinglist,request);
          mav.setViewName("redirect:/detail.dog"); //mypage로
          return mav;      
      
        }

	  
	 
	 
	 
	 
	 
	
}