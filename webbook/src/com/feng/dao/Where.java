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
	 * 根据HttpServletRequest对象构建多条件查询<br/>
	 * 表单元素必须的name值必须以"q_"为前缀<br/>
	 * 前缀后面紧跟查询类型 例如"q_eq_"说明为"="查询方式<br/>
	 * 查询方式后为属性的名称,多个属性直接使用"or"方式查询时请采用"_OR_"进行分割<br/>
	 * 例如：<br/>
	 * q_eq_username → 根据username属性进行"="查询
	 * q_like_address → 根据address属性进行"like"查询
	 * q_like_firstname_OR_lastname → firstname like '%xx%' or lastname like '%xx%'
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
				//判断是否含有_OR_
				if(formName.contains("_OR_")) {
					//q_eq_username_OR_lastname
					strs = formName.split("_", 3);
				} else {
					//q_like_username
					strs = formName.split("_");
				}
				
				if(strs.length < 3) {
					throw new IllegalArgumentException("未按照约束来写查询参数:" + formName);
				} else {
					String matchType = strs[1];  //比较类型
					String property = strs[2];  //属性名称
					String value = request.getParameter(formName); //属性值
					if(value != null && !value.isEmpty()) {
						try {
							
							//value = new String(value.getBytes("ISO8859-1"),"UTF-8");
							//将查询参数放回request存储空间中
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