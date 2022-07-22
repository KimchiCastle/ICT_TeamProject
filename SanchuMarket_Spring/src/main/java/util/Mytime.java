package util;

import java.util.List;

import vo.ProductVo;

public class Mytime {

	public static void time_cal(List<ProductVo> list) {
		
		String[] p_time = new String[list.size()];
		
		for (int i = 0; i < list.size(); i++) {
			p_time[i] = list.get(i).getP_time();
			int p_tim = Integer.parseInt(p_time[i]);
			String p_ti = "1����";
			/* System.out.println(p_tim); */
			if (p_tim < 10) {
				p_ti = "�����";
			} else if (p_tim < 60) {
				p_ti = String.format("%d����", p_tim);
			} else if (p_tim < 3600) {
				p_ti = Integer.toString(p_tim / 60);
				p_ti = String.format("%s����", p_ti);
			} else if (p_tim < 86400) {
				p_ti = Integer.toString(p_tim / 3600);
				p_ti = String.format("%s�ð���", p_ti);
			} else if (p_tim < 86400 * 30) {
				p_ti = Integer.toString(p_tim / 86400);
				p_ti = String.format("%s����", p_ti);
			} else if (p_tim < 86400 * 365) {
				p_ti = Integer.toString(p_tim / 86400 * 30);
				p_ti = String.format("%s����", p_ti);
			} else if (p_tim >= 86400 * 365) {
				if (p_tim > 2000000000) {
					p_ti = "���ֿ�����";
				} else {
					p_ti = Integer.toString(p_tim / ((86400 * 30) * 12));
					p_ti = String.format("%s����", p_ti);
				}
			}
			list.get(i).setP_date(p_ti);
		}
		
		
	}

	public static String time_cal(ProductVo vo) {

		String p_time = vo.getP_time();

		int p_tim = Integer.parseInt(p_time);
		String p_ti = "1����";
		/* System.out.println(p_tim); */
		if (p_tim < 10) {
			p_ti = "�����";
		} else if (p_tim < 60) {
			p_ti = String.format("%d����", p_tim);
		} else if (p_tim < 3600) {
			p_ti = Integer.toString(p_tim / 60);
			p_ti = String.format("%s����", p_ti);
		} else if (p_tim < 86400) {
			p_ti = Integer.toString(p_tim / 3600);
			p_ti = String.format("%s�ð���", p_ti);
		} else if (p_tim < 86400 * 30) {
			p_ti = Integer.toString(p_tim / 86400);
			p_ti = String.format("%s����", p_ti);
		} else if (p_tim < 86400 * 365) {
			p_ti = Integer.toString(p_tim / 86400 * 30);
			p_ti = String.format("%s����", p_ti);
		} else if (p_tim >= 86400 * 365) {
			if (p_tim > 2000000000) {
				p_ti = "���ֿ�����";
			} else {
				p_ti = Integer.toString(p_tim / ((86400 * 30) * 12));
				p_ti = String.format("%s����", p_ti);
			}
		}
		
		return p_ti;
		
	}
	
	
}
