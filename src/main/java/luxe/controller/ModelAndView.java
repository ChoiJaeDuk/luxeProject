package luxe.controller;
/**
 * �� Controller�� ����ä���� ����� �� �̵��ؾ��ϴ� ������ ������
 * �̵���Ŀ� ���� �Ӽ��� �����ϴ� ��ü
 * 
 * */
public class ModelAndView {
	private String viewName;//�� �̸�
	private boolean isRedirect;//�̵����(true�̸� redirect���, false�̸� forward���)
	
	public ModelAndView() {}
	
	
	public ModelAndView(String viewName) {
		this.viewName = viewName;
	}



	public ModelAndView(String viewName, boolean isRedirect) {
		this(viewName);
		this.isRedirect = isRedirect;
	}



	public String getViewName() {
		return viewName;
	}



	public void setViewName(String viewName) {
		this.viewName = viewName;
	}



	public boolean isRedirect() {
		return isRedirect;
	}



	public void setRedirect(boolean isRedirect) {
		this.isRedirect = isRedirect;
	}
	
	
	
}
