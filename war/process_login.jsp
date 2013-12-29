<%@page contentType="text/html;charset=utf-8" %>
<%@page import="com.google.appengine.api.datastore.*"%>
<%
	DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();

	String id = request.getParameter("id");
	int password = request.getParameter("password").hashCode();

	Query q = new Query("User")
			.addFilter("id",Query.FilterOperator.EQUAL,id)
			.addFilter("password",Query.FilterOperator.EQUAL,password);
	PreparedQuery pq = datastore.prepare(q);
	if(pq.countEntities()==0){
%>
<center>로그인 실패</center>
<script>setTimeout(function(){
	history.go(-1);
},1000);</script>
<%
}else{
	session.setAttribute("loginid",id);
	response.sendRedirect("/");
}
%>

