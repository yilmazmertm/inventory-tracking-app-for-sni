package com.yilmazmertm.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.password.NoOpPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import javax.sql.DataSource;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    DataSource dataSource;

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.jdbcAuthentication()
                .dataSource(dataSource)
                .usersByUsernameQuery("select email,password,active from user where email=?")
                .authoritiesByUsernameQuery("select email,user_role from user where email=?");
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.authorizeRequests()
                .antMatchers("/").hasAnyRole("ADMIN", "USER")
                .and()
                .formLogin()
                .loginPage("/login")
                .usernameParameter("changedUsername")
                .passwordParameter("changedPassword")
                .loginProcessingUrl("/perform_login")
                .defaultSuccessUrl("/", true)
                .failureHandler((req,res,exp)->{
                    String errMsg="";
                    if(exp.getClass().isAssignableFrom(BadCredentialsException.class)){
                        errMsg="Invalid username or password.";
                    }else{
                        errMsg="Unknown error - "+exp.getMessage();
                    }
                    req.getSession().setAttribute("message", errMsg);
                    res.sendRedirect("/login");
                })
                .and()
                .logout()
                .logoutRequestMatcher(new AntPathRequestMatcher("/perform_logout"))
                .deleteCookies("JSESSIONID")
                .logoutSuccessUrl("/login");
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return NoOpPasswordEncoder.getInstance();
    }
}
