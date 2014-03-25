<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="29" bgcolor="#5898C8"><span class="word_white">&nbsp;网站后台管理</span></td>
  </tr>
  <tr>
    <td height="4"></td>
  </tr>
</table>
<table width="100%" height="441" border="0" cellpadding="0" cellspacing="0" class="tableBorder">
  <tr>
      <td width="25%" height="32" align="right" class="tableBorder_B">
    <img src="<%=request.getContextPath() %>/images/m_ico.gif" width="11" height="11" />&nbsp;</td>

    <td height="32" colspan="2" align="left" class="tableBorder_B"><a href="<%=request.getContextPath() %>/admin/admin_luTiAdd.jsp">录题</a></td>
  </tr>
  <tr>
      <td width="25%" height="32" align="right" class="tableBorder_B">
    <img src="<%=request.getContextPath() %>/images/m_ico.gif" width="11" height="11" />&nbsp;</td>
    <td height="32" colspan="2" align="left" class="tableBorder_B"><a href="showQuestions_by_page.do">题库管理</a></td>
  </tr>
  <tr>
      <td width="25%" height="32" align="right" class="tableBorder_B">
    <img src="<%=request.getContextPath() %>/images/m_ico.gif" width="11" height="11" />&nbsp;</td>
    <td height="32" colspan="2" align="left" class="tableBorder_B"><a href="<%=request.getContextPath() %>/admin/admin_taoTiAdd.jsp">安排考试</a></td>
  </tr>
   <tr>
      <td width="25%" height="32" align="right" class="tableBorder_B">
    <img src="<%=request.getContextPath() %>/images/m_ico.gif" width="11" height="11" />&nbsp;</td>
    <td height="32" colspan="2" align="left" class="tableBorder_B"><a href="showExam_by_page.do">考试管理</a></td>
  </tr>
  <tr>
      <td width="25%" height="32" align="right" class="tableBorder_B">
    <img src="<%=request.getContextPath() %>/images/m_ico.gif" width="11" height="11" />&nbsp;</td>
    <td height="32" colspan="2" align="left" class="tableBorder_B"><a href="showMyClass_by_page.do">班级信息管理</a></td>
  </tr>
    <tr>
      <td width="25%" height="32" align="right" class="tableBorder_B">
    <img src="<%=request.getContextPath() %>/images/m_ico.gif" width="11" height="11" />&nbsp;</td>
    <td height="32" colspan="2" align="left" class="tableBorder_B"><a href="showCourse_by_page.do">科目管理</a></td>
  </tr>
  <tr>
      <td width="25%" height="32" align="right" class="tableBorder_B">
    <img src="<%=request.getContextPath() %>/images/m_ico.gif" width="11" height="11" />&nbsp;</td>
    <td height="32" colspan="2" align="left" class="tableBorder_B"><a href="showStudent_by_page.do">学生信息管理</a></td>
  </tr>
  <tr>
      <td width="25%" height="32" align="right" class="tableBorder_B">
    <img src="<%=request.getContextPath() %>/images/m_ico.gif" width="11" height="11" />&nbsp;</td>
    <td height="32" colspan="2" align="left" class="tableBorder_B"><a href="showTeacher_by_page.do">教师信息管理</a></td>
  </tr>
  <tr>
      <td width="25%" height="32" align="right" class="tableBorder_B">
    <img src="<%=request.getContextPath() %>/images/m_ico.gif" width="11" height="11" />&nbsp;</td>
    <td height="32" colspan="2" align="left" class="tableBorder_B"><a href="<%=request.getContextPath() %>/admin/admin_pwd_Modify.jsp">修改登录密码</a></td>
  </tr>
  <tr>
    <td height="217" align="right">&nbsp;</td>
    <td height="217" colspan="2" align="left">&nbsp;</td>
  </tr>
</table>
