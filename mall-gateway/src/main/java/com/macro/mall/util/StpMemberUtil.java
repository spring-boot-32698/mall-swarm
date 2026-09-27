/*
 * Copyright 2020-2099 sa-token.cc
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package com.macro.mall.util;

import cn.dev33.satoken.SaManager;
import cn.dev33.satoken.fun.SaFunction;
import cn.dev33.satoken.jwt.StpLogicJwtForSimple;
import cn.dev33.satoken.listener.SaTokenEventCenter;
import cn.dev33.satoken.session.SaSession;
import cn.dev33.satoken.session.SaTerminalInfo;
import cn.dev33.satoken.stp.SaLoginModel;
import cn.dev33.satoken.stp.SaTokenInfo;
import cn.dev33.satoken.stp.StpLogic;

import java.util.List;

/**
 * @auther macrozheng
 * @description Storefront mall user login authentication utility class
 * Copied from the default StpUtil, only changed TYPE
 * @date 2024/1/26
 * @github https://github.com/macrozheng
 */
public class StpMemberUtil {

	private StpMemberUtil() {}
	
	/**
	 * Type identifier under a multi-account system
	 */
	public static final String TYPE = "memberLogin";
	
	/**
	 * The underlying StpLogic object in use
	 */
	public static StpLogic stpLogic = new StpLogicJwtForSimple(TYPE);

	/**
	 * Get the account type of the current StpLogic
	 *
	 * @return /
	 */
	public static String getLoginType(){
		return stpLogic.getLoginType();
	}

	/**
	 * Safely reset the StpLogic object
	 *
	 * <br> 1, change the StpLogic object of this account 
	 * <br> 2, put into the global StpLogic collection 
	 * <br> 3, send logs 
	 * 
	 * @param newStpLogic / 
	 */
	public static void setStpLogic(StpLogic newStpLogic) {
		// 1, reset the StpLogic object of this account
		stpLogic = newStpLogic;
		
		// 2, add to the global StpLogic collection
		//    So that it can be accessed via SaManager.getStpLogic(type) way to obtain this globally StpLogic
		SaManager.putStpLogic(newStpLogic);
		
		// 3, $$ Publish event: stpLogic object updated
		SaTokenEventCenter.doSetStpLogic(stpLogic);
	}

	/**
	 * Get StpLogic object
	 *
	 * @return / 
	 */
	public static StpLogic getStpLogic() {
		return stpLogic;
	}
	
	
	// ------------------- Get token related -------------------

	/**
	 * Return the token name; this name appears in: the cookie name when saving the token, the parameter name when submitting the token, and the key prefix when storing the token
	 *
	 * @return /
	 */
	public static String getTokenName() {
 		return stpLogic.getTokenName();
 	}

	/**
	 * Write the specified token value to the current session
	 *
	 * @param tokenValue token Value
	 */
	public static void setTokenValue(String tokenValue){
		stpLogic.setTokenValue(tokenValue);
	}

	/**
	 * Write the specified token value to the current session
	 *
	 * @param tokenValue token Value
	 * @param cookieTimeout Cookie Time to live(seconds)
	 */
	public static void setTokenValue(String tokenValue, int cookieTimeout){
		stpLogic.setTokenValue(tokenValue, cookieTimeout);
	}

	/**
	 * Write the specified token value to the current session
	 *
	 * @param tokenValue token Value
	 * @param loginModel Login parameters
	 */
	public static void setTokenValue(String tokenValue, SaLoginModel loginModel){
		stpLogic.setTokenValue(tokenValue, loginModel);
	}

	/**
	 * Get the token value of the current request
	 *
	 * @return Current tokenValue
	 */
	public static String getTokenValue() {
		return stpLogic.getTokenValue();
	}

	/**
	 * Get the token value of the current request (without trimming the prefix)
	 *
	 * @return / 
	 */
	public static String getTokenValueNotCut(){
		return stpLogic.getTokenValueNotCut();
	}

	/**
	 * Get the token parameter info of the current session
	 *
	 * @return token Parameter information
	 */
	public static SaTokenInfo getTokenInfo() {
		return stpLogic.getTokenInfo();
	}

	
	// ------------------- Login related operations -------------------

	// --- Login 

	/**
	 * Session login
	 *
	 * @param id Account id, suggested type: (long | int | String)
	 */
	public static void login(Object id) {
		stpLogic.login(id);
	}

	/**
	 * Session login, specifying the login device type
	 *
	 * @param id Account id, suggested type: (long | int | String)
	 * @param device Device type
	 */
	public static void login(Object id, String device) {
		stpLogic.login(id, device);
	}

	/**
	 * Session login, specifying whether [Remember me]
	 *
	 * @param id Account id, suggested type: (long | int | String)
	 * @param isLastingCookie Whether it is a persistent cookie; true means remember me, false means re-login is required after closing the browser
	 */
	public static void login(Object id, boolean isLastingCookie) {
		stpLogic.login(id, isLastingCookie);
	}

	/**
	 * Session login, specifying the validity period of this login token, Unit: seconds
	 *
	 * @param id      Account id, suggested type: (long | int | String)
	 * @param timeout Validity period of this login token, Unit: seconds
	 */
	public static void login(Object id, long timeout) {
		stpLogic.login(id, timeout);
	}

	/**
	 * Session login, specifying all login parameters Model
	 *
	 * @param id Account id, suggested type: (long | int | String)
	 * @param loginModel Parameters of this login Model
	 */
	public static void login(Object id, SaLoginModel loginModel) {
		stpLogic.login(id, loginModel);
	}

	/**
	 * Create login session data for the specified account id
	 *
	 * @param id Account id, suggested type: (long | int | String)
	 * @return Return session token
	 */
	public static String createLoginSession(Object id) {
		return stpLogic.createLoginSession(id);
	}

	/**
	 * Create login session data for the specified account id
	 *
	 * @param id Account id, suggested type: (long | int | String)
	 * @param loginModel Parameters of this login Model 
	 * @return Return session token
	 */
	public static String createLoginSession(Object id, SaLoginModel loginModel) {
		return stpLogic.createLoginSession(id, loginModel);
	}
	
	// --- Logout 

	/**
	 * Log out of the current client session
	 */
	public static void logout() {
		stpLogic.logout();
	}

	/**
	 * Session logout, by account id 
	 *
	 * @param loginId Account id
	 */
	public static void logout(Object loginId) {
		stpLogic.logout(loginId);
	}

	/**
	 * Session logout, by account id and device type
	 *
	 * @param loginId Account id 
	 * @param device Device type (Pass null to log out all device types of the account)
	 */
	public static void logout(Object loginId, String device) {
		stpLogic.logout(loginId, device);
	}

	/**
	 * Session logout, by specified Token 
	 *
	 * @param tokenValue Specified token
	 */
	public static void logoutByTokenValue(String tokenValue) {
		stpLogic.logoutByTokenValue(tokenValue);
	}

	/**
	 * Kick offline, by account id 
	 * <p> When the user visits the system again, a NotLoginException is thrown, scene value=-5 </p>
	 *
	 * @param loginId Account id 
	 */
	public static void kickout(Object loginId) {
		stpLogic.kickout(loginId);
	}

	/**
	 * Kick offline, by account id and device type
	 * <p> When the user visits the system again, a NotLoginException is thrown, scene value=-5 </p>
	 *
	 * @param loginId Account id
	 * @param device Device type (Pass null to kick out all device types of the account)
	 */
	public static void kickout(Object loginId, String device) {
		stpLogic.kickout(loginId, device);
	}

	/**
	 * Kick offline, by specified token
	 * <p> When the user visits the system again, a NotLoginException is thrown, scene value=-5 </p>
	 *
	 * @param tokenValue Specified token
	 */
	public static void kickoutByTokenValue(String tokenValue) {
		stpLogic.kickoutByTokenValue(tokenValue);
	}

	/**
	 * Kick offline, by account id and device type
	 * <p> When the user visits the system again, a NotLoginException is thrown, scene value=-4 </p>
	 *
	 * @param loginId Account id
	 * @param device Device type (pass null to replace all device types of the account)
	 */
	public static void replaced(Object loginId, String device) {
		stpLogic.replaced(loginId, device);
	}

	// Session query

	/**
	 * Check whether the current session is logged in
	 *
	 * @return Returns true if logged in, returns false
	 */
	public static boolean isLogin() {
		return stpLogic.isLogin();
	}

	/**
	 * Check whether the specified account is logged in
	 *
	 * @return Returns true if logged in, returns false
	 */
	public static boolean isLogin(Object loginId) {
		return stpLogic.isLogin(loginId);
	}

	/**
	 * Check whether the current session is logged in; throw an exception if not
	 */
 	public static void checkLogin() {
 		stpLogic.checkLogin();
 	}

	/**
	 * Get the current session account id; throw an exception if not logged in
	 *
	 * @return Account id
	 */
	public static Object getLoginId() {
		return stpLogic.getLoginId();
	}

	/**
	 * Get current session account id, If not logged in, return the default value
	 *
	 * @param <T> Return type 
	 * @param defaultValue Default value
	 * @return Login id
	 */
	public static <T> T getLoginId(T defaultValue) {
		return stpLogic.getLoginId(defaultValue);
	}

	/**
	 * Get current session account id, If not logged in, return null
	 *
	 * @return Account id
	 */
	public static Object getLoginIdDefaultNull() {
		return stpLogic.getLoginIdDefaultNull();
 	}

	/**
	 * Get current session account id, and convert to String type
	 *
	 * @return Account id
	 */
	public static String getLoginIdAsString() {
		return stpLogic.getLoginIdAsString();
	}

	/**
	 * Get current session account id, and convert to int type
	 *
	 * @return Account id
	 */
	public static int getLoginIdAsInt() {
		return stpLogic.getLoginIdAsInt();
	}

	/**
	 * Get current session account id, and convert to long type
	 *
	 * @return Account id
	 */
	public static long getLoginIdAsLong() {
		return stpLogic.getLoginIdAsLong();
	}

	/**
	 * Get the account id for the specified token; if not logged in, return null
	 *
	 * @param tokenValue token
	 * @return Account id
	 */
 	public static Object getLoginIdByToken(String tokenValue) {
 		return stpLogic.getLoginIdByToken(tokenValue);
 	}

	/**
	 * Get the extended info of the current Token (only effective in jwt mode)
	 *
	 * @param key Key-value 
	 * @return Corresponding extended data
	 */
	public static Object getExtra(String key) {
		return stpLogic.getExtra(key);
	}

	/**
	 * Get the extended info of the specified Token (only effective in jwt mode)
	 *
	 * @param tokenValue Specified Token value
	 * @param key Key-value
	 * @return Corresponding extended data
	 */
	public static Object getExtra(String tokenValue, String key) {
		return stpLogic.getExtra(tokenValue, key);
	}
 	
 	
	// ------------------- Account-Session Related -------------------

	/**
	 * Get the specified account id’s Account-Session, If this SaSession has not been created yet,isCreate=Whether to create new and return
	 *
	 * @param loginId Account id
	 * @param isCreate Whether to create new
	 * @return SaSession Object
	 */
	public static SaSession getSessionByLoginId(Object loginId, boolean isCreate) {
		return stpLogic.getSessionByLoginId(loginId, isCreate);
	}

	/**
	 * Get the specified key’s SaSession, If this SaSession has not been created yet, return null
	 *
	 * @param sessionId SessionId
	 * @return Session Object
	 */
	public static SaSession getSessionBySessionId(String sessionId) {
		return stpLogic.getSessionBySessionId(sessionId);
	}

	/**
	 * Get the Account-Session of the specified account id; if the SaSession has not been created yet, create and return a new one
	 *
	 * @param loginId Account id
	 * @return SaSession Object
	 */
	public static SaSession getSessionByLoginId(Object loginId) {
		return stpLogic.getSessionByLoginId(loginId);
	}

	/**
	 * Get the current logged-in account’s Account-Session, If this SaSession has not been created yet,isCreate=Whether to create new and return
	 *
	 * @param isCreate Whether to create new 
	 * @return Session Object
	 */
	public static SaSession getSession(boolean isCreate) {
		return stpLogic.getSession(isCreate);
	}

	/**
	 * Get the Account-Session of the current logged-in account; if the SaSession has not been created yet, create and return a new one
	 *
	 * @return Session Object
	 */
	public static SaSession getSession() {
		return stpLogic.getSession();
	}

	
	// ------------------- Token-Session Related -------------------  

	/**
	 * Get the Token-Session of the specified token; if the SaSession has not been created yet, create and return a new one
	 *
	 * @param tokenValue Token Value
	 * @return Session Object
	 */
	public static SaSession getTokenSessionByToken(String tokenValue) {
		return stpLogic.getTokenSessionByToken(tokenValue);
	}

	/**
	 * Get the Token-Session of the current token; if the SaSession has not been created yet, create and return a new one
	 *
	 * @return Session Object
	 */
	public static SaSession getTokenSession() {
		return stpLogic.getTokenSession();
	}

	/**
	 * Get the current anonymous Token-Session (a Token-Session usable when not logged in)
	 *
	 * @return Token-Session Object
	 */
	public static SaSession getAnonTokenSession() {
		return stpLogic.getAnonTokenSession();
	}
	

	// ------------------- Active-Timeout token Minimum activity level verification related -------------------

	/**
	 * Renew the current token:(Set [Last operation time] Update to current timestamp)
	 * <h2>
	 * 		Note: renewal succeeds even if the token has been frozen,
	 * 		If a renewal failure needs to be reported in this scenario, call this before it checkActiveTimeout() Just force-check whether it is frozen
	 * </h2>
	 */
	public static void updateLastActiveToNow() {
		stpLogic.updateLastActiveToNow();
	}

	/**
	 * Check whether the current token has been frozen; throw an exception if so
	 */
 	public static void checkActiveTimeout() {
 		stpLogic.checkActiveTimeout();
 	}


	// ------------------- Expiration related -------------------  

	/**
	 * Get the remaining validity of the current session token (unit: seconds; -1 means permanently valid, -2 means no such value)
	 *
	 * @return token Remaining valid time
	 */
 	public static long getTokenTimeout() {
 		return stpLogic.getTokenTimeout();
 	}

	/**
	 * Get the remaining validity of the specified token (unit: seconds; -1 means permanently valid, -2 means no such value)
	 *
	 * @param token Specified token
	 * @return token Remaining valid time
	 */
	public static long getTokenTimeout(String token) {
		return stpLogic.getTokenTimeout(token);
	}

	/**
	 * Get the remaining validity of the current logged-in account’s Account-Session (unit: seconds; -1 means permanently valid, -2 means no such value)
	 *
	 * @return token Remaining valid time
	 */
 	public static long getSessionTimeout() {
 		return stpLogic.getSessionTimeout();
 	}

	/**
	 * Get the remaining validity of the current token’s Token-Session (unit: seconds; -1 means permanently valid, -2 means no such value)
	 *
	 * @return token Remaining valid time
	 */
 	public static long getTokenSessionTimeout() {
 		return stpLogic.getTokenSessionTimeout();
 	}

	/**
	 * Get the remaining active validity of the current token: how much time until the current token is frozen (unit: seconds; -1 means never frozen, -2 means no such value or the token has already been frozen)
	 *
	 * @return /
	 */
 	public static long getTokenActiveTimeout() {
 		return stpLogic.getTokenActiveTimeout();
 	}

	/**
	 * Renew the timeout value of the current token
	 *
	 * @param timeout Validity time to change to (Unit: seconds)
	 */
 	public static void renewTimeout(long timeout) {
 		stpLogic.renewTimeout(timeout);
 	}

	/**
	 * Renew the timeout value of the specified token
	 *
	 * @param tokenValue Specified token
	 * @param timeout Validity time to change to (Unit: seconds; pass -1 to renew to permanent validity)
	 */
 	public static void renewTimeout(String tokenValue, long timeout) {
 		stpLogic.renewTimeout(tokenValue, timeout);
 	}
 	
 	
	// ------------------- Role authentication operations -------------------

	/**
	 * Get: role collection of the current account
	 *
	 * @return /
	 */
	public static List<String> getRoleList() {
		return stpLogic.getRoleList();
	}

	/**
	 * Get: role collection of the specified account
	 *
	 * @param loginId Specified account id 
	 * @return /
	 */
	public static List<String> getRoleList(Object loginId) {
		return stpLogic.getRoleList(loginId);
	}

	/**
	 * Check: whether the current account has the specified role, Returns true or false
	 *
	 * @param role Role
	 * @return /
	 */
 	public static boolean hasRole(String role) {
 		return stpLogic.hasRole(role);
 	}

	/**
	 * Check: whether the specified account has the specified role identifier, Returns true or false
	 *
	 * @param loginId Account id
	 * @param role Role identifier
	 * @return Whether it has the specified role identifier
	 */
 	public static boolean hasRole(Object loginId, String role) {
 		return stpLogic.hasRole(loginId, role);
 	}

	/**
	 * Check: whether the current account has the specified role identifier [ If multiple are specified, all must pass verification ]
	 *
	 * @param roleArray Role identifier array
	 * @return true or false
	 */
 	public static boolean hasRoleAnd(String... roleArray){
 		return stpLogic.hasRoleAnd(roleArray);
 	}

	/**
	 * Check: whether the current account has the specified role identifier [ If multiple are specified, passing any one is enough ]
	 *
	 * @param roleArray Role identifier array
	 * @return true or false
	 */
 	public static boolean hasRoleOr(String... roleArray){
 		return stpLogic.hasRoleOr(roleArray);
 	}

	/**
	 * Verify: whether the current account has the specified role identifier, If verification fails, an exception is thrown: NotRoleException
	 *
	 * @param role Role identifier
	 */
 	public static void checkRole(String role) {
 		stpLogic.checkRole(role);
 	}

	/**
	 * Verify: whether the current account has the specified role identifier [ If multiple are specified, all must pass verification ]
	 *
	 * @param roleArray Role identifier array
	 */
 	public static void checkRoleAnd(String... roleArray){
 		stpLogic.checkRoleAnd(roleArray);
 	}

	/**
	 * Verify: whether the current account has the specified role identifier [ If multiple are specified, passing any one is enough ]
	 *
	 * @param roleArray Role identifier array
	 */
 	public static void checkRoleOr(String... roleArray){
 		stpLogic.checkRoleOr(roleArray);
 	}

	
	// ------------------- Permission authentication operations -------------------

	/**
	 * Get: permission code collection of the current account
	 *
	 * @return / 
	 */
	public static List<String> getPermissionList() {
		return stpLogic.getPermissionList();
	}

	/**
	 * Get: permission code collection of the specified account
	 *
	 * @param loginId Specified account id
	 * @return / 
	 */
	public static List<String> getPermissionList(Object loginId) {
		return stpLogic.getPermissionList(loginId);
	}

	/**
	 * Check: whether the current account has the specified permission, Returns true or false
	 *
	 * @param permission Permission code
	 * @return Whether it has the specified permission
	 */
	public static boolean hasPermission(String permission) {
		return stpLogic.hasPermission(permission);
	}

	/**
	 * Check: whether the specified account id has the specified permission, Returns true or false
	 *
	 * @param loginId Account id
	 * @param permission Permission code
	 * @return Whether it has the specified permission
	 */
	public static boolean hasPermission(Object loginId, String permission) {
		return stpLogic.hasPermission(loginId, permission);
	}

	/**
	 * Check: whether the current account has the specified permission [ If multiple are specified, all must have ]
	 *
	 * @param permissionArray Permission code array
	 * @return true or false
	 */
 	public static boolean hasPermissionAnd(String... permissionArray){
 		return stpLogic.hasPermissionAnd(permissionArray);
 	}

	/**
	 * Check: whether the current account has the specified permission [ If multiple are specified, passing any one is enough ]
	 *
	 * @param permissionArray Permission code array
	 * @return true or false
	 */
 	public static boolean hasPermissionOr(String... permissionArray){
 		return stpLogic.hasPermissionOr(permissionArray);
 	}

	/**
	 * Verify: whether the current account has the specified permission, If verification fails, an exception is thrown: NotPermissionException
	 *
	 * @param permission Permission code
	 */
	public static void checkPermission(String permission) {
		stpLogic.checkPermission(permission);
	}

	/**
	 * Verify: whether the current account has the specified permission [ If multiple are specified, all must pass verification ]
	 *
	 * @param permissionArray Permission code array
	 */
	public static void checkPermissionAnd(String... permissionArray) {
		stpLogic.checkPermissionAnd(permissionArray);
	}

	/**
	 * Verify: whether the current account has the specified permission [ If multiple are specified, passing any one is enough ]
	 *
	 * @param permissionArray Permission code array
	 */
	public static void checkPermissionOr(String... permissionArray) {
		stpLogic.checkPermissionOr(permissionArray);
	}


	// ------------------- id Reverse lookup token related operations -------------------

	/**
	 * Get the specified account id’s token
	 * <p>
	 * 		When concurrent login is allowed, this method only returns the last token in the queue,
	 * 		If you need to return all tokens of this account id, please call getTokenValueListByLoginId
	 * </p>
	 *
	 * @param loginId Account id
	 * @return token Value
	 */
	public static String getTokenValueByLoginId(Object loginId) {
		return stpLogic.getTokenValueByLoginId(loginId);
	}

	/**
	 * Get the specified account id’s tokens on the specified device type token
	 * <p>
	 * 		When concurrent login is allowed, this method only returns the last token in the queue,
	 * 		If you need to return all tokens of this account id, please call getTokenValueListByLoginId
	 * </p>
	 *
	 * @param loginId Account id
	 * @param device Device type, pass null for any device type
	 * @return token Value
	 */
	public static String getTokenValueByLoginId(Object loginId, String device) {
		return stpLogic.getTokenValueByLoginId(loginId, device);
	}

	/**
	 * Get the token collection of the specified account id
	 *
	 * @param loginId Account id
	 * @return All related to this loginId token
	 */
	public static List<String> getTokenValueListByLoginId(Object loginId) {
		return stpLogic.getTokenValueListByLoginId(loginId);
	}

	/**
	 * Get the token collection of the specified account id on the specified device type
	 *
	 * @param loginId Account id
	 * @param device Device type, pass null for any device type
	 * @return All logins of this loginId token
	 */
	public static List<String> getTokenValueListByLoginId(Object loginId, String device) {
		return stpLogic.getTokenValueListByLoginId(loginId, device);
	}

	/**
	 * Get the tokenSign collection of the specified account id on the specified device type
	 *
	 * @param loginId Account id
	 * @param device Device type, pass null for any device type
	 * @return All logins of this loginId tokenSign
	 */
	public static List<SaTerminalInfo> getTerminalListByLoginId(Object loginId, String device) {
		return stpLogic.getTerminalListByLoginId(loginId, device);
	}

	/**
	 * Return the login device type of the current session
	 *
	 * @return Login device type of the current token
	 */
	public static String getLoginDevice() {
		return stpLogic.getLoginDevice(); 
	}

	
	// ------------------- Session management -------------------  

	/**
	 * Query all matching entries in the cache by condition token
	 *
	 * @param keyword Keyword
	 * @param start Start index
	 * @param size Get count (-1 Means fetching until the end)
	 * @param sortType Sort type (true=ascending,false=descending)
	 *
	 * @return token Collection
	 */
	public static List<String> searchTokenValue(String keyword, int start, int size, boolean sortType) {
		return stpLogic.searchTokenValue(keyword, start, size, sortType);
	}

	/**
	 * Query all matching entries in the cache by condition SessionId
	 *
	 * @param keyword Keyword
	 * @param start Start index
	 * @param size Get count  (-1 Means fetching until the end)
	 * @param sortType Sort type (true=ascending,false=descending)
	 *
	 * @return sessionId Collection
	 */
	public static List<String> searchSessionId(String keyword, int start, int size, boolean sortType) {
		return stpLogic.searchSessionId(keyword, start, size, sortType);
	}

	/**
	 * Query all matching entries in the cache by condition Token-Session-Id
	 *
	 * @param keyword Keyword
	 * @param start Start index
	 * @param size Get count (-1 Means fetching until the end)
	 * @param sortType Sort type (true=ascending,false=descending)
	 *
	 * @return sessionId Collection
	 */
	public static List<String> searchTokenSessionId(String keyword, int start, int size, boolean sortType) {
		return stpLogic.searchTokenSessionId(keyword, start, size, sortType);
	}

	
	// ------------------- Account ban -------------------  

	/**
	 * Ban: specified account
	 * <p> This method does not directly kick this account id offline; if you need immediate logout after banning, please also call StpUtil.logout(id)
	 *
	 * @param loginId Specified account id 
	 * @param time Ban time, Unit: seconds (-1=permanent ban)
	 */
	public static void disable(Object loginId, long time) {
		stpLogic.disable(loginId, time);
	}

	/**
	 * Check: whether the specified account has been banned (true=Has been banned, false=Not banned) 
	 *
	 * @param loginId Account id
	 * @return / 
	 */
	public static boolean isDisable(Object loginId) {
		return stpLogic.isDisable(loginId);
	}

	/**
	 * Verify: whether the specified account is banned; throw an exception if banned
	 *
	 * @param loginId Account id
	 */
	public static void checkDisable(Object loginId) {
		stpLogic.checkDisable(loginId);
	}

	/**
	 * Get: remaining ban time of the specified account, in seconds (-1=Permanent ban,-2=Not banned)
	 *
	 * @param loginId Account id
	 * @return / 
	 */
	public static long getDisableTime(Object loginId) {
		return stpLogic.getDisableTime(loginId);
	}

	/**
	 * Unban: specified account
	 *
	 * @param loginId Account id
	 */
	public static void untieDisable(Object loginId) {
		stpLogic.untieDisable(loginId);
	}

	
	// ------------------- Category ban -------------------  

	/**
	 * Ban: specified service of the specified account 
	 * <p> This method does not directly kick this account id offline; if you need immediate logout after banning, please also call StpUtil.logout(id)
	 *
	 * @param loginId Specified account id
	 * @param service Specify service 
	 * @param time Ban time, Unit: seconds (-1=permanent ban)
	 */
	public static void disable(Object loginId, String service, long time) {
		stpLogic.disable(loginId, service, time);
	}

	/**
	 * Check: whether the specified service of the specified account has been banned (true=Has been banned, false=Not banned)
	 *
	 * @param loginId Account id
	 * @param service Specify service 
	 * @return / 
	 */
	public static boolean isDisable(Object loginId, String service) {
		return stpLogic.isDisable(loginId, service);
	}

	/**
	 * Verify: whether the specified service of the specified account is banned; throw an exception if banned
	 *
	 * @param loginId Account id
	 * @param services Specify services, multiple allowed 
	 */
	public static void checkDisable(Object loginId, String... services) {
		stpLogic.checkDisable(loginId, services);
	}

	/**
	 * Get: remaining ban time of the specified service of the specified account, in seconds (-1=Permanent ban,-2=Not banned)
	 *
	 * @param loginId Account id
	 * @param service Specify service 
	 * @return see note 
	 */
	public static long getDisableTime(Object loginId, String service) {
		return stpLogic.getDisableTime(loginId, service);
	}

	/**
	 * Unban: specified account, specified service
	 *
	 * @param loginId Account id
	 * @param services Specify services, multiple allowed 
	 */
	public static void untieDisable(Object loginId, String... services) {
		stpLogic.untieDisable(loginId, services);
	}


	// ------------------- Tiered ban -------------------  

	/**
	 * Ban: specified account, with the specified ban level
	 *
	 * @param loginId Specified account id 
	 * @param level Specified ban level 
	 * @param time Ban time, Unit: seconds (-1=permanent ban)
	 */
	public static void disableLevel(Object loginId, int level, long time) {
		stpLogic.disableLevel(loginId, level, time);
	}

	/**
	 * Ban: specified service of the specified account, with the specified ban level
	 *
	 * @param loginId Specified account id 
	 * @param service Specified ban service 
	 * @param level Specified ban level 
	 * @param time Ban time, Unit: seconds (-1=permanent ban)
	 */
	public static void disableLevel(Object loginId, String service, int level, long time) {
		stpLogic.disableLevel(loginId, service, level, time);
	}

	/**
	 * Check: whether the specified account has been banned to the specified level
	 *
	 * @param loginId Specified account id 
	 * @param level Specified ban level 
	 * @return / 
	 */
	public static boolean isDisableLevel(Object loginId, int level) {
		return stpLogic.isDisableLevel(loginId, level);
	}

	/**
	 * Check: whether the specified service of the specified account has been banned to the specified level 
	 *
	 * @param loginId Specified account id 
	 * @param service Specified ban service 
	 * @param level Specified ban level 
	 * @return / 
	 */
	public static boolean isDisableLevel(Object loginId, String service, int level) {
		return stpLogic.isDisableLevel(loginId, service, level);
	}

	/**
	 * Verify: whether the specified account has been banned to the specified level (throw an exception if reached)
	 *
	 * @param loginId Specified account id 
	 * @param level Ban level (only when ban level ≥ only then is the exception thrown)
	 */
	public static void checkDisableLevel(Object loginId, int level) {
		stpLogic.checkDisableLevel(loginId, level);
	}

	/**
	 * Verify: whether the specified service of the specified account has been banned to the specified level (throw an exception if reached)
	 *
	 * @param loginId Specified account id 
	 * @param service Specified ban service 
	 * @param level Ban level (only when ban level ≥ only then is the exception thrown)
	 */
	public static void checkDisableLevel(Object loginId, String service, int level) {
		stpLogic.checkDisableLevel(loginId, service, level);
	}

	/**
	 * Get: ban level of the specified account; if not banned, return-2 
	 *
	 * @param loginId Specified account id 
	 * @return / 
	 */
	public static int getDisableLevel(Object loginId) {
		return stpLogic.getDisableLevel(loginId);
	}

	/**
	 * Get: ban level of the specified service of the specified account; if not banned, return-2 
	 *
	 * @param loginId Specified account id 
	 * @param service Specified ban service 
	 * @return / 
	 */
	public static int getDisableLevel(Object loginId, String service) {
		return stpLogic.getDisableLevel(loginId, service);
	}
	
	
	// ------------------- Temporary identity switch -------------------

	/**
	 * Temporarily switch identity to the specified account id
	 *
	 * @param loginId Specified loginId 
	 */
	public static void switchTo(Object loginId) {
		stpLogic.switchTo(loginId);
	}

	/**
	 * End temporary identity switch
	 */
	public static void endSwitch() {
		stpLogic.endSwitch();
	}

	/**
	 * Check whether the current request is in [ Temporary identity switch ] in
	 *
	 * @return /
	 */
	public static boolean isSwitch() {
		return stpLogic.isSwitch();
	}

	/**
	 * Within a lambda block, temporarily switch identity to the specified account id; automatically restored when the lambda ends
	 *
	 * @param loginId Specified account id 
	 * @param function Method to execute 
	 */
	public static void switchTo(Object loginId, SaFunction function) {
		stpLogic.switchTo(loginId, function);
	}
	

	// ------------------- Secondary authentication -------------------  

	/**
	 * Enable secondary authentication for the current session
	 *
	 * @param safeTime Duration (Unit: seconds) 
	 */
	public static void openSafe(long safeTime) {
		stpLogic.openSafe(safeTime);
	}

	/**
	 * Enable secondary authentication for the current session
	 *
	 * @param service Business identifier  
	 * @param safeTime Duration (Unit: seconds) 
	 */
	public static void openSafe(String service, long safeTime) {
		stpLogic.openSafe(service, safeTime);
	}

	/**
	 * Check: whether the current session is within the secondary authentication period
	 *
	 * @return true=Secondary authentication passed, false=Secondary authentication not yet performed or has timed out 
	 */
	public static boolean isSafe() {
		return stpLogic.isSafe();
	}

	/**
	 * Check: whether the current session is within the secondary authentication period of the specified service
	 *
	 * @param service Business identifier  
	 * @return true=Secondary authentication passed, false=Secondary authentication not yet performed or has timed out 
	 */
	public static boolean isSafe(String service) {
		return stpLogic.isSafe(service);
	}

	/**
	 * Check: whether the specified token is within the secondary authentication period
	 *
	 * @param tokenValue Token Value  
	 * @param service Business identifier  
	 * @return true=Secondary authentication passed, false=Secondary authentication not yet performed or has timed out 
	 */
	public static boolean isSafe(String tokenValue, String service) {
		return stpLogic.isSafe(tokenValue, service);
	}

	/**
	 * Verify: whether the current session has passed secondary authentication; throw an exception if not
	 */
	public static void checkSafe() {
		stpLogic.checkSafe();
	}

	/**
	 * Verify: whether the current session has passed secondary authentication for the specified service; throw an exception if not
	 *
	 * @param service Business identifier  
	 */
	public static void checkSafe(String service) {
		stpLogic.checkSafe(service);
	}

	/**
	 * Get: remaining validity time of the current session’s secondary authentication (unit: seconds, Returns -2 if secondary authentication has not been passed)
	 *
	 * @return Remaining valid time
	 */
	public static long getSafeTime() {
		return stpLogic.getSafeTime();
	}

	/**
	 * Get: remaining validity time of the current session’s secondary authentication (unit: seconds, Returns -2 if secondary authentication has not been passed)
	 *
	 * @param service Business identifier  
	 * @return Remaining valid time
	 */
	public static long getSafeTime(String service) {
		return stpLogic.getSafeTime(service);
	}

	/**
	 * End secondary authentication for the current session 
	 */
	public static void closeSafe() {
		stpLogic.closeSafe();
	}

	/**
	 * End secondary authentication for the specified service identifier in the current session
	 *
	 * @param service Business identifier  
	 */
	public static void closeSafe(String service) {
		stpLogic.closeSafe(service);
	}

}
