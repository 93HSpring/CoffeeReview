package com.hspring.coffeereview.biz.user;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

// VO (Value Object)
/**
* @packageName	: com.hspring.coffeereview.biz.user
* @fileName		: UserVO.java
* @author		: Goonoo Jang
* @date			: 2020.08.24
* @description	: User의 데이터를 담는 클래스
* ===========================================================
* DATE              AUTHOR             NOTE
* -----------------------------------------------------------
* 2020.08.24        Goonoo Jang       최초 생성
*/
@Entity
@Table(name="USERS")
public class UserVO {
	
	/**
	 * apiResult json 구조 {"resultcode":"00", "message":"success",
	 * "response":{"id":"33666449","nickname":"shinn****","age":"20-29","gender":"M","email":"sh@naver.com","name":"\uc2e0\ubc94\ud638"}}
	 **/

	
	@Id
	@GeneratedValue
	private String id;
	private String name;
	private String nickname; // 
	private String age; //
	private String gender; 
	private String phonenum;
	private String email;
	private String address;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getPhonenum() {
		return phonenum;
	}
	public void setPhonenum(String phonenum) {
		this.phonenum = phonenum;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}

	@Override
	public String toString() {
		return "UserVO [id=" + id + ", name=" + name + ", nickname=" + nickname + ", age=" + age + ", gender=" + gender
				+ ", phonenum=" + phonenum + ", email=" + email + ", address=" + address + "]";
	}
	
}
