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
@Order(1)
public class AdoptAspect {
	@Around("execution(* controller.Adopt*.chkm*(..))")
	public Object AdoptMemberLoginCheck(ProceedingJoinPoint joinPoint) throws Throwable {
		Member loginmem = null;
		Member loginadmin = null;
		for (Object o : joinPoint.getArgs()) {
			if (o instanceof HttpSession) {
				HttpSession session = (HttpSession) o;
				loginadmin = (Member) session.getAttribute("loginadmin");
				loginmem = (Member) session.getAttribute("loginmem");
			}
		}
		if (loginmem == null && loginadmin == null) {
			throw new LoginException("로그인 후 거래하세요", "../member/login.dog");
		}
		Object ret = joinPoint.proceed();
		return ret;
	}
}
