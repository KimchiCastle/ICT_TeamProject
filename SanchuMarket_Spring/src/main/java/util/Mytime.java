package util;

import java.util.List;

import vo.product.ProductVo;

public class Mytime {

	public static void time_cal(List<ProductVo> list) {
		
		String[] p_time = new String[list.size()];
		
		for (int i = 0; i < list.size(); i++) {
			p_time[i] = list.get(i).getP_time();
			int p_tim = Integer.parseInt(p_time[i]);
			String p_ti = "1년전";
			/* System.out.println(p_tim); */
			if (p_tim < 10) {
				p_ti = "방금전";
			} else if (p_tim < 60) {
				p_ti = String.format("%d초전", p_tim);
			} else if (p_tim < 3600) {
				p_ti = Integer.toString(p_tim / 60);
				p_ti = String.format("%s분전", p_ti);
			} else if (p_tim < 86400) {
				p_ti = Integer.toString(p_tim / 3600);
				p_ti = String.format("%s시간전", p_ti);
			} else if (p_tim < 86400 * 30) {
				p_ti = Integer.toString(p_tim / 86400);
				p_ti = String.format("%s일전", p_ti);
			} else if (p_tim < 86400 * 365) {
				p_ti = Integer.toString(p_tim / 86400 * 30);
				p_ti = String.format("%s달전", p_ti);
			} else if (p_tim >= 86400 * 365) {
				if (p_tim > 2000000000) {
					p_ti = "아주오래전";
				} else {
					p_ti = Integer.toString(p_tim / ((86400 * 30) * 12));
					p_ti = String.format("%s년전", p_ti);
				}
			}
			list.get(i).setP_date(p_ti);
		}
		
		
	}

	public static String time_cal(ProductVo vo) {

		String p_time = vo.getP_time();

		int p_tim = Integer.parseInt(p_time);
		String p_ti = "1년전";
		/* System.out.println(p_tim); */
		if (p_tim < 10) {
			p_ti = "방금전";
		} else if (p_tim < 60) {
			p_ti = String.format("%d초전", p_tim);
		} else if (p_tim < 3600) {
			p_ti = Integer.toString(p_tim / 60);
			p_ti = String.format("%s분전", p_ti);
		} else if (p_tim < 86400) {
			p_ti = Integer.toString(p_tim / 3600);
			p_ti = String.format("%s시간전", p_ti);
		} else if (p_tim < 86400 * 30) {
			p_ti = Integer.toString(p_tim / 86400);
			p_ti = String.format("%s일전", p_ti);
		} else if (p_tim < 86400 * 365) {
			p_ti = Integer.toString(p_tim / 86400 * 30);
			p_ti = String.format("%s달전", p_ti);
		} else if (p_tim >= 86400 * 365) {
			if (p_tim > 2000000000) {
				p_ti = "아주오래전";
			} else {
				p_ti = Integer.toString(p_tim / ((86400 * 30) * 12));
				p_ti = String.format("%s년전", p_ti);
			}
		}
		
		return p_ti;
		
	}
	
	
}
