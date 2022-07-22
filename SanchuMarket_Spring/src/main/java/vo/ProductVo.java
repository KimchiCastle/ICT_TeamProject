package vo;

import java.util.List;

public class ProductVo {
	
	int p_idx;
	int u_idx;
	int c_idx;			//ī�װ���ȣ
	String p_name;		//��ǰ��
	String p_date;		//�������
	int p_price;		//��ǰ����
	String p_condition; //��ǰ����
	String p_exp;		//��ǰ����
	String p_location;	//�ŷ�����
	int p_click;		//��ǰ��ȸ��
	String p_status;	//�ŷ�����
	String p_time;		//����, ���, ��ð�, ���� ��
	String u_name;
	
	List<ImageVo> image_list;
	
	
	
	
	public String getP_time() {
		return p_time;
	}


	public void setP_time(String p_time) {
		this.p_time = p_time;
	}

	 
	public List<ImageVo> getImage_list() {
		return image_list;
	}


	public void setImage_list(List<ImageVo> image_list) {
		this.image_list = image_list;
	}


	//�⺻������
	public ProductVo() {
		// TODO Auto-generated constructor stub
	}


	public ProductVo(int u_idx, int c_idx, String p_name, int p_price, String p_condition, String p_exp,
			String p_location, int p_click, String p_status) {
		super();
		this.u_idx = u_idx;
		this.c_idx = c_idx;
		this.p_name = p_name;
		this.p_price = p_price;
		this.p_condition = p_condition;
		this.p_exp = p_exp;
		this.p_location = p_location;
		this.p_click = p_click;
		this.p_status = p_status;
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

	public int getC_idx() {
		return c_idx;
	}

	public void setC_idx(int c_idx) {
		this.c_idx = c_idx;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public String getP_date() {
		return p_date;
	}

	public void setP_date(String p_date) {
		this.p_date = p_date;
	}

	public int getP_price() {
		return p_price;
	}

	public void setP_price(int p_price) {
		this.p_price = p_price;
	}

	public String getP_condition() {
		return p_condition;
	}

	public void setP_condition(String p_condition) {
		this.p_condition = p_condition;
	}

	public String getP_exp() {
		return p_exp;
	}

	public void setP_exp(String p_exp) {
		this.p_exp = p_exp;
	}

	public String getP_location() {
		return p_location;
	}

	public void setP_location(String p_location) {
		this.p_location = p_location;
	}

	public int getP_click() {
		return p_click;
	}

	public void setP_click(int p_click) {
		this.p_click = p_click;
	}

	public String getP_status() {
		return p_status;
	}

	public void setP_status(String p_status) {
		this.p_status = p_status;
	}
	
	
	//����� ����Ʈ�� ���� �ƴ��� ��¿�
	public void list() {
		
		for(ImageVo vo : image_list) {
			
			System.out.println(vo.getImagedata().toString());
			
		}
		
	}
	
	
}
