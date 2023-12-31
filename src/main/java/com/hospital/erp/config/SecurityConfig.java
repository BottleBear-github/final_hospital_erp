package com.hospital.erp.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Lazy;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityCustomizer;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

import com.hospital.erp.member.MemberService;



@Configuration
@EnableWebSecurity
public class SecurityConfig {
	
	@Autowired
	private SecuritySuccessHandler securitySuccessHandler;
	
	
	private final MemberService memberService;
	
	@Autowired
    public SecurityConfig(@Lazy MemberService memberService) {
        this.memberService = memberService;
    }

	@Bean
	WebSecurityCustomizer webSecurityConfig() {
		//Security에서 무시해야하는 URL 패턴 등록
		return web -> web
			   .ignoring()
			   .antMatchers("/img/**")
			   .antMatchers("/css/**")
			   .antMatchers("/js/**")
			   .antMatchers("/vendors/**")
			   .antMatchers("/resources/**")
			   ;
	}
	
	@Bean
	SecurityFilterChain securityFilterChain(HttpSecurity httpSecurity) throws Exception{
		httpSecurity
			.cors()
			.and()
			.csrf()
			.disable()
			.authorizeHttpRequests()
				.antMatchers("/*").permitAll()
				.antMatchers
							(
							"/member/list",
							"/member/update",
							"/member/data",
							"/member/insert",
							"/member/update",
							"/member/updateExpired",
							"/member/listexpired",
							"/member/dataexpired",
							"/department/list",
							"/department/insert",
							"/department/update",
							"/board/notice/insert",
							"/board/notice/update/*",
							"/payment/allList"
							)
							.hasRole("ADMIN")
				.anyRequest().authenticated()
				.and()
			//form 관련 설정
			.formLogin()
				.loginPage("/") //내장된 로그인폼을 사용하지 않고, 개발자가 만든 폼을 사용
				.successHandler(securitySuccessHandler)
				.loginProcessingUrl("/")
				.failureUrl("/")
				.usernameParameter("memCd")
				.passwordParameter("memPw")
				.and()
			.logout()
				.logoutUrl("/logout")
				.logoutSuccessUrl("/")
				.invalidateHttpSession(true)
				.deleteCookies("JSESSIONID")
				.and()
			.rememberMe()
				.rememberMeParameter("rememberMe") //파라미터명
				.tokenValiditySeconds(604800)
				.key("rememberMe")
				.userDetailsService(memberService)
				.rememberMeCookieName("customRememberMeCookie")
				.useSecureCookie(false)
				.and()
//			.oauth2Login()
//				.userInfoEndpoint()
//				.userService()
//				.and()
			
			.sessionManagement()
			
			;
		
		return httpSecurity.build();
	}
	
	//패스워드 암호화 객체
	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
	
	private SecurityLogoutHandler getLogoutHandler() {
		return new SecurityLogoutHandler();
	}
	
	
	
	private SecurityFailHandler getFailHandler() {
		return new SecurityFailHandler();
	}
}
