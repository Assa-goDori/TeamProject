package aop;

import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

import exception.LoginException;
import logic.Member;

@Component	
@Aspect		
@Order(3)	
public class AdminAspect {	
	@Around // adivce중 하나.
	("execution(* controller.Item*.*admin(..))")
	public Object userLoginCheck(ProceedingJoinPoint joinPoint) throws Throwable{
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
		if(!loginmem.getMember_id().equals("admin")) {
			throw new LoginException("관리자만 가능한 거래입니다.","../main.dog?member_id="+loginmem.getMember_id());
		}
		Object ret = joinPoint.proceed();
		return ret;
	}
}
