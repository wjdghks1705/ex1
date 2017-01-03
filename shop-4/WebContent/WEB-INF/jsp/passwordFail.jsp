<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/WEB-INF/jsp/passwordFail.jsp --%>    
<script>
  alert("비밀번호 오류입니다. 삭제 실패.");
  location.href="detail.shop?num=${param.num}"
</script>