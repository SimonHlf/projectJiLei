<%@page pageEncoding="utf-8" isErrorPage="true" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
${exception}<br>
<pre>
    <c:forEach var="trace" items="${exception.stackTrace}">
        ${trace}
    </c:forEach>
</pre>