package vo;

public class UserVo {

	int u_idx;
	String u_id;
	String u_pwd;
	String u_name;
	String u_nickname;
	String u_birth;
	String u_addr;
	int u_like;
	String u_profile;
	String u_photo;
	String u_tel;
	String u_mail;
	String u_grade;
	String u_ip;
	String postcode;
	String u_regdate;
	String u_status; // 활동상태
	int u_likecount; // 찜 수

	String u_time; // 회원가입 날짜 알기
	
	int u_month;
	int u_tot;

	// 임시컬럼
	int no;
	
	
	
	//insert용
	public UserVo(String u_id, String u_pwd, String u_name, String u_nickname, String u_birth, String u_addr,
			String postcode, String u_tel, String u_mail, String u_ip) {
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
	
	// 회원정보 수정용 이미지도 같이 수정
	public UserVo(int u_idx, String u_name, String u_birth, String u_addr, String u_profile, String u_photo,
			String u_tel, String postcode) {
		super();
		this.u_idx = u_idx;
		this.u_name = u_name;
		this.u_birth = u_birth;
		this.u_addr = u_addr;
		this.u_profile = u_profile;
		this.u_photo = u_photo;
		this.u_tel = u_tel;
		this.postcode = postcode;
	}
	
	// 회원정보 수정용 이미지 빼고 수정
	public UserVo(int u_idx, String u_name, String u_birth, String u_addr, String u_profile,
			String u_tel, String postcode) {
		super();
		this.u_idx = u_idx;
		this.u_name = u_name;
		this.u_birth = u_birth;
		this.u_addr = u_addr;
		this.u_profile = u_profile;
		this.u_tel = u_tel;
		this.postcode = postcode;
	}
	
	
	
	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getU_month() {
		return u_month;
	}

	public void setU_month(int u_month) {
		this.u_month = u_month;
	}

	public int getU_tot() {
		return u_tot;
	}

	public void setU_tot(int u_tot) {
		this.u_tot = u_tot;
	}

	public UserVo() {

	}

	public void setU_likecount(int u_likecount) {
		this.u_likecount = u_likecount;
	}

	public String getU_time() {
		return u_time;
	}

	public void setU_time(String u_time) {
		this.u_time = u_time;
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

	public String getPostcode() {
		return postcode;
	}

	public void setPostcode(String postcode) {
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

	public String getU_status() {
		return u_status;
	}

	public void setU_status(String u_status) {
		this.u_status = u_status;
	}

	public int getU_likecount() {
		return u_likecount;
	}

}
