package com.ezen.antpeople.controller.main;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import com.ezen.antpeople.interception.AuthenticationInterceptor;


@Configuration
@EnableWebMvc //xml의 <annotation-driven>
@ComponentScan(basePackages="com.ezen.antpeople.controller.main") // xml의 context component-scan
public class ServletConfigurationMain extends WebMvcConfigurerAdapter{
    
    
	
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
    	registry.addResourceHandler("/setfiles/**").addResourceLocations("/WEB-INF/views/setfiles/");
    }
    
    @Bean
    public InternalResourceViewResolver internalResourceViewResolver() {
        InternalResourceViewResolver resolver = new InternalResourceViewResolver();
        resolver.setPrefix("/WEB-INF/views/main/");
        resolver.setSuffix(".jsp");
        return resolver;
    }
    
 
    
}
