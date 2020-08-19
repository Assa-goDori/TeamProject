package aop;

import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

import exception.LoginException;
import logic.Member;;
 
@Component	
@Aspect		
@Order(1)	
public class MemberLoginAspect {
	@Around // 일반회원의 로그인 여부를 판단합니다.  	
//			("execution(* controller. <Item>*.chkm*(..)) && args(..,session)")  : <Item> 부분을 아래 Cart와 같이 바꾸어서 사용하시길 바랍니다.
//			매개변수의 위치는 상관이 없으나 HttpSession를 꼭 포함해야 합니다.
	("execution(* controller.Item*.chkm*(..))")
	public Object ItemMemberLoginCheck(ProceedingJoinPoint joinPoint) throws Throwable{
		Member loginmem = null;
		for(Object o : joinPoint.getArgs()) {
			if(o instanceof HttpSession) {
				HttpSession session = (HttpSession)o;
				loginmem = (Member)session.getAttribute("loginmem");
			}
		}
		if(loginmem == null) {
			throw new LoginException("로그인 후 거래하세요","../member/login.dog");
		}
		Object ret = joinPoint.proceed();
		return ret;
	}
	@Around 
	("execution(* controller.Cart*.chkm*(..)) && args(..,session)")
	public Object CartMemberLoginCheck(ProceedingJoinPoint joinPoint) throws Throwable{
		Member loginmem = null;
		for(Object o : joinPoint.getArgs()) {
			if(o instanceof HttpSession) {
				HttpSession session = (HttpSession)o;
				loginmem = (Member)session.getAttribute("loginmem");
			}
		}
		if(loginmem == null) {
			throw new LoginException("로그인 후 거래하세요","../member/login.dog");
		}
		Object ret = joinPoint.proceed();
		return ret;
	}
	
	@Around // 보호소 관리자의 로그인 여부를 판단합니다.  	
//	("execution(* controller.<Item>*.chks*(..)) && args(..,session)")  : <Item> 부분을 바꾸어서 사용하시길 바랍니다.
//	매개변수의 위치는 상관이 없으나 HttpSession를 꼭 포함해야 합니다.
	("execution(* controller.Item*.chks*(..))")
	public Object shelterLoginCheck(ProceedingJoinPoint joinPoint) throws Throwable{
		Member loginsmem = null;
		for(Object o : joinPoint.getArgs()) {
			if(o instanceof HttpSession) {
				HttpSession session = (HttpSession)o;
				loginsmem = (Member)session.getAttribute("loginsmem");
			}
		}
		if(loginsmem == null) {
			throw new LoginException("보호소 관리자로 로그인 후 거래하세요","../member/login.shop");
		}
		Object ret = joinPoint.proceed();
		return ret;
	}
	
	@Around 
//		chkmi : check id 를 줄여서 표현 해보았습니다. 본인확인 부분입니다.
//		("execution(* controller.<Item>*.chki*(..))") : <Item> 부분을 바꾸어서 사용하시길 바랍니다.
//	매개변수의 위치는 상관이 없으나 HttpSession를 꼭 포함해야 합니다.
	("execution(* controller.Item*.chki*(..))")
	public Object memberCheck(ProceedingJoinPoint joinPoint,String member_id) throws Throwable{
		Member loginmem = null;
		for(Object o : joinPoint.getArgs()) {
			if(o instanceof HttpSession) {
				HttpSession session = (HttpSession)o;
				loginmem = (Member)session.getAttribute("loginmem");
			}
		}
		if(loginmem == null) {
			throw new LoginException("로그인 후 거래하세요","login.dog");
		}else if(!loginmem.getMember_id().equals("admin") && !loginmem.getMember_id().equals(member_id)){
			throw new LoginException("본인만 거래가능합니다.","main.dog");
		}
		return joinPoint.proceed();
	}
}
