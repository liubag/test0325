
var msg=new Array();

msg[0]="<span>请填写您常用的Email地址</span><span>方便您接收验证邮件、找回密码</span>";

msg[1]="请填写您的Email。";

msg[2]="Email格式错误，请重新填写。";

msg[3]="<span>此Email地址已注册，请更换其它地址</span>";

msg[4]="请设置您的昵称";

msg[5]="格式错误。";

msg[6]="<span>该昵称已被占用</span><span>建议您换一个试试</span>";

msg[7]="<span>密码可使用字母加数字或符号的组合</span><span>长度6-20个字符</span>";              

msg[8]="请设置您的密码";

msg[9]="<span>格式错误，请使用字母加数字</span><span>或符号的组合，6-20个字符</span>";              

msg[10]="请再次输入您设置的密码";

msg[11]="<span>两次输入的密码不一致</span><span>请重新输入</span>";

msg[12]="请输入下方图片中字符";

msg[13]="请输入下方图片中字符";

msg[14]="验证码输入有误，请重新输入";

msg[15]="<span>昵称可由大小写英文字母、汉字、数字组成</span><span>长度4-20个字符(1个汉字等于2个字符)</span></span>";

msg[16]="请输入下方图片中字符";

msg[17]="验证码错误，请重新填写";

msg[18]="请再次输入您设置的密码";

msg[19]="请输入您的手机号码";

msg[20]="请填写手机号码";

msg[21]="<span>此手机号码已注册，请更换其它号码，或<a href=\"Signin.aspx\" name=\"mobile_login _link\">用该号码登录</a></span>";

msg[22]="<span>手机号码格式错误</span><span>应为11位数字</span>";

msg[23]="<span>您输入密码结构比较简单，建议您更换更加复杂的密码。</span>";

String.prototype.trim=function(){return this.replace(/(\s*$)|(^\s*)/g, '');};

function $(id){return document.getElementById(id);};

function $F(id){var o=$(id);if(o==null) return null;return o.value.trim();};



function Ajax(url)

{

    var m_xmlReq=null;

    if(window.ActiveXObject)

    {

        try 

        {

            m_xmlReq = new ActiveXObject('Msxml2.XMLHTTP'); 

        }

        catch(e)

        {

            try{m_xmlReq = new ActiveXObject('Microsoft.XMLHTTP');}catch(e){}

        }

    }

    else if(window.XMLHttpRequest)

    {

        m_xmlReq = new XMLHttpRequest();

    }

    

    this.post=function(d)

    {

        if(!m_xmlReq)  return;

        m_xmlReq.open('POST',url,false);

        m_xmlReq.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded;charset=utf-8');

        m_xmlReq.send(d);

        return eval(m_xmlReq.responseText);

    }

}



function show_vcode(img_id)

{

//    ddvcode.show_vcode(img_id);

    $(img_id).src='p/tmp_proxy.aspx?t='+new Date().getTime();

//    $('imgVcode').src='p/show_vcode_new.aspx?t='+new Date().getTime();



}







var checkEmail=false;

var checkNickname=false;

var checkpassword=false;

var checkRepassword=false;

var checkmobile=false;

var VerifyCode=false;

var txtClientRegister=true;

function txtEmail_check()

{



    var email = $F('txtEmail');

    $('emailValidMsg').className="login_form_hint";

    $('emailValidMsg').style.display="inline";

    $('emailValidMsg').innerHTML=msg[0];

    $('email_ok').style.display="none";

    checkEmail=false;

    if(email=='')

    {

        $('emailValidMsg').className="login_form_wrong";

        $('emailValidMsg').innerHTML=msg[1];

        $('input_email').className="wrong";

        

        return false;

    }

    if(!/^\d+$/.test(email)){

        if(email.length>40 || !/^[.\-_a-zA-Z0-9]+@[\-_a-zA-Z0-9]+\.[a-zA-Z0-9]/.test(email))

        {

            $('emailValidMsg').className="login_form_wrong";

            $('emailValidMsg').innerHTML=msg[2];

            $('input_email').className="wrong";

            

            return false;

        }

        if(/[ ]/.test(email)){

            $('emailValidMsg').className="login_form_wrong";

            $('emailValidMsg').innerHTML=msg[2];

            $('input_email').className="wrong";

             return false;

        }        

        var email_checker_ajax = new Ajax("email_check.do");

        

        if(email_checker_ajax.post('customer.email='+email))

        {

            $('emailValidMsg').className="login_form_wrong";

            $('emailValidMsg').innerHTML=msg[3].replace("{#Email#}",email);

            $('input_email').className="wrong";

            

            return false;

        }

        

    }else{

       if(!/^1[3,4,5,8][0-9]{9}$/.test(email))

        {

            $('emailValidMsg').className="login_form_wrong";

            $('emailValidMsg').innerHTML=msg[22];

            $('input_email').className="wrong";

            

            

            return false;

        }

        var mobile_checker_ajax = new Ajax("p/mobile_checker.aspx");    

        if(mobile_checker_ajax.post('mobile='+email))

        {            

            $('emailValidMsg').className="login_form_wrong";

            $('emailValidMsg').innerHTML=msg[21];            

            $('input_email').className="wrong";            

            return false;

        }

    }



    

    $('emailValidMsg').style.display="none";

    $('email_ok').style.display="inline";

    $('input_email').className="";

    checkEmail=true;

    

    return true;

}

function txtNickName_check()

{

    return true;

    var nickname = $F('txtNickName');

    $('nickNameValidMsg').style.display="inline";

    $('nickname_ok').style.display="none";

    checkNickname=false;

    

    

    if(nickname=='')

    {

        $('nickNameValidMsg').className="login_form_wrong";

        $('nickNameValidMsg').innerHTML=msg[4];

        $('input_nickname').className="wrong";

        

        return false;

    }

    

    if(!/^[A-Za-z0-9\u4e00-\u9fa5]{2,20}$/.test(nickname))

    {

        $('nickNameValidMsg').className="login_form_wrong";

        $('nickNameValidMsg').innerHTML=msg[5];

        $('input_nickname').className="wrong";

        

        

        return false;

    }

    

    if(calculate_byte(nickname)<4||calculate_byte(nickname)>20){

       

        $('nickNameValidMsg').className="login_form_wrong";

        $('nickNameValidMsg').innerHTML=msg[5];

        $('input_nickname').className="wrong";

        return false;



    }

    

    

    



    

    var nickname_checker_ajax = new Ajax("p/nickname_checker.aspx");

    if(nickname_checker_ajax.post('nickname='+nickname))

    {

        

        $('nickNameValidMsg').className="login_form_wrong";

        $('nickNameValidMsg').innerHTML=msg[6];

        

        $('input_nickname').className="wrong";

        

        return false;

    }

    

    $('nickNameValidMsg').style.display="none";    

    $('nickNameValidMsg').innerHTML='';

    $('nickname_ok').style.display="inline";

    $('input_nickname').className="";

    checkNickname=true;

    

    return true;

}





function txtmobile_check()

{    

    var mobile = $F('txtMobile');

    $('mobileValidMsg').style.display="inline";

    $('mobile_ok').style.display="none";

    checkmobile=false;

    

    

    if(mobile=='')

    {

        $('mobileValidMsg').className="login_form_wrong";

        $('mobileValidMsg').innerHTML=msg[20];

        $('input_mobile').className="wrong";

        

        return false;

    }

    

    if(!/^1[3,4,5,8][0-9]{9}$/.test(mobile))

    {

        $('mobileValidMsg').className="login_form_wrong";

        $('mobileValidMsg').innerHTML=msg[22];

        $('input_mobile').className="wrong";

        

        

        return false;

    }

    

    var mobile_checker_ajax = new Ajax("p/mobile_checker.aspx");    

    if(mobile_checker_ajax.post('mobile='+mobile))

    {

        

        $('mobileValidMsg').className="login_form_wrong";

        $('mobileValidMsg').innerHTML=msg[21];

        

        $('input_mobile').className="wrong";

        

        return false;

    }

    

    $('mobileValidMsg').style.display="none";    

    $('mobileValidMsg').innerHTML='';

    $('mobile_ok').style.display="inline";

    $('input_mobile').className="";

    checkmobile=true;

    

    return true;

}





function calculate_byte( sTargetStr ) 

{

   var sTmpStr, sTmpChar;

   var nOriginLen = 0;

   var nStrLength = 0;

         

   sTmpStr = new String(sTargetStr);

   nOriginLen = sTmpStr.length;



   for ( var i=0 ; i < nOriginLen ; i++ ) 

   {

      sTmpChar = sTmpStr.charAt(i);



      if (escape(sTmpChar).length > 4) 

   {

           nStrLength += 2;

      } 

   else if(sTmpChar!='\r') 

   {

           nStrLength ++;

      }

   }        

return nStrLength;         

}



function txtPassword_strong_check() {

    var password = $F('txtPassword');

    if(password.length == 0) {

        $('span_intensity_check').style.display="none";

        return ;

    }

    if(password.length < 6) {

        $('span_intensity_check').innerHTML='强度：弱<span class="strip_w"><span><span></span></span></span>强';

        $('passwordValidMsg').style.display="none";

        $('span_intensity_check').style.display="inline";

        return ;

    }

    var chenum = checkStrong();

    if(chenum == 0) {

        $('span_intensity_check').style.display="none";

        return ;

    } else if(chenum == 1 ) {

        $('span_intensity_check').innerHTML='强度：弱<span class="strip_w"><span><span></span></span></span>强';

    } else if(chenum == 2) {

        $('span_intensity_check').innerHTML='强度：弱<span class="strip_w"><span><span class="strip_middle"></span></span></span>强';

    } else if(chenum >= 3) {

        $('span_intensity_check').innerHTML='强度：弱<span class="strip_w"><span><span class="strip_strong"></span></span></span>强';

    }

    $('passwordValidMsg').style.display="none";

    $('span_intensity_check').style.display="inline";



}



function txtPassword_check()

{

    var password = $F('txtPassword');

    $('span_intensity_check').style.display="none";

    $('span_intensity_check').innerHTML='';

    $('passwordValidMsg').style.display="inline";

    $('passwordValidMsg').innerHTML=msg[7];

    $('password_ok').style.display="none";

    checkpassword=false;;

    if(password=='')

    {

        $('passwordValidMsg').className="login_form_wrong";

        $('passwordValidMsg').innerHTML=msg[8];

        $('input_password').className="wrong";

        return false;

    }

    

    if(password.length<6||password.length>20){

        $('passwordValidMsg').className="login_form_wrong";

        $('passwordValidMsg').innerHTML=msg[9];

        $('input_password').className="wrong";

        return false;    

    }

       

    if(!/^\S{1,20}$/.test(password))

    {

       

        $('passwordValidMsg').className="login_form_wrong";

        $('passwordValidMsg').innerHTML=msg[9];

        $('input_password').className="wrong";

        return false;

    }

    

    $('passwordValidMsg').style.display="none";    

    $('passwordValidMsg').innerHTML='';

//    $('password_ok').style.display="inline";



    var chenum = checkStrong();

    if(chenum == 1) {

        

        $('span_intensity_check').innerHTML='<span class="tips_txt">密码强度：<i>弱</i></span>';

    } else if(chenum == 2) {

        $('span_intensity_check').innerHTML='<span class="tips_txt">密码强度：<i class="tips_y">中</i></span>';

    } else if(chenum >= 3) {

        $('span_intensity_check').innerHTML='<span class="tips_txt">密码强度：<i class="tips_g">强</i></span>';

    }



    $('span_intensity_check').style.display="inline";

    $('input_password').className="";

    checkpassword=true;

    

//    if(checkStrong() <= 1) {

//        $('passwordValidMsg').className="login_form_wrong";

//        $('passwordValidMsg').innerHTML=msg[23];

//        $('input_password').className="wrong";

//    } else {

//        $('passwordValidMsg').style.display="none";    

//        $('passwordValidMsg').innerHTML='';

//        $('password_ok').style.display="inline";

//        $('input_password').className="";

//        checkpassword=true;

//        

//    }

//    

    return true;

    

}

function txtRepeatPass_check()

{

    var rep_password = $F('txtRepeatPass');

    $('repeatPassValidMsg').style.display="inline";

    $('repeatPassValidMsg').innerHTML='';

     $('repassword_ok').style.display="none";

     checkRepassword=false;

    if(rep_password=='')

    {

        $('repeatPassValidMsg').style.display="inline";

        $('repeatPassValidMsg').className="login_form_wrong";    

        $('repeatPassValidMsg').innerHTML=msg[18];

        $('input_repassword').className="wrong";

        return false;

    }

    

    if(rep_password!=$F('txtPassword'))

    {

        $('repeatPassValidMsg').style.display="inline";

        $('repeatPassValidMsg').className="login_form_wrong";

        $('repeatPassValidMsg').innerHTML=msg[11];

        $('input_repassword').className="wrong";

        return false;

    }

    if(txtPassword_check()){

    $('repeatPassValidMsg').style.display="none";    

    $('repeatPassValidMsg').innerHTML='';

    $('repassword_ok').style.display="inline";

    $('input_repassword').className="";    

    checkRepassword=true;

    }else{

    $('repeatPassValidMsg').style.display="none";

    $('repeatPassValidMsg').innerHTML='';

    $('repassword_ok').style.display="none";

    $('input_repassword').className="";     

    }

    

    return true;

}

var ran1;
var ran2;
var ran3;
var ran4; 
function randomPic(width,height){
 var img = document.getElementById("img1");
 ran1 = getNum(Math.floor(Math.random()*36)); 
 ran2 = getNum(Math.floor(Math.random()*36)); 
 ran3 = getNum(Math.floor(Math.random()*36));  
 ran4 = getNum(Math.floor(Math.random()*36));
 img.src = "http://localhost:8080/TaoShuXuan/randomGraphics2?width=" +width+"&height="+height+"&r1="+ran1+"&r2="+ran2+"&r3="+ran3+"&r4="+ran4;
}

function getNum(ran){
var num;
switch(ran){
			case 0:
			case 1:
			case 2:
			case 3:
			case 4:
			case 5:
			case 6:
			case 7:
			case 8:
			case 9: num = ran;break;
			case 10: num = "A";break;
			case 11: num = "B";break;
			case 12: num = "C";break;
			case 13: num = "D";break;
			case 14: num = "E";break;
			case 15: num = "F";break;
			case 16: num = "G";break;
			case 17: num = "H";break;
			case 18: num = "I";break;
			case 19: num = "J";break;
			case 20: num = "K";break;
			case 21: num = "L";break;
			case 22: num = "M";break;
			case 23: num = "N";break;
			case 24: num = "O";break;
			case 25: num = "P";break;
			case 26: num = "Q";break;
			case 27: num = "R";break;
			case 28: num = "S";break;
			case 29: num = "T";break;
			case 30: num = "U";break;
			case 31: num = "V";break;
			case 32: num = "W";break;
			case 33: num = "X";break;
			case 34: num = "Y";break;
			case 35: num = "Z";break;
		}
return num; 
}

function check(){
	 var num = document.getElementById("randomNum").value;
	 var num2 = ran1+ran2+ran3+ran4;
	 if(num.toUpperCase() == num2){
	   return true;
	 }else{
	   randomPic(100,20);
	   document.getElementById("randomNum").value = "";
	   return false;
	 }
}

function randomNum_check()

{

 

    var vcode = $F('randomNum');

    $('vcodeValidMsg').style.display="inline";

    $('vcodeValidMsg').innerHTML=msg[16];

    $('vcode_ok').style.display="none";

    VerifyCode=false;



    if(vcode==''||vcode=='不区分大小写'){

        $('vcodeValidMsg').className="login_form_wrong";

        $('vcodeValidMsg').innerHTML=msg[13];

        $('input_vcode').className="wrong";

        return false;    

    }

   

    if(vcode==''|| !/\w{4}/.test(vcode))

    {

        $('vcodeValidMsg').className="login_form_wrong";

        $('vcodeValidMsg').innerHTML=msg[14];

        $('input_vcode').className="wrong";

        return false;

    }

    

    

    if(!check())

    {

        $('vcodeValidMsg').className="login_form_wrong";

        $('vcodeValidMsg').innerHTML=msg[14];

        $('input_vcode').className="wrong";

        $('randomNum').value='';

        show_vcode('imgVcode');

        return false;

    }

    $('vcode_ok').style.display="inline";

    $('vcodeValidMsg').style.display="none";    

    $('vcodeValidMsg').innerHTML='';

    $('input_vcode').className="";

    VerifyCode=true;

    

    return true;

}

function showRegister(c)

{

    $('btnClientRegister').style.display=c.checked?'none':'inline';

    txtClientRegister=c.checked;

    //Check_Submit_class();

}





function btnRegister_Click()

{

    if(/^1[3,4,5,8][0-9]{9}$/.test($F('txtEmail'))){

    
		
        if(txtEmail_check() &&  txtPassword_check() && txtRepeatPass_check() && randomNum_check() && Check_submit())

        {     

            $('register_form').action='';

            $('register_form').submit();

            return true;

        }

    }

    else{    

        if(txtEmail_check()&& txtPassword_check() && txtRepeatPass_check() && randomNum_check() && Check_submit())

        {        

            $('btnRegister').click();

            return true;

        }

    }

    return false;

}





function Check_submit(){

    if(txtClientRegister)

        return true;

    else

        return false;

}





function check_email_focus(){



    $('email_ok').style.display="none";

    $('input_email').className="hint";

    $('emailValidMsg').className="login_form_hint";

    $('emailValidMsg').style.display="block";

    $('emailValidMsg').innerHTML=msg[0];



}



function check_nickname_focus(){

     $('nickname_ok').style.display="none";

     $('input_nickname').className="hint";

    $('nickNameValidMsg').className="login_form_hint";

    $('nickNameValidMsg').style.display="block";

    $('nickNameValidMsg').innerHTML=msg[15];



}



function check_mobile_focus(){

     $('mobile_ok').style.display="none";

     $('input_mobile').className="hint";

    $('mobileValidMsg').className="login_form_hint";

    $('mobileValidMsg').style.display="block";

    $('mobileValidMsg').innerHTML=msg[19];



}



function check_password_focus(){

     $('password_ok').style.display="none";

     $('span_intensity_check').style.display="none";

     $('input_password').className="hint";

    $('passwordValidMsg').className="login_form_hint";

    $('passwordValidMsg').style.display="block";

    $('passwordValidMsg').innerHTML=msg[7];



}



function check_repassword_focus(){

    $('repassword_ok').style.display="none";

    $('input_repassword').className="hint";

    $('repeatPassValidMsg').className="login_form_hint";

    $('repeatPassValidMsg').style.display="block";

    $('repeatPassValidMsg').innerHTML=msg[10];

}



function check_VerifyCode_focus(){

    $('vcode_ok').style.display="none";

    $('input_vcode').className="hint";

    $('vcodeValidMsg').className="login_form_hint";

    $('vcodeValidMsg').style.display="block";

    $('vcodeValidMsg').innerHTML=msg[16];



}



function Check_Submit_class(){



    if(!(txtClientRegister)){

    $('click_submir').className="login_tj change_gray";

    $('click_submir').onmouseover=function(){return};

    $('click_submir').onmouseout=function(){return};

    }else{    

    $('click_submir').className="login_tj";

    $('click_submir').onmouseover=function(){this.className='login_tj login_tj_over';};

    $('click_submir').onmouseout=function(){this.className='login_tj';};

    }

}

function show_error(err_code){



    switch(err_code){

        case 0:        

        break;

        case 1:

        $('vcodeValidMsg').style.display="block";

        $('vcodeValidMsg').className="login_form_wrong";

        $('vcodeValidMsg').innerHTML=msg[17];

        $('input_vcode').className="wrong";

        $('randomNum').value='';

        break;

        case 2:

        $('emailValidMsg').className="login_form_wrong";

        $('emailValidMsg').style.display="block";

        $('emailValidMsg').innerHTML=msg[3];

        $('input_email').className="wrong";     

        break;

        default:

        break;

    }

}



    function CheckdoSubmit(e){

       var ev = window.event || e;

        if(ev.keyCode == 13)

        {

            btnRegister_Click();

        }

    }

    

    

    function btn_submit_click(){

        var email = $F('txtEmail');



        

        if(email=='')

        {   

            alert("请填写Email地址");

            $("txtEmail").focus();   

            return false;

        }

        

        if(email.length>40 || !/^[.\-_a-zA-Z0-9]+@[\-_a-zA-Z0-9]+\.[a-zA-Z0-9]/.test(email))

        {       

            alert("Email格式错误，请重新填写！");

            $("txtEmail").focus();   

            return false;

        }

        if(/[ ]/.test(email)){

            alert("Email格式错误，请重新填写！");

            $("txtEmail").focus();   

            return false;

        }

        

        var email_checker_ajax = new Ajax("email_check.do");

        

        if(email_checker_ajax.post('customer.email='+email))

        {

            alert("此Email地址已注册，请更换其它地址！");

            $("txtEmail").focus();   

            return false;

        }

            $("save_email").click();

    }

    

    function checkStrong(){

        var sPW = $F('txtPassword');

        if (sPW.length<1)  

            return 0;

        Modes=0;  

        for (i=0;i<sPW.length;i++){  

           Modes|=Evaluate(sPW.charCodeAt(i));  

        }  

        var num = bitTotal(Modes);

        return num;

    }

    function Evaluate(character) {

        if (character >= 48 && character <= 57)

            return 1;  

        if (character >= 65 && character <= 90)

            return 2;  

        if (character >= 95 && character <= 122)

            return 4;  

        else  

            return 8;

    }  

            

    function bitTotal(num){  

        modes=0;  

        for (i=0;i<4;i++){  

            if (num & 1) modes++;  

            num>>>=1;  

        }  

        return modes;  

    }  