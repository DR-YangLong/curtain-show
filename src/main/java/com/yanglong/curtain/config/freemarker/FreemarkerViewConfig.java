package com.yanglong.curtain.config.freemarker;

import freemarker.ext.beans.BeansWrapper;
import freemarker.ext.beans.BeansWrapperBuilder;
import freemarker.template.TemplateException;
import freemarker.template.TemplateHashModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Configuration;
import org.springframework.util.CollectionUtils;
import org.springframework.web.servlet.view.freemarker.FreeMarkerViewResolver;

import javax.annotation.PostConstruct;
import java.util.HashMap;
import java.util.Properties;
import java.util.Set;

/**
 * functional describe:自定义配置freemarker
 *
 * @author DR.YangLong [410357434@163.com]
 * @version 1.0    16-7-25
 */
@Configuration
@EnableConfigurationProperties
@ConfigurationProperties(prefix = "ftlviewcofing")
public class FreemarkerViewConfig {
    @Autowired
    private FreeMarkerViewResolver freeMarkerViewResolver;
    @Autowired
    private freemarker.template.Configuration configuration;
    /**
     * freemarker宏 静态方法导入配置
     */
    private HashMap<String,String> staticAttributes;
    private HashMap<String,String> attributes;
    private HashMap<String,String> autoImports;
    private boolean cache;
    private int cacheLimit=0;
    private String prefix="";
    private String suffix=".ftl";
    private String contentType="text/html;charset=UTF-8";
    private String requestContextAttribute="request";
    private boolean exposeSpringMacroHelpers=true;
    private boolean exposeRequestAttributes=true;
    private boolean exposeSessionAttributes=true;
    private int order=0;
    /**
     * 配置freemarker视图解析器
     * @return viewResolver
     */
    @PostConstruct
    public void configFreemarkerView() throws TemplateException{
        //configuration.setSharedVariable("shiro", new ShiroTags());
        configuration.setAutoImports(autoImports);
        freeMarkerViewResolver.setViewClass(org.springframework.web.servlet.view.freemarker.FreeMarkerView.class);
        FreemarkerStaticModels models=FreemarkerStaticModels.getInstance();
        models.setStaticModels(staticAttributes);
        freeMarkerViewResolver.setAttributesMap(models);
        if(!CollectionUtils.isEmpty(attributes)) {
            Properties properties = new Properties();
            properties.putAll(attributes);
            freeMarkerViewResolver.setAttributes(properties);
        }
        //是否启用缓存
        freeMarkerViewResolver.setCache(cache);
        //缓存刷新间隔
        freeMarkerViewResolver.setCacheLimit(cacheLimit);
        //模板前后缀
        freeMarkerViewResolver.setPrefix(prefix);
        freeMarkerViewResolver.setSuffix(suffix);
        //设置编码
        freeMarkerViewResolver.setContentType(contentType);
        freeMarkerViewResolver.setRequestContextAttribute(requestContextAttribute);
        freeMarkerViewResolver.setExposeSpringMacroHelpers(exposeSpringMacroHelpers);
        freeMarkerViewResolver.setExposeRequestAttributes(exposeRequestAttributes);
        freeMarkerViewResolver.setExposeSessionAttributes(exposeSessionAttributes);
        freeMarkerViewResolver.setOrder(order);
    }

    public HashMap<String, ?> getStaticAttributes() {
        return staticAttributes;
    }

    public void setStaticAttributes(HashMap<String, String> staticAttributes) {
        this.staticAttributes = staticAttributes;
    }

    public HashMap<String, String> getAttributes() {
        return attributes;
    }

    public void setAttributes(HashMap<String, String> attributes) {
        this.attributes = attributes;
    }

    public boolean isCache() {
        return cache;
    }

    public void setCache(boolean cache) {
        this.cache = cache;
    }

    public int getCacheLimit() {
        return cacheLimit;
    }

    public void setCacheLimit(int cacheLimit) {
        this.cacheLimit = cacheLimit;
    }

    public String getSuffix() {
        return suffix;
    }

    public void setSuffix(String suffix) {
        this.suffix = suffix;
    }

    public String getContentType() {
        return contentType;
    }

    public void setContentType(String contentType) {
        this.contentType = contentType;
    }

    public String getRequestContextAttribute() {
        return requestContextAttribute;
    }

    public void setRequestContextAttribute(String requestContextAttribute) {
        this.requestContextAttribute = requestContextAttribute;
    }

    public boolean isExposeSpringMacroHelpers() {
        return exposeSpringMacroHelpers;
    }

    public void setExposeSpringMacroHelpers(boolean exposeSpringMacroHelpers) {
        this.exposeSpringMacroHelpers = exposeSpringMacroHelpers;
    }

    public boolean isExposeRequestAttributes() {
        return exposeRequestAttributes;
    }

    public void setExposeRequestAttributes(boolean exposeRequestAttributes) {
        this.exposeRequestAttributes = exposeRequestAttributes;
    }

    public boolean isExposeSessionAttributes() {
        return exposeSessionAttributes;
    }

    public void setExposeSessionAttributes(boolean exposeSessionAttributes) {
        this.exposeSessionAttributes = exposeSessionAttributes;
    }

    public int getOrder() {
        return order;
    }

    public void setOrder(int order) {
        this.order = order;
    }

    public String getPrefix() {
        return prefix;
    }

    public void setPrefix(String prefix) {
        this.prefix = prefix;
    }

    public FreeMarkerViewResolver getFreeMarkerViewResolver() {
        return freeMarkerViewResolver;
    }

    public void setFreeMarkerViewResolver(FreeMarkerViewResolver freeMarkerViewResolver) {
        this.freeMarkerViewResolver = freeMarkerViewResolver;
    }

    public freemarker.template.Configuration getConfiguration() {
        return configuration;
    }

    public void setConfiguration(freemarker.template.Configuration configuration) {
        this.configuration = configuration;
    }

    public HashMap<String, String> getAutoImports() {
        return autoImports;
    }

    public void setAutoImports(HashMap<String, String> autoImports) {
        this.autoImports = autoImports;
    }

    public static class FreemarkerStaticModels extends HashMap<String, Object> {

        private static final long serialVersionUID = -1283328715025910827L;

        private static FreemarkerStaticModels FREEMARKER_STATIC_MODELS;

        private HashMap<String,String> staticModels;

        private FreemarkerStaticModels() {

        }

        public static FreemarkerStaticModels getInstance() {
            if (FREEMARKER_STATIC_MODELS == null) {
                FREEMARKER_STATIC_MODELS = new FreemarkerStaticModels();
            }
            return FREEMARKER_STATIC_MODELS;
        }

        public HashMap<String, String> getStaticModels() {
            return staticModels;
        }

        public void setStaticModels(HashMap<String,String> staticModels) throws TemplateException{
            if (this.staticModels == null && staticModels != null) {
                this.staticModels = staticModels;
                Set<String> keys = this.staticModels.keySet();
                BeansWrapperBuilder builder=new BeansWrapperBuilder(freemarker.template.Configuration.VERSION_2_3_25);
                builder.setUseModelCache(true);
                builder.setExposeFields(true);
                BeansWrapper wrapper = builder.build();
                TemplateHashModel hashModel = wrapper.getStaticModels();
                for (String key : keys) {
                    FREEMARKER_STATIC_MODELS.put(key, hashModel.get(this.staticModels.get(key)));
                }
            }
        }
    }
}
