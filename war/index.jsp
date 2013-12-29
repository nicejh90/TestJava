<%@page contentType="text/html;charset=utf-8" %>
<%@page import="java.util.*" %>
<%@page import="com.google.appengine.api.datastore.*"%>
	

	<jsp:include page="header.jsp" flush="false"/>

    <div class="container">
	<%

	String mpage = request.getParameter("page");
	int curPage;
	if(mpage==null)
	{curPage=1;}else{curPage=Integer.parseInt(mpage);}
	int offset=(curPage-1)*3;


	DatastoreService datastore= DatastoreServiceFactory.getDatastoreService();
	Query q = new Query("Post");
	q.addSort("date",Query.SortDirection.DESCENDING);
	List<Entity> posts = datastore.prepare(q).asList(FetchOptions.Builder.withLimit(3).offset(offset));

	for(Entity post :posts){
		String id=(String) post.getProperty("id");
		String title = (String) post.getProperty("title");
		String content=(String) post.getProperty("content");
		String key = String.valueOf(post.getKey().getId());
		Date date = (Date) post.getProperty("date");
	%>

		<div class='post'>
			<h2><a href="post.jsp?no=<%=key %>"><%=title %></a></h2>
			<p><%=content%></p>
			<p>작성자 : <%=id%></p>
			<p>작성시간 : <%=date%></p>
		</div><hr>
	<%
	}
	%>

	<%
	List<Entity> allposts = datastore.prepare(q).asList(FetchOptions.Builder.withDefaults());
	int totalCount = allposts.size();
	int pageSize=3;
	int totalPage = (int)Math.ceil((double)totalCount/pageSize);
	%>
	
	<hr>
		<ul class="pagination">
			<%
				if(curPage>1)
					out.println("<li><a href='?page="+(curPage-1)+"'>&larr; 이전 </a></li>");
				for(int i=1;i<=totalPage;i++){
					if(i==curPage){
						out.println("<li class='active'><a href='?page="+i+"'>"+i+"</a></li>");
					}else{
						out.println("<li><a href='?page="+i+"'>"+i+"</a></li>");
					}
				}
				if(curPage<totalPage)
					out.println("<li><a href='?page="+(curPage+1)+"'>다음 &rarr;</a></li>");
			%>
		</ul>

    </div><!-- /.container -->

	
	<jsp:include page="footer.jsp" flush="false"/>
    