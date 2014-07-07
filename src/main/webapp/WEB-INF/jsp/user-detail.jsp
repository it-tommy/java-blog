<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layouts/taglib.jsp"%>


<h2>${user.name}</h2>


<br /><br />
<script type="text/javascript">
$(document).ready(function(){
	$('.nav-tabs a:first').tab('show'); // Select first tab
	$('.triggerRemove').click(function(e){
		e.preventDefault();
		$('#modalRemove .removeBtn').attr('href', $(this).attr('href'));
		$('#modalRemove').modal();
	});
});

</script>

<!-- Nav tabs -->
<ul class="nav nav-tabs" role="tablist">
	<c:forEach items="${user.blogs}" var="blog">
		<li><a href="#blog_${blog.id }" data-toggle="tab">${blog.name}</a></li>
	</c:forEach>
</ul>

<!-- Tab panes -->
<div class="tab-content">
<c:forEach items="${user.blogs}" var="blog">
  <div class="tab-pane" id="blog_${blog.id}">
  	<h2>${blog.name}</h2>
	<p>
		<a href='<spring:url value="/blog/remove/${blog.id}.html" />' class="btn btn-danger triggerRemove">remove blog</a>	
		${blog.url}
	</p>

	<table class="table table-bordered table-hover table-striped">
		<thead>
			<tr>
				<th>Title</th>
				<th>Link</th>
			</tr>
		</thead>
		<c:forEach items="${blog.items}" var="item">
			<tr>
				<td>${item.title}</td>
				<td><a href='<spring:url value="${item.link}" />'>${item.link}</a></td>
			</tr>
		</c:forEach>
		<tbody>
			<tr></tr>
		</tbody>

	</table>
  </div>
  </c:forEach>
</div>



<!-- Modal -->
<div class="modal fade" id="modalRemove" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title" id="myModalLabel">Remove blog</h4>
      </div>
      <div class="modal-body">
        <h4>Really remove?</h4>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
        <a href="" class="btn btn-danger removeBtn">Remove</a>
      </div>
    </div>
  </div>
</div>




