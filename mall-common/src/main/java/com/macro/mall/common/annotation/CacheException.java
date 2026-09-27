package com.macro.mall.common.annotation;

import java.lang.annotation.*;

/**
 * Custom annotation; cached methods carrying it will throw an exception
 */
@Documented
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
public @interface CacheException {
}
