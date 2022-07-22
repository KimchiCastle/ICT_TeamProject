package controller;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import dao.ImageDao;
import dao.ProductDao;
import dao.UserDao;
import util.MyFileDelete;
import util.MyFileUpload;
import util.Mytime;
import vo.ImageVo;
import vo.ProductVo;
import vo.UserVo;

@Controller
@RequestMapping("/product/")
public class ProductController {
	
	@Autowired
	HttpServletRequest request;
	
	@Autowired
	HttpServletResponse response;
	
	@Autowired
	HttpSession session;
	
	@Autowired
	ServletContext applicaton;
	
	ProductDao product_dao;
	ImageDao image_dao;
	UserDao user_dao;

	public ProductController(ProductDao product_dao, ImageDao image_dao, UserDao user_dao) {
		super();
		this.product_dao = product_dao;
		this.image_dao = image_dao;
		this.user_dao =	user_dao;
	}
	
	
	//���߿� ��Ű������ ��ǰ������ �������� ���鵵�� ���� �ҿ���
	@RequestMapping("insert_form.do")
	public String insert_form()  {
		
		
		return "product/product_insert";
	}
	
	// ����Ʈ Ÿ������ ����
	//�������� �ȿ� �Ѳ����� ���� �����Ͱ� ���⶧���� �� �Ķ���ͷ� ����..
	@ResponseBody
	@RequestMapping(value = "product_insert.do", method = RequestMethod.POST)
	public Map product_insert(
	@RequestParam(value="imagedata") MultipartFile [] imagedata, 
	int u_idx, String p_name, int c_idx, String p_location, String p_condition, int p_price, String p_exp) {
		
		//�Ķ���ͷ� ���� ProductVo �����ڸ����� ����
		String p_status = "�ŷ�����";
		
		//��ǰ���� �ٹٲ� �ϱ�
		p_exp = p_exp.replaceAll("\r\n", "<br>");
		
		//								 ��������,ī�װ�,��ǳ��, ����,  ��ǰ����,  ��ǰ����, �ŷ�����, Ŭ����, �Ǹſ���
		ProductVo productVo = new ProductVo(u_idx, c_idx, p_name, p_price, p_condition, p_exp, p_location,0,p_status);
		
		//ProductDB�� Data �ֱ�
		//���� DB�� �ִ� ������ p_idx�� ���ϱ� ���ؼ�
		int res1 = product_dao.insert(productVo);
		int p_idx = product_dao.selectMaxIdx();
		
		/* System.out.println(p_idx); */
		
		int res2 = 0;
		
		//������ ����
		String abs_path = applicaton.getRealPath("/resources/imgdata/");
		
		//for each�� ��� �迭�� ���� �̹��������� ����
		for(MultipartFile img : imagedata) {
			
			//���Ͼ��ε� �޼��� ���
			String img_str = MyFileUpload.myFileUpload(abs_path, img);
			
			//�̹��� Vo ����
			ImageVo imageVo = new ImageVo();
			
			//�̹���Vo�� �̹��� ���ϸ� �ֱ�
			imageVo.setImagedata(img_str);
			imageVo.setP_idx(p_idx);
			//���� DB�� �ֱ�
			res2 = image_dao.insert(imageVo);
			
		}
		
		//JsonConverter ����ϱ� ���� Map����
		Map map = new HashMap();

		//�⺻ ���ϰ� false
		boolean bResult = false;
		
		//���� ��ǰ��ϰ� �̹�������� ������..
		if(res1==1 && res2==1) {
			
			//���ϰ� true �� ����
			bResult = true;
			
		}
		//�ʿ� result�� �ֱ�
		map.put("res", bResult);
		
		return map;
	}
	
	@RequestMapping("modify_form.do")
	public String product_modify_form(Model model,int p_idx){
		
		
		//���߿� ��ǰ ������, u_idx Ȯ������ ���� ����

		//�ӽ÷� p_idx 1�� ���� �Ķ���ͷ� �ޱ� ��������
		
		//�Ķ���ͷ� �޾ƿ� p_idx�� ��ǰ ���� 1�� ��������
		ProductVo vo = product_dao.selectList2(p_idx);
		
		// �ٹٲ� <br> => \r\n
		vo.setP_exp(vo.getP_exp().replaceAll("<br>", "\r\n")); 
		
		//model�� add
		model.addAttribute("vo", vo);

		
		return "product/product_modify_form";
	}
	
	

	@ResponseBody
	@RequestMapping(value = "product_modify.do", method = RequestMethod.POST)
	public Map product_modify(
	@RequestParam(value="imagedata") MultipartFile [] imagedata, int p_idx, String[] change_image,
	String p_name, int c_idx, String p_location, String p_condition, int p_price, String p_exp, int u_idx
	) {
		
		
		String abs_Path = applicaton.getRealPath("/resources/imgdata/");
		
		//���߿� �Ķ���ͷ� �ޱ�
		
		
		List<String> upload_str = new ArrayList<String>();
		
		//�ϴ� ���� ���� ���� ���ε�
		for(MultipartFile file : imagedata) {
			
			//list�� ���ε�� ���ϸ� add
			upload_str.add(MyFileUpload.myFileUpload(abs_Path, file));
//			upload_str.add(file.getOriginalFilename());
			
		}
		
		
		//�Ķ���ͷ� ���� ProductVo �����ڸ����� ����
		String p_status = "�ŷ�����";
		
		//��ǰ���� �ٹٲ� �ϱ�
		p_exp = p_exp.replaceAll("\r\n", "<br>");
		
		
		//								 ��������,ī�װ�,��ǳ��, ����,  ��ǰ����,  ��ǰ����, �ŷ�����, Ŭ����, �Ǹſ���
		ProductVo vo = new ProductVo(u_idx, c_idx, p_name, p_price, p_condition, p_exp, p_location,0,p_status);
		
		//������ ��ǰ��ȣ ��ü�� ����
		vo.setP_idx(p_idx);

		
		/*
			�̹�������, �̹��� ����, �̹��� ���ε� ���Ǻ��� ����
			
			change_image[] �迭���̴� 12�� �ʱ�ȭ �Ǿ��ְ�, ���� ���� 0��(���ڿ�)
			
			�ϴ� �̹����� ���δ� ����ϰ�, ���Ŀ� ������(���� ����) ������
			
			DB���� ������ ���� �����Ϳ� DB ����
		*/
		
		
		int fileCnt = 0; // MutipartFile ���ϸ� �ε����� ī��Ʈ ����
		
		for (int i = 0; i < change_image.length; i++) {

			// i�� ¦����
			if (i % 2 == 0) {

				// ������ �����̸�
				if (!change_image[i].equals("changePhoto")) {
					
					//������ idx�� �������̸�, �ʱ�ȭ�ƴ� 0�� �ƴҶ�
					if (change_image[i].matches("-?\\d+") && Integer.parseInt(change_image[i])!=0 && !change_image[i+1].equals("delPhoto")) {
//						System.out.printf("%s�� �̹����� �����Ǿ����ϴ�.%s �ش��ȣ�� �������ּ���\n", change_image[i + 1], change_image[i]);
						
						/* 
						 �ش� idx�� ���� ������ �̹������� ���� 
						 
						 DB�� ����Ǿ� �ִ� ���ϸ� �ش��ϴ� ���� ���ϻ���
						 */
						ImageVo imgFileName = image_dao.selectOneImage(Integer.parseInt(change_image[i]));
						
						MyFileDelete.myFileDelete(abs_Path, imgFileName.getImagedata());
						
						
						Map updateInfo = new HashMap();
						
						updateInfo.put("i_idx", Integer.parseInt(change_image[i]));
						updateInfo.put("imagedata", upload_str.get(fileCnt));
						
						fileCnt++;
						//DB�� �̹��� ���ϸ� update
						int res = image_dao.imageUpdate(updateInfo);
						
					}

				// �߰��� �����̸�
				} else {

//					System.out.printf("%s�� �̹����� �߰��Ǿ����ϴ�. %s �ش��ȣ�� �߰����ּ���\n", change_image[i + 1],change_image[i]);
					
					ImageVo imageVo = new ImageVo();
					imageVo.setP_idx(p_idx);
					imageVo.setImagedata(upload_str.get(fileCnt));
					
					
					fileCnt++;
					
					int res = image_dao.insert(imageVo);
					
					
				}
			
			//i�� Ȧ����..
			}else {
				//������ �����̸�
				if(change_image[i].equals("delPhoto")) {
//					System.out.printf("%s �� idx�� �ش��ϴ� �̹����� �����Ǿ����ϴ� �������ּ���.\n",change_image[i-1]);
					
					ImageVo imgFileName = image_dao.selectOneImage(Integer.parseInt(change_image[i-1]));
					
					//���� ���� ����
					MyFileDelete.myFileDelete(abs_Path, imgFileName.getImagedata());
					
					//DB����
					int res = image_dao.deleteImage(Integer.parseInt(change_image[i-1]));
				}
			}

		}

		
		//�ռ� ������, ������ ���� ����� vo��ü, DB ������Ʈ
		int res2 = product_dao.update(vo);
		
		
		//JsonConverter ����ϱ� ���� Map����
		Map map = new HashMap();

		//�⺻ ���ϰ� false
		//���� ��ǰ���� ������..
		boolean bResult = (res2==1);
		
		//�ʿ� result�� �ֱ�
		map.put("res", bResult);
		
		return map;
	}
	
	
	@RequestMapping("poduct_detail.do")
	public String productList(Model model,
							  @RequestParam(value ="p_idx",required = false, defaultValue="null") String p_idx,
							  @RequestParam(value ="p_name",required = false, defaultValue="null")String p_name
							  ) throws Exception {
		
		
		//���� ���� �Ķ���� ���� null�� �ƴϸ�
				if(!p_idx.equals("null")) {
					
					
					//��Ű ���� key = p_idx , value = p_name
					//�ѱ�(�����ڵ幮��)�� ��Ű�� ���� ���ϱ� ������ URLEncoder ���
					Cookie cookie = new Cookie(p_idx, URLEncoder.encode(p_name, "utf-8"));
					
					
					//��Ű�� ������ ����� ������ο����� ��Ű�� ���� ����
					cookie.setPath("/sanchumarket/");
					
					
					//��Ű����
					response.addCookie(cookie);
					
				}
				
		
		
		//p_idx �Ķ���ͷ� �޾ƾ���, �ϴ� �ӽ÷� 1����ǰ
		
		ProductVo vo = product_dao.selectList2(Integer.parseInt(p_idx));
		
		UserVo vo2 = user_dao.selectOneByIdx(vo.getU_idx());
		
		
		//�ð� ��� �޼ҵ� ���
		vo.setP_time(Mytime.time_cal(vo));
		
		
		//����������, ��ǰ���� �Ѵ� binding
		model.addAttribute("vo", vo);
		model.addAttribute("vo2", vo2);
		
		
		
		return "product/product_detail";
	}
	
	@RequestMapping("jjimon.do")
	@ResponseBody
	public Map jjimon(int p_idx, int u_idx) {
		
		System.out.println(p_idx);
		System.out.println(u_idx);
		
		Map map = new HashMap();
		
		map.put("p_idx", p_idx);
		map.put("u_idx", u_idx);
				
		
		
		
		return null;
	}
	
	
	
}
