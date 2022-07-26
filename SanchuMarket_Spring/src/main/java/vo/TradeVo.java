package vo;

public class TradeVo {

	int p_idx; 			// 상품번호
	String seller;		// 판매자
	String buyer; 		// 구매자
	String t_status; 	// 거래상태
	String t_date;		// 거래날짜

	public int getP_idx() {
		return p_idx;
	}

	public void setP_idx(int p_idx) {
		this.p_idx = p_idx;
	}

	public String getSeller() {
		return seller;
	}

	public void setSeller(String seller) {
		this.seller = seller;
	}

	public String getBuyer() {
		return buyer;
	}

	public void setBuyer(String buyer) {
		this.buyer = buyer;
	}

	public String getT_status() {
		return t_status;
	}

	public void setT_status(String t_status) {
		this.t_status = t_status;
	}

	public String getT_date() {
		return t_date;
	}

	public void setT_date(String t_date) {
		this.t_date = t_date;
	}

}
