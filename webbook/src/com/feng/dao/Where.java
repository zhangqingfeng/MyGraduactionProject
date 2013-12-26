package com.feng.dao;
 
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;
 
import javax.servlet.http.HttpServletRequest;
 
public class Where {
 
	public Where(){}
	
	public Where(String property, Object value, String matchType) {
		this.property = property;
		this.value = value;
		this.matchType = matchType;
	}
	
 
	private String property; 
	private Object value; 
	private String matchType;
	
	public String getProperty() {
		return property;
	}
	public void setProperty(String property) {
		this.property = property;
	}
	public Object getValue() {
		return value;
	}
	public void setValue(Object value) {
		this.value = value;
	}
	public String getMatchType() {
		return matchType;
	}
	public void setMatchType(String matchType) {
		this.matchType = matchType;
	}
	
	
	/**
	 * ����HttpServletRequest���󹹽���������ѯ<br/>
	 * ��Ԫ�ر����nameֵ������"q_"Ϊǰ׺<br/>
	 * ǰ׺���������ѯ���� ����"q_eq_"˵��Ϊ"="��ѯ��ʽ<br/>
	 * ��ѯ��ʽ��Ϊ���Ե�����,�������ֱ��ʹ��"or"��ʽ��ѯʱ�����"_OR_"���зָ�<br/>
	 * ���磺<br/>
	 * q_eq_username �� ����username���Խ���"="��ѯ
	 * q_like_address �� ����address���Խ���"like"��ѯ
	 * q_like_firstname_OR_lastname �� firstname like '%xx%' or lastname like '%xx%'
	 * @param request
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static List<Where> builderWhereListByRequest(HttpServletRequest request) {
		List<Where> list = new ArrayList<Where>();
		
		Enumeration<String> enumeration = request.getParameterNames();
		while(enumeration.hasMoreElements()) {
			String formName = enumeration.nextElement();
			if(formName.startsWith("q_")) {
				String[] strs;
				//�ж��Ƿ���_OR_
				if(formName.contains("_OR_")) {
					//q_eq_username_OR_lastname
					strs = formName.split("_", 3);
				} else {
					//q_like_username
					strs = formName.split("_");
				}
				
				if(strs.length < 3) {
					throw new IllegalArgumentException("δ����Լ����д��ѯ����:" + formName);
				} else {
					String matchType = strs[1];  //�Ƚ�����
					String property = strs[2];  //��������
					String value = request.getParameter(formName); //����ֵ
					if(value != null && !value.isEmpty()) {
						try {
							
							//value = new String(value.getBytes("ISO8859-1"),"UTF-8");
							//����ѯ�����Ż�request�洢�ռ���
							request.setAttribute(formName, value);
							Where where = new Where(property,value,matchType);
							list.add(where);
						} catch (Exception e) {
							e.printStackTrace();
						}
					}
				}
			}
		}
		return list;
	}
	
}