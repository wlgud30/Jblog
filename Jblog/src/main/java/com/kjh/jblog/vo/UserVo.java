package com.kjh.jblog.vo;

import java.util.Date;

import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.NotEmpty;

public class UserVo {
	
	private Long userNo;

	@NotEmpty
	@Length(min=4,max=20,message = "최소4글자부터 최대20글자 까지 입력 가능합니다.")
	@NotBlank
	private String id;
	@NotEmpty
	@Length(min=2,max=20,message = "최소2글자부터 최대20글자 까지 입력 가능합니다.")
	@NotBlank
	private String userName;
	@NotEmpty
	@Length(min=4,max=20,message = "최소4글자부터 최대20글자 까지 입력 가능합니다.")
	@NotBlank
	private String password;
	private Date joinDate;
	
	public Long getUserNo() {
		return userNo;
	}
	public void setUserNo(Long userNo) {
		this.userNo = userNo;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Date getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}
	@Override
	public String toString() {
		return "UserVo [userNo=" + userNo + ", id=" + id + ", userName=" + userName + ", password=" + password
				+ ", joinDate=" + joinDate + "]";
	}
	
	
	
}
