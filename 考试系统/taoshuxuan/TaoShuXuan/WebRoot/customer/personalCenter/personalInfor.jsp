<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
<title>无标题文档</title>
<link href="css/taoshuxuan.css" rel="stylesheet" type="text/css" />
<link href="css/personalInfor.css" rel="stylesheet" type="text/css" />
</head>

<body>
<div  class="main_right">
<div id="breadNav">
	<jsp:include page="breadcrumbNavigation.jsp" />
</div>
  <div class="archives_title">
    <h2>编辑个人档案<span class=" gray666 f12 bnone"> (带<span class="red">*</span>号的项目为必填项)</span></h2>
  </div>
  <fieldset class="edit-addr">
    <div id="EditAddress">
      <div class="new_dizhi">
        <table width="100%" cellspacing="3" cellpadding="10" border="0" class="addNewAddr">
          <tbody>
            <tr>
              <td class="lable"><span>*</span> 昵称：</td>
              <td><input type="text" id="nickname" maxlength="20" name="nickname"></td>
            </tr>
            <tr>
              <td class="lable"><span>*</span> 居住地：</td>
              <td><select id="s_province" name="s_province">
                </select>
                <select id="s_city" name="s_city">
                </select>
                <select id="s_county" name="s_county">
                </select>
                <script type="text/javascript" src="js/area.js" ></script> 
                <script type="text/javascript">_init_area();</script> 
                <script type="text/javascript">
var Gid  = document.getElementById ;
var showArea = function(){
	Gid('show').innerHTML = "<h3>" + Gid('s_province').value + " - " + 
							Gid('s_city').value + " - " + 
							Gid('s_county').value + "</h3>"
}
Gid('s_county').setAttribute('onchange','showArea()');
</script></td>
            </tr>
            <tr>
              <td class="lable"><span>*</span> 性别：</td>
              <td colspan="3"><input type="radio" name="sex" value="男"/>
                男
                <input type="radio" name="sex" value="女"/>
                女</td>
            </tr>
            <tr>
              <td class="lable"><span>*</span> 身份：</td>
              <td ><select name="ProvinceID" id="ProvinceID" style="width:194px">
                  <option value="0">--职业--</option>
                  <option value="1">--在校学生--</option>
                  <option value="2">--教师--</option>
                  <option value="3">--上班族--</option>
                  <option value="4">--自由职业--</option>
                </select></td>
            </tr>
            <tr>
              <td class="lable"><span>*</span> 生日：</td>
              <td colspan="3"><input type="text" name="birthday" value="1990-12-30"></td>
            </tr>
            <tr>
              <td class="lable">博客地址：</td>
              <td><input type="text" id="blogAddress" style="width:194px" name="blogAddress"></td>
            </tr>
            <tr>
              <td class="lable">居住状态：</td>
              <td><input type="checkbox" class="checkbox" id="Chk_1" name="Chk_1"/>
                <span class="checkbox_cont">独居</span>
                <input type="checkbox" class="checkbox" id="Chk_2" name="Chk_2"/>
                <span class="checkbox_cont">和伴侣</span>
                <input type="checkbox"  class="checkbox" id="Chk_3" name="Chk_3"/>
                <span class="checkbox_cont">和室友</span>
                <input type="checkbox" class="checkbox" id="Chk_4" name="Chk_4"/>
                <span class="checkbox_cont">和父母</span>
                <input type="checkbox" class="checkbox" id="Chk_5" name="Chk_5"/>
                <span class="checkbox_cont">和孩子</span>
                <input type="checkbox" class="checkbox" id="Chk_6" name="Chk_6"/>
                <span class="checkbox_cont">和宠物</span></td>
            </tr>
            <tr>
              <td class="lable">兴趣爱好：</td>
              <td><textarea  class="hobby" id="hobby" cols="30" rows="2" name="hobby"></textarea></td>
            </tr>
            <tr>
              <td class="lable">喜欢或欣赏的人：</td>
              <td><textarea  class="love_Man" id="love_Man" cols="30" rows="2" name="love_Man"></textarea></td>
            </tr>
            <tr>
              <td><input type="submit" value="保存基本信息"/></td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
  </fieldset>
</div>
</body>
</html>
