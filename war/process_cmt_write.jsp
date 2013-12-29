<%@page import="com.google.appengine.api.datastore.*"%>
<%@page contentType="text/html;charset=utf-8" %>
<%
	request.setCharacterEncoding("utf-8");
	String id=(String)session.getAttribute("loginid");
	String post_id = request.getParameter("post_id");
	String content =request.getParameter("content");
	
	if((id=="") || (post_id=="") || (content=="")){ response.sendRedirect("/"); return;}
	

	DatastoreService datastore= DatastoreServiceFactory.getDatastoreService();
	Entity comment = new Entity("Comments");
	comment.setProperty("cmt_auther",id);
	comment.setProperty("post_id",post_id);
	comment.setProperty("cmt_content",content);
	comment.setProperty("cmt_date", new java.util.Date());
	datastore.put(comment);

	response.sendRedirect("/post.jsp?no="+post_id);
%>