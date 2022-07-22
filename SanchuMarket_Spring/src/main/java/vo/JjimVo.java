package vo;

public class JjimVo {

	private int j_idx;
	private int p_idx;
	private int u_idx;

	
	public JjimVo() {
		
	}
	
	
	public JjimVo(int p_idx, int u_idx) {
		this.p_idx = p_idx;
		this.u_idx = u_idx;
	}

	public int getJ_idx() {
		return j_idx;
	}

	public void setJ_idx(int j_idx) {
		this.j_idx = j_idx;
	}

	public int getP_idx() {
		return p_idx;
	}

	public void setP_idx(int p_idx) {
		this.p_idx = p_idx;
	}

	public int getU_idx() {
		return u_idx;
	}

	public void setU_idx(int u_idx) {
		this.u_idx = u_idx;
	}

}
