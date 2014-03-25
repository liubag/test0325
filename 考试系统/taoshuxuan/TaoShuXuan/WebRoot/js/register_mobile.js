var msg=new Array();
msg[0]="";
msg[1]="手机号码不能为空";
msg[2]="请输入正确号码";
msg[3]="此手机号已经注册";
msg[4]="输入图片中的字符";
msg[5]="验证码输入有误";
msg[6]="请填写短信中的校验码";
msg[7]="请输入正确的校验码";
msg[8]="此手机号尚未绑定";
msg[9]="新手机号与旧手机号相同";
msg[10]="旧手机号错误";


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
//    $('imgVcode').src='p/show_vcode.aspx?t='+new Date().getTime();
}


function show_error(err_code){

    switch(err_code){
        case 0:                
        break;
        case 1:
            alert("注册失败，请重新注册");                
            location.href='register.aspx?reg_type=1';
        break;
        case 2:
            $('Mobile_Vcode_error').innerHTML="校验码错误！";
            $('Mobile_Vcode_error').style.display="";
        break;        
        default:
        break;
    }
}

function showChangeMobilephone(obj){
    $('txt_mobile_phone').value = "";
    $('mobile_phone_error').style.display = 'none';
    $('txt_mobile_phone_vcode').value = "";
    $('mobile_phone_vcode_error').style.display = 'none';
    show_vcode('imgVcode');
    divleft=getposOffset_top(obj,'left');
    divtop=getposOffset_top(obj,'top');
    $('Change_mobile_div').style.left=(divleft-250)+'px';
    $('Change_mobile_div').style.top=(divtop-100)+'px';
    $('Change_mobile_div').style.display='block';
    
}

function hideChangeMobilephone(){
    $('Change_mobile_div').style.display='none';
}

var checkphone=false;
var VerifyCode=false;

function txt_mobile_phone_check()
{

    var phone = $F('txt_mobile_phone');    
    $('mobile_phone_error').style.display="inline";
    $('mobile_phone_error').innerHTML="";
    $('input_mobile_phone').firstChild.nextSibling.className="login_form_input";
    checkphone=false;
    if(phone=='')
    {
        $('mobile_phone_error').className="mobile_login_form_wrong";
        $('mobile_phone_error').innerHTML=msg[1];
        $('input_mobile_phone').className="wrong";
        
        return false;
    }
    
    if(phone.length!=11 || !/^[0-9]/.test(phone))
    {
        $('mobile_phone_error').className="mobile_login_form_wrong";
        $('mobile_phone_error').innerHTML=msg[2];
        $('input_mobile_phone').className="wrong";
        
        return false;
    }
    if(phone.substr(0,2)!="13"&&phone.substr(0,2)!="15"&&phone.substr(0,2)!="18"){
        $('mobile_phone_error').className="mobile_login_form_wrong";
        $('mobile_phone_error').innerHTML=msg[2];
        $('input_mobile_phone').className="wrong";
        
         return false;
    }

    
    var email_checker_ajax = new Ajax("p/mobile_phone_checker.aspx");
    
    if(email_checker_ajax.post('phone='+phone))
    {
        $('mobile_phone_error').className="mobile_login_form_wrong";
        $('mobile_phone_error').innerHTML=msg[3];
        $('input_mobile_phone').className="wrong";
        
        return false;
    }
    

    
    $('mobile_phone_error').innerHTML="";
    $('mobile_phone_error').className="login_form_ok";
    $('input_mobile_phone').className="";
    
    checkphone=true;
    
    return true;
}

function txt_mobile_phone_vcode_check(){
        var vcode = $F('txt_mobile_phone_vcode');
    $('mobile_phone_vcode_error').style.display="inline";
    $('mobile_phone_vcode_error').innerHTML="";
    //$('input_mobile_vcode_phone').firstChild.nextSibling.className="login_form_input";
    
    VerifyCode=false;

    if(vcode==''){
        $('mobile_phone_vcode_error').className="mobile_login_form_wrong";
        $('mobile_phone_vcode_error').innerHTML=msg[4];
        $('input_mobile_vcode_phone').className="wrong";
        return false;    
    }
    
    if(vcode==''||!/(\W{2}|\W{4}|\w{2}|\w{4})/.test(vcode))
    {
        $('mobile_phone_vcode_error').className="mobile_login_form_wrong";
        $('mobile_phone_vcode_error').innerHTML=msg[5];
        $('input_mobile_vcode_phone').className="wrong";
        return false;
    }
    
    var vcode_checker_ajax = new Ajax("p/vcode_checker.aspx");
    if(!vcode_checker_ajax.post('vcode='+vcode))
    {
        $('mobile_phone_vcode_error').className="mobile_login_form_wrong";
        $('mobile_phone_vcode_error').innerHTML=msg[5];
        $('input_mobile_vcode_phone').className="wrong";
        $('txt_mobile_phone_vcode').value='';
        return false;
    }
    $('mobile_phone_vcode_error').innerHTML="";
    $('mobile_phone_vcode_error').className="login_form_ok";
    $('input_mobile_phone').className="";
    VerifyCode=true;
    
    return true;
}



function ChangephoneReSend(){
         
        if(txt_mobile_phone_check()&& txt_mobile_phone_vcode_check())
        {  
           var sendsms_ajax = new Ajax("p/sendsms_vcode.aspx");           
                if(!sendsms_ajax.post('change_reg_mphone=1&vcode_type=5&phonenum='+$F("txt_mobile_phone")+"&vcode="+$F("txt_mobile_phone_vcode"))){
                    alert("还没有收到短信，请明天再试！");
                }else{
                    $('show_txt_phone_num').innerHTML=$F("txt_mobile_phone");
                    $('show_txt_phone_num1').innerHTML=$F("txt_mobile_phone");
                    $('txtMobile').value=$F("txt_mobile_phone");                    
                    hideChangeMobilephone();
                    miao=120;                    
                }
            return true;
        }
        return false;
}