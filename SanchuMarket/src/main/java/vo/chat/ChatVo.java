package vo.chat;

public class ChatVo {

	int ch_idx;
	int u_idx;
	int r_idx;
	int ch_date;
	String u_name;
	
	public ChatVo() {
		super();
	}


	public ChatVo(int ch_idx, int u_idx, int r_idx, int ch_date, String u_name) {
		super();
		this.ch_idx = ch_idx;
		this.u_idx = u_idx;
		this.r_idx = r_idx;
		this.ch_date = ch_date;
		this.u_name = u_name;
	}


	public int getCh_idx() {
		return ch_idx;
	}

	
	public String getU_name() {
		return u_name;
	}


	public void setU_name(String u_name) {
		this.u_name = u_name;
	}


	public void setCh_idx(int ch_idx) {
		this.ch_idx = ch_idx;
	}

	public int getU_idx() {
		return u_idx;
	}

	public void setU_idx(int u_idx) {
		this.u_idx = u_idx;
	}

	public int getR_idx() {
		return r_idx;
	}

	public void setR_idx(int r_idx) {
		this.r_idx = r_idx;
	}

	public int getCh_date() {
		return ch_date;
	}

	public void setCh_date(int ch_date) {
		this.ch_date = ch_date;
	}
	
	
	
}
