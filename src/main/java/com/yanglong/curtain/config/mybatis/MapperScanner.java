package com.yanglong.curtain.config.mybatis;

import org.mybatis.spring.mapper.MapperScannerConfigurer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.lang.annotation.Annotation;

/**
 * package: com.yanglong.curtain.config.mybatis <br/>
 * functional describe:配置Mybatis的mapper接口自动注入
 * 这个类实例化的时间太早，无法使用配置文件注入配置属性
 *
 * @author DR.YangLong [410357434@163.com]
 * @version 1.0    2016/3/13 17:08
 */
@Configuration
public class MapperScanner {
    //mapper接口所在的包名
    private String basePackage="com.yanglong.curtain.mapper";
    //只有设置了此注解的接口才会被mybatis管理
    private Class<? extends Annotation> annotationClass=MyBatisRepository.class;

    @Bean
    public MapperScannerConfigurer mapperScannerConfigurer(){
        MapperScannerConfigurer scanner = new MapperScannerConfigurer();
        //配置mapper接口所在的包
        scanner.setBasePackage(basePackage);
        //配置默认的sqlSessionFactory，与MyBatisConfig中配置的别名一致
        scanner.setSqlSessionFactoryBeanName("sqlSessionFactory");
        //配置只扫描某个注解的接口
        scanner.setAnnotationClass(annotationClass);
        return scanner;
    }

    public String getBasePackage() {
        return basePackage;
    }

    public void setBasePackage(String basePackage) {
        this.basePackage = basePackage;
    }

    public Class<? extends Annotation> getAnnotationClass() {
        return annotationClass;
    }

    public void setAnnotationClass(Class<? extends Annotation> annotationClass) {
        this.annotationClass = annotationClass;
    }
}
