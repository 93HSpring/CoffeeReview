package com.hspring.coffeereview.view.user;

import com.github.scribejava.core.builder.api.DefaultApi20;

/**
* @packageName	: com.hspring.coffeereview.view.user
* @fileName		: NaverLoginApi.java
* @author		: Goonoo Jang
* @date			: 2020.08.24
* @description	: 네이버 아이디 로그인 API에 필요한 코드들이다
* ===========================================================
* DATE              AUTHOR             NOTE
* -----------------------------------------------------------
* 2020.08.24        Goonoo Jang       최초 생성
*/
public class NaverLoginApi extends DefaultApi20 {
	protected NaverLoginApi() {
	}

	private static class InstanceHolder {
		private static final NaverLoginApi INSTANCE = new NaverLoginApi();
	}

	/**
	 * @methodName	: instance
	 * @author		: Goonoo Jang
	 * @date		: 2020.08.24
	 * @return
	 */
	public static NaverLoginApi instance() {
		return InstanceHolder.INSTANCE;
	}

	@Override
	public String getAccessTokenEndpoint() {
		return "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code";
	}

	@Override
	protected String getAuthorizationBaseUrl() {
		return "https://nid.naver.com/oauth2.0/authorize";
	}

}
