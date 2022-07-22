package dao;

import java.util.List;
import java.util.Map;

import vo.ProductVo;

public interface ProductDao {


	//��ǰ ��ü��ȸ
	public List<ProductVo> selectList(Map map); 

	//��ü��ǰ ����
	public int				rowTotal();
	//��ǰ�˻� ����
	public int 				rowTotal_search(Map map);
	//���ݹ�����ǰ�� ����	
	public int				rowTotal_pp(Map map);
	//���ݰ˻� ����		
	public int			   	rowTotal_p_price(Map map);
	//ī�װ� ����
	public int 				rowTotal_cate(int c_idx);
		
		
	// ī�װ��� ��ȸ
	public List<ProductVo> selectList_cate(Map map);
		
	//u_idx �������� �ѱ�
	public List<ProductVo> selectList(int u_idx);
	
	
	//��ǰ���� �ѱ�
	public ProductVo selectList2(int p_idx);
	
	//��ǰ������ ��ǰ�̹��� �ϳ��� ��������
	public ProductVo selectListproduct(int p_idx);

	//�ֱ� ��ǰ ��ȸ(mainpage_admin)
	public List<ProductVo> selectRecentList();
		
	
	public int todayProductCount();
		
	
	// ��ǰ��� �޼���
	public int insert(ProductVo vo);
	
		
	//��ǰ�˻�
	public List<ProductVo> select_search(Map map);
	
	public int selectMaxIdx();

	//���� ���� ��ǰ�� �˻�
	public List<ProductVo> select_price_text_search(Map map);

	//���� �����˻�
	public List<ProductVo> select_price_search(Map map);

	
	// ��ǰ ����
	public int update(ProductVo vo);

	
	


//	//��ǰ����Ʈ �׽�Ʈ
//	public List<ProductVo> select();
//	
	
}
