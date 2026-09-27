package com.macro.mall.portal.config;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.http.converter.json.Jackson2ObjectMapperBuilder;


/**
 * Jackson Related configuration classes
 * json Do not return null fields
 * Created by macro on 2018/8/2.
 */
@Configuration
public class JacksonConfig {
    @Bean
    @Primary
    @ConditionalOnMissingBean(ObjectMapper.class)
    public ObjectMapper jacksonObjectMapper(Jackson2ObjectMapperBuilder builder) {
        ObjectMapper objectMapper = builder.createXmlMapper(false).build();

        // Use this method to configure the mapper object; all serialized objects will be serialized according to this rule
        // Include.Include.ALWAYS Default
        // Include.NON_DEFAULT Do not serialize when the attribute is the default value
        // Include.NON_EMPTY Attribute is empty ("") or NULL are not serialized, so the returned json does not have this field. This saves traffic for mobile clients
        // Include.NON_NULL Do not serialize when the attribute is NULL,Fields that are null do not take part in serialization
        objectMapper.setSerializationInclusion(JsonInclude.Include.NON_NULL);

        // Field retained, converting null values to""
//        objectMapper.getSerializerProvider().setNullValueSerializer(new JsonSerializer<Object>()
//        {
//            @Override
//            public void serialize(Object o, JsonGenerator jsonGenerator,
//                                  SerializerProvider serializerProvider)
//                    throws IOException, JsonProcessingException
//            {
//                jsonGenerator.writeString("");
//            }
//        });
        return objectMapper;
    }
}
