<%@page import="com.google.appengine.api.datastore.*"%>
<%
	DatastoreService datastore= DatastoreServiceFactory.getDatastoreService();
	Entity user = new Entity("User");
	user.setProperty("id",request.getParameter("id"));
	user.setProperty("email",request.getParameter("email"));
	user.setProperty("password",request.getParameter("password").hashCode());
	datastore.put(user);

	session.setAttribute("loginid",request.getParameter("id"));
	response.sendRedirect("/");
%>