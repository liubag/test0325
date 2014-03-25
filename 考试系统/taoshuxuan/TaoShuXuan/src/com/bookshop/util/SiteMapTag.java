package com.bookshop.util;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

import org.dom4j.Attribute;
import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

/**
 * 站点导航标签的实现 
 * @author Administrator
 *
 */
public class SiteMapTag extends TagSupport {

	private static final long serialVersionUID = -3531938467909884528L;
	private String currentFilePath;
	private Element target;
	
	@Override
	public int doStartTag() throws JspException {
		HttpServletRequest request = (HttpServletRequest) this.pageContext.getRequest();
		currentFilePath = request.getRequestURI().replaceFirst(request.getContextPath(), "");
		try {
			Element root = (Element)pageContext.getServletContext().getAttribute("webSiteMapSet");
			if(root==null){
				SAXReader reader = new SAXReader();
				InputStream inputStream = SiteMapTag.class.getClassLoader().getResourceAsStream("sitemap.xml");
				Document document = reader.read(inputStream);
				root = document.getRootElement();
				pageContext.getServletContext().setAttribute("webSiteMapSet", root);
			}
			parseParent(root);
			StringBuffer content = new StringBuffer("");
			List<String> titles = new ArrayList<String>();
			List<String> hrefs = new ArrayList<String>();
			
			while(target!=null){
				Attribute attTitle = target.attribute("title");
				if(attTitle!=null){
					titles.add(attTitle.getText());
				}
				
				Attribute attHref = target.attribute("href");
				if(attHref!=null){
					hrefs.add(attHref.getText());
				}else{
					hrefs.add("");
				}
				if(target.getParent().attribute("isroot")==null){
					target = target.getParent();
				}else{
					target=null;
				}
			}
			
			for (int i = titles.size()-1; i >=0; i--) {
				String href = hrefs.get(i);
				if(href.equals("")){
					content.append(titles.get(i)+"--&gt;");
				}else if(i>0){
					content.append("<a href='"+href+"'>"+titles.get(i)+"</a>--&gt;");
				}else{
					content.append("<strong>"+titles.get(i)+"</strong>--&gt;");
				}
				
			}
			if(content.length()>0){
				this.pageContext.getOut().println(content.delete(content.length()-6, content.length()));
			}
			

		} catch (Exception e) {
			e.printStackTrace();
			throw new JspException(e);
		}
		
		
		return super.doStartTag();
	}

	@SuppressWarnings("unchecked")
	private void parseParent(Element parent){
		Iterator<Element> it = parent.elementIterator();
		while(it.hasNext()){
			Element temp = it.next();
			Attribute attr = temp.attribute("path");
			if(attr!=null){
				if(attr.getText().equals(currentFilePath)){
					target = temp;
					return;
				}
			}
			parseParent(temp);
		}
	}
	
}
