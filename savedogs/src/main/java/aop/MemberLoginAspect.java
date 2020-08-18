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
	@Around // adivce중 하나.
	("execution(* controller.*.chkm*(..)) && args(..,session)")
	public Object memberLoginCheck(ProceedingJoinPoint joinPoint,HttpSession session) throws Throwable{
		Member loginmem = (Member)session.getAttribute("loginmem");
		if(loginmem == null) {
			throw new LoginException("로그인 후 거래하세요","../member/login.shop");
		}
		Object ret = joinPoint.proceed();
		return ret;
	}
	
	@Around // adivce중 하나.
	("execution(* controller.*.chks*(..)) && args(..,session)")
	public Object shelterLoginCheck(ProceedingJoinPoint joinPoint,HttpSession session) throws Throwable{
		Member loginsmem = (Member)session.getAttribute("loginsmem");
		if(loginsmem == null) {
			throw new LoginException("보호소 관리자로 로그인 후 거래하세요","../member/login.shop");
		}
		Object ret = joinPoint.proceed();
		return ret;
	}
	
	@Around 
	("execution(* controller.*.chks*(..)) && args(..,session)")
	//chkmi : check member id 를 줄여서 표현 해보았습니다. 본인확인 부분은 chkmi 로 해주세요
	
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
