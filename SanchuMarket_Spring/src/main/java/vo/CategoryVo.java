package vo;

public class CategoryVo {

	// 카테고리 번호
	int c_idx;

	String c_name;
	// 해당 카테고리 상품 개수
	int category_cnt;
	
	
	public CategoryVo() {
		// TODO Auto-generated constructor stub
	}
	
	public CategoryVo(int c_idx, int category_cnt) {
		this.c_idx = c_idx;
		this.category_cnt = category_cnt;
	}

	public int getC_idx() {
		return c_idx;
	}

	public void setC_idx(int c_idx) {
		this.c_idx = c_idx;
	}

	public String getC_name() {
		return c_name;
	}

	public void setC_name(String c_name) {
		this.c_name = c_name;
	}

	public int getCategory_cnt() {
		return category_cnt;
	}

	public void setCategory_cnt(int category_cnt) {
		this.category_cnt = category_cnt;
	}

}
