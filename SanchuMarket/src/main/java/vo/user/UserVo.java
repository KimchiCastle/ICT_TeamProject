package vo.user;

import java.util.Date;

public class UserVo {
	
  int u_idx;
  String u_id;
  String u_pwd;
  String u_name;
  String u_nickname;
  String u_birth;
  String u_addr;
  int u_like;//
  String u_profile;
  String u_photo;//
  String u_tel;
  String u_mail;
  String u_grade;
  String u_ip;
  int postcode;
  String u_regdate;
  
  public UserVo() {
		
	}
  
//insert¿ë
public UserVo(String u_id, String u_pwd, String u_name, String u_nickname, String u_birth, String u_addr, String u_tel,
		String u_mail, String u_ip, int postcode) {
	super();
	this.u_id = u_id;
	this.u_pwd = u_pwd;
	this.u_name = u_name;
	this.u_nickname = u_nickname;
	this.u_birth = u_birth;
	this.u_addr = u_addr;
	this.u_tel = u_tel;
	this.u_mail = u_mail;
	this.u_ip = u_ip;
	this.postcode = postcode;
}

public int getU_idx() {
	return u_idx;
}
public void setU_idx(int u_idx) {
	this.u_idx = u_idx;
}
public String getU_regdate() {
	return u_regdate;
}
public void setU_regdate(String u_regdate) {
	this.u_regdate = u_regdate;
}
public String getU_ip() {
	return u_ip;
}
public void setU_ip(String u_ip) {
	this.u_ip = u_ip;
}
public int getPostcode() {
	return postcode;
}
public void setPostcode(int postcode) {
	this.postcode = postcode;
}
public String getU_id() {
	return u_id;
}
public void setU_id(String u_id) {
	this.u_id = u_id;
}
public String getU_pwd() {
	return u_pwd;
}
public void setU_pwd(String u_pwd) {
	this.u_pwd = u_pwd;
}
public String getU_name() {
	return u_name;
}
public void setU_name(String u_name) {
	this.u_name = u_name;
}
public String getU_nickname() {
	return u_nickname;
}
public void setU_nickname(String u_nickname) {
	this.u_nickname = u_nickname;
}
public String getU_birth() {
	return u_birth;
}
public void setU_birth(String u_birth) {
	this.u_birth = u_birth;
}
public String getU_addr() {
	return u_addr;
}
public void setU_addr(String u_addr) {
	this.u_addr = u_addr;
}
public int getU_like() {
	return u_like;
}
public void setU_like(int u_like) {
	this.u_like = u_like;
}
public String getU_profile() {
	return u_profile;
}
public void setU_profile(String u_profile) {
	this.u_profile = u_profile;
}
public String getU_photo() {
	return u_photo;
}
public void setU_photo(String u_photo) {
	this.u_photo = u_photo;
}
public String getU_tel() {
	return u_tel;
}
public void setU_tel(String u_tel) {
	this.u_tel = u_tel;
}
public String getU_mail() {
	return u_mail;
}
public void setU_mail(String u_mail) {
	this.u_mail = u_mail;
}
public String getU_grade() {
	return u_grade;
}
public void setU_grade(String u_grade) {
	this.u_grade = u_grade;
}
  
  
  
}
