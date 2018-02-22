package cn.zc.cris.converter;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import javax.servlet.ServletContext;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.util.StrutsTypeConverter;

import com.opensymphony.xwork2.ActionContext;

public class DateConverter extends StrutsTypeConverter{

	private DateFormat format;
	public DateConverter() {
		System.out.println("dateFormat");
	}
	public DateFormat getFormat() {
		if(this.format == null) {
			//获取当前web应用的初始化参数
			ServletContext servletContext = ServletActionContext.getServletContext();
			String pattern = servletContext.getInitParameter("DatePattern");
			this.format = new SimpleDateFormat(pattern);
		}
		return this.format;
	}
	
	/**
	 * 
	 * @MethodName: convertFromString
	 * @Description: TODO (将前台传来的字符串转换为Date类型)
	 * @see org.apache.struts2.util.StrutsTypeConverter#convertFromString(java.util.Map, java.lang.String[], java.lang.Class)
	 * @Author：zc-cris
	 */
	@Override
	public Object convertFromString(Map arg0, String[] arg1, Class arg2) {
		if(arg2 == Date.class) {
			if(arg1 != null && arg1.length>0) {
				try {
					return getFormat().parse(arg1[0]);
				} catch (ParseException e) {
					e.printStackTrace();
				}
			}
		}
		return null;
	}

	/**
	 * 
	 * @MethodName: convertToString
	 * @Description: TODO (将Date类型转换为String类型)
	 * @see org.apache.struts2.util.StrutsTypeConverter#convertToString(java.util.Map, java.lang.Object)
	 * @Author：zc-cris
	 */
	@Override
	public String convertToString(Map arg0, Object arg1) {
		if(arg1 instanceof Date) {
			return getFormat().format(arg1);
		}
		return null;
	}

}
