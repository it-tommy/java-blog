<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layouts/taglib.jsp"%>

<h3>Latest news from the Java world!</h3>

	<table class="table table-bordered table-hover table-striped">
		<thead>
			<tr>
				<th>date</th>
				<th>item</th>
			</tr>
		</thead>
		<c:forEach items="${items}" var="item">
			<tr>			
				<td>
					<c:out value="${item.publishDate}" />
					<c:out value="${item.blog.name}" />
				</td>
				<td>
					<strong>
						<a href='<c:out value="${item.link}" />' target="_blank">
							<c:out value="${item.title}" />
						</a>
					</strong>
					<br />
					${item.description}
				</td>
			</tr>
		</c:forEach>
		<tbody>
			<tr></tr>
		</tbody>

	</table>
