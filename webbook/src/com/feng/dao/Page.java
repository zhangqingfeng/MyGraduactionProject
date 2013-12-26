package com.feng.dao;
 
import java.util.List;
 
public class Page<T> {
	
	private int pageSize = 2;
	private int pageNum = 1;
	private int offSet = 0;
	private Long totalPages = 1L;
	private Long totalCount = 1L;
	private List<T> result;
	private String order;
	private String orderBy;
	
	public Page(){}
	
	
	/**
	 * ��ȡÿҳ��ʾ��������
	 * @return
	 */
	public int getPageSize() {
		return pageSize;
	}
	/**
	 * ����ÿҳ��ʾ��������
	 * @param pageSize
	 */
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	/**
	 * ��ȡ��ǰҳ��
	 * @return
	 */
	public int getPageNum() {
		return pageNum;
	}
	/**
	 * ���õ�ǰҳ��
	 * @param pageNum
	 */
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
		if(pageNum < 1) {
			this.pageNum = 1;
		} 
	}
	/**
	 * ��ȡ��ʼ�к�
	 * @return
	 */
	public int getOffSet() {
		return offSet;
	}
	/**
	 * ������ʼ�к�
	 * @param offSet
	 */
	public void setOffSet(int offSet) {
		this.offSet = offSet;
	}
	/**
	 * ��ȡ��ҳ��
	 * @return
	 */
	public Long getTotalPages() {
		return totalPages;
	}
	/**
	 * ������ҳ��
	 * @param totalPages
	 */
	private void setTotalPages(Long totalPages) {
		this.totalPages = totalPages;
	}
	/**
	 * ��ȡ�ܼ�¼��
	 * @return
	 */
	public Long getTotalCount() {
		return totalCount;
	}
	/**
	 * �����ܼ�¼��
	 * @param totalCount
	 */
	public void setTotalCount(Long totalCount) {
		this.totalCount = totalCount;
		//�����ܼ�¼���Զ�������ҳ��
		Long result = totalCount / getPageSize();
		if(totalCount % pageSize != 0) {
			result += 1;
		}
		setTotalPages(result);
		
		//���ݵ�ǰҳ���Զ�������ʼ�к�
		setOffSet((this.pageNum - 1) * getPageSize());
	}
	/**
	 * ��ȡ��ǰҳ�����ݼ�
	 * @return
	 */
	public List<T> getResult() {
		return result;
	}
	/**
	 * ���õ�ǰҳ�����ݼ�
	 * @param result
	 */
	public void setResult(List<T> result) {
		this.result = result;
	}
 
	/**
	 * ��ȡ�������������������֮�����,�ָ�
	 * @return
	 */
	public String getOrder() {
		return order;
	}
	/**
	 * �����������������������֮�����,�ָ�
	 * @return
	 */
	public void setOrder(String order) {
		this.order = order;
	}
	/**
	 * ��ȡ����ʽ�������ʽ֮�����,�ָ�
	 * @return
	 */
	public String getOrderBy() {
		return orderBy;
	}
	/**
	 * ��������ʽ�������ʽ֮�����,�ָ�
	 * @return
	 */
	public void setOrderBy(String orderBy) {
		this.orderBy = orderBy;
	}
 
	
}