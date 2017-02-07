package com.yanglong.curtain;

import com.yanglong.curtain.config.BuddhaBanner;
import com.yanglong.curtain.handler.AdminSecurityInterceptor;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.PropertySource;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

@SpringBootApplication
@ServletComponentScan//扫描自定义filter和servlet
@ComponentScan("com.yanglong.curtain")
@PropertySource("classpath:application.yml")
@EnableCaching//启用缓存
public class CurtainShowApplication extends WebMvcConfigurerAdapter {

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		super.addInterceptors(registry);
		registry.addInterceptor(new AdminSecurityInterceptor()).addPathPatterns("/manager/**");
	}

	public static void main(String[] args) {
		System.out.println("*********************正在启动*********************************");
		SpringApplication application = new SpringApplication(CurtainShowApplication.class);
		application.setBanner(new BuddhaBanner());
		application.run(args);
		System.out.println("*********************启动成功*********************************");
	}
}
