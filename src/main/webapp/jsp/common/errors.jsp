<!-- /webapp/WEB-INF/jsp/common/error.jsp -->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%-- Affichage des erreurs --%>
<c:if test="${not empty errorMessage}">
    <div class="error-alert">
        <p>${errorMessage}</p>
    </div>
</c:if>
