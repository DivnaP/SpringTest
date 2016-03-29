<%@ page session="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html lang="en">

<jsp:include page="../fragments/header.jsp" />

<body>

<script>


function chooseSex(){
	
	var choosenSex ;
	 if($('#radioM').is(':checked')) { 	
		 choosenSex =$("#radioM").value; }
	 else{
		 choosenSex =$("#radioF").value;
	 }
	 

	  $.ajax({
          url: '/spring-mvc-form/users/sex',
          data: {
              sex: choosenSex
          /*  extraParam: 'foo' */
          },
          success: function (data) {
              console.log('response=', data);
          }
      });
	
	
}

</script>
	<div class="container">

		<c:if test="${not empty msg}">
			<div class="alert alert-${css} alert-dismissible" role="alert">
				<button type="button" class="close" data-dismiss="alert"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<strong>${msg}</strong>
			</div>
		</c:if>

		<h1>All Users</h1>
		</br>

		<h3>Total number of users is ${countUsers}</h3>
		</br>
 Choose sex:
<label class="radio-inline">

  <input id="radioM" type="radio" name="gender" value="M" onclick="chooseSex()" checked> Male<br>
  <input type="radio" name="gender" value="F" onclick="chooseSex()"> Female<br>
 
</label>
	 <br />
		
		<table class="table table-striped">
			<thead>
				<tr>
					<th>#ID</th>
					<th>Name</th>
					<th>Email</th>
					<th>framework</th>

					<th>Action</th>
					<th>Country</th>
				</tr>
			</thead>

			<c:forEach var="user" items="${users}">
				<tr>
					<td>${user.id}</td>
					<td>${user.name}</td>
					<td>${user.email}</td>
					<td><c:forEach var="framework" items="${user.framework}"
							varStatus="loop">
						${framework}
    					<c:if test="${not loop.last}">,</c:if>
						</c:forEach></td>
					<td><spring:url value="/users/${user.id}" var="userUrl" /> <spring:url
							value="/users/${user.id}/delete" var="deleteUrl" /> <spring:url
							value="/users/${user.id}/update" var="updateUrl" />

						<button class="btn btn-info" onclick="location.href='${userUrl}'">Query</button>
						<button class="btn btn-primary"
							onclick="location.href='${updateUrl}'">Update</button>
						<button class="btn btn-danger"
							onclick="this.disabled=true;post('${deleteUrl}')">Delete</button></td>
					<td>${user.country}</td>
				</tr>
			</c:forEach>

		</table>

	</div>

	<jsp:include page="../fragments/footer.jsp" />

</body>
</html>