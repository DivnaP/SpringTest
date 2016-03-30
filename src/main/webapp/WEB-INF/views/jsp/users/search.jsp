<%@ page session="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">

<jsp:include page="../fragments/header.jsp" />

<div class="container">
	<form method="get" action="/spring-mvc-form/users/searchResult">	
		<label>Enter user ID: </label>
		<input type="text" name="userID" id="userID" placeholder="Enter user id..."> <br>
		<button type="submit" class="btn-lg btn-primary pull-left">Search</button>
	</form>
	<br><br><br>
	
	<c:if test="${not empty user}">Name of user: ${user.name} <br>
	   Email of user: ${user.email}
 	</c:if>
</div>

<jsp:include page="../fragments/footer.jsp" />

</body>
</html>