package com.macro.mall.common.service;

import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * redis Actions Service
 * Created by macro on 2020/3/3.
 */
public interface RedisService {

    /**
     * Save attributes
     */
    void set(String key, Object value, long time);

    /**
     * Save attributes
     */
    void set(String key, Object value);

    /**
     * Get attributes
     */
    Object get(String key);

    /**
     * Delete attribute
     */
    Boolean del(String key);

    /**
     * Batch delete attributes
     */
    Long del(List<String> keys);

    /**
     * Set expiration time
     */
    Boolean expire(String key, long time);

    /**
     * Get expiration time
     */
    Long getExpire(String key);

    /**
     * Check whether the attribute exists
     */
    Boolean hasKey(String key);

    /**
     * Increment by delta
     */
    Long incr(String key, long delta);

    /**
     * Decrement by delta
     */
    Long decr(String key, long delta);

    /**
     * Get an attribute in a Hash structure
     */
    Object hGet(String key, String hashKey);

    /**
     * Put an attribute into a Hash structure
     */
    Boolean hSet(String key, String hashKey, Object value, long time);

    /**
     * Put an attribute into a Hash structure
     */
    void hSet(String key, String hashKey, Object value);

    /**
     * Get the entire Hash structure directly
     */
    Map<Object, Object> hGetAll(String key);

    /**
     * Set the entire Hash structure directly
     */
    Boolean hSetAll(String key, Map<String, Object> map, long time);

    /**
     * Set the entire Hash structure directly
     */
    void hSetAll(String key, Map<String, ?> map);

    /**
     * Delete an attribute from a Hash structure
     */
    void hDel(String key, Object... hashKey);

    /**
     * Check whether the Hash structure has the attribute
     */
    Boolean hHasKey(String key, String hashKey);

    /**
     * Hash Increment an attribute in the structure
     */
    Long hIncr(String key, String hashKey, Long delta);

    /**
     * Hash Decrement an attribute in the structure
     */
    Long hDecr(String key, String hashKey, Long delta);

    /**
     * Get a Set structure
     */
    Set<Object> sMembers(String key);

    /**
     * Add an attribute to a Set structure
     */
    Long sAdd(String key, Object... values);

    /**
     * Add an attribute to a Set structure
     */
    Long sAdd(String key, long time, Object... values);

    /**
     * Whether it is an attribute in the Set
     */
    Boolean sIsMember(String key, Object value);

    /**
     * Get the length of a Set structure
     */
    Long sSize(String key);

    /**
     * Delete an attribute from a Set structure
     */
    Long sRemove(String key, Object... values);

    /**
     * Get an attribute in a List structure
     */
    List<Object> lRange(String key, long start, long end);

    /**
     * Get the length of a List structure
     */
    Long lSize(String key);

    /**
     * Get an attribute in a List by index
     */
    Object lIndex(String key, long index);

    /**
     * Add an attribute to a List structure
     */
    Long lPush(String key, Object value);

    /**
     * Add an attribute to a List structure
     */
    Long lPush(String key, Object value, long time);

    /**
     * Add attributes to a List structure in batch
     */
    Long lPushAll(String key, Object... values);

    /**
     * Add attributes to a List structure in batch
     */
    Long lPushAll(String key, Long time, Object... values);

    /**
     * Remove an attribute from a List structure
     */
    Long lRemove(String key, long count, Object value);
}