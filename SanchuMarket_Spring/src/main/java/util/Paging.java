package util;
/*
        nowPage:����������
        rowTotal:��ü�����Ͱ���
        blockList:���������� �Խù���
        blockPage:��ȭ�鿡 ��Ÿ�� ������ ��ϼ�
 */
public class Paging{
	
	public static String getPaging(String pageURL, int nowPage, int rowTotal, int blockList, int blockPage){
		
		int totalPage/*��ü��������*/,
            startPage/*������������ȣ*/,
            endPage;/*��������������ȣ*/

		boolean  isPrevPage,isNextPage;
		StringBuffer sb; //��� ��Ȳ�� �Ǵ��Ͽ� HTML�ڵ带 ������ ��
		
		
		isPrevPage=isNextPage=false;
		//�Էµ� ��ü �ڿ��� ���� ��ü ������ ���� ���Ѵ�..
		totalPage = rowTotal/blockList;
		if(rowTotal%blockList!=0)totalPage++;
		

		//���� �߸��� ����� ���������� ���Ͽ� ���� ������ ���� ��ü ������ ����
		//���� ��� ������ ���������� ���� ��ü ������ ������ ����
		if(nowPage > totalPage)nowPage = totalPage;
		

		//���� �������� ������ �������� ����.
		startPage = ((nowPage-1)/blockPage) * blockPage+1;
		endPage =   startPage + blockPage - 1; //
		
		//������ ������ ���� ��ü������������ ũ�� ������������ ���� ����
		if(endPage > totalPage)endPage = totalPage;
		
		//�������������� ��ü���������� ���� ��� ���� ����¡�� ������ �� �ֵ���
		//boolean�� ������ ���� ����
		if(endPage < totalPage) isNextPage = true;
		//������������ ���� 1���� ������ ��������¡ ������ �� �ֵ��� ������
		if(startPage > 1)isPrevPage = true;
		
		//HTML�ڵ带 ������ StringBuffer����=>�ڵ����
		sb = new StringBuffer();
//-----�׷�������ó�� ���� --------------------------------------------------------------------------------------------		
		if(isPrevPage){
			sb.append("<a href ='"+pageURL+"?page=");
			sb.append(startPage-1);
			sb.append("'>��</a>");
		}
		else
			sb.append("��");
		
//------������ ��� ��� -------------------------------------------------------------------------------------------------
		sb.append("|");
		for(int i=startPage; i<= endPage ;i++){
			//if(i>totalPage)break;
			if(i == nowPage){ //���� �ִ� ������
				sb.append("&nbsp;<b><font color='red'>");
				
				sb.append("<span class='num_box'>");
				sb.append(i);
				sb.append("</span>");
				
				sb.append("</font></b>");
			}
			else{//���� �������� �ƴϸ�
				sb.append("&nbsp;<a href='"+pageURL+"?page=");
				sb.append(i);
				sb.append("'>");
				
				sb.append("<span class='num_box'>");
				sb.append(i);
				sb.append("</span>");
				
				sb.append("</a>");
			}
		}// end for
		
		sb.append("&nbsp;|");
		
//-----�׷�������ó�� ���� ----------------------------------------------------------------------------------------------
		if(isNextPage){
			sb.append("<a href='"+pageURL+"?page=");
			sb.append(endPage+1);
			sb.append("'>��</a>");
		}
		else
			sb.append("��");
//---------------------------------------------------------------------------------------------------------------------	    

		return sb.toString();
	}
}