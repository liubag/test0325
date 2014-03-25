/**常用验证规则：
 *  required：值不可以为空
 * length[0,100] ：文字允许长度
 * confirm[fieldID] ：匹配其他的表单元素的值，fieldID就是其他表单元素的id，这个主要用于再次确认密码
 * telephone ：数据格式要求符合电话格式
 * email ： 数据格式要求符合email 格式
 * onlyNumber ：只允许输入数字
 * noSpecialCaracters ：不允许出现特殊字符
 * onlyLetter ： 只能是字母
 * date ：必须符合日期格式YYYY-MM-DD
 */

(function($) {
	 $(".formError").live("click", function() {
					 $(this).fadeOut(150, function() {
						 // remove prompt once invisible
						 $(this).parent('.formErrorOuter').remove();
						 $(this).remove();
					 });
				 });
    $.fn.validationEngineLanguage = function() {
    };
    $.validationEngineLanguage = {
        newLang: function() {
            $.validationEngineLanguage.allRules = {"required":{               // Add your regex rules here, you can take telephone as an example
                "regex":"none",
                "alertText":"* 该项为必填项",
                "alertTextCheckboxMultiple":"* 请选择一个单选框.",
                "alertTextCheckboxe":"* 请选择一个复选框."},
                "length":{
                    "regex":"none",
                    "alertText":"* 长度必须在 ",
                    "alertText2":" 至 ",
                    "alertText3": " 之间."},
                "maxCheckbox":{
                    "regex":"none",
                    "alertText":"* 最多选择 ",//官方文档这里有问题
                    "alertText2":" 项."},
                "minCheckbox":{
                    "regex":"none",
                    "alertText":"* 至少选择 ",
                    "alertText2":" 项."},
                "confirm":{
                    "regex":"none",
                    "alertText":"* 两次输入不一致,请重新输入."},
                //从telephone往下，除了validate2fields，都需要写成如：custom[telephone]的样式
                //custom与funcCall的差别在于，custom是使用正则表达式进行验证即可，而funcCall需要写js函数来进行验证。
               "datelogic":{
    					"nname":"datelogic",
    					"alertText":"* 当前时间选择不合理"
					},
                "telephone":{
                    "regex":"/^(0[0-9]{2,3}\-)?([2-9][0-9]{6,7})+(\-[0-9]{1,4})?$/",
                    "alertText":"* 请输入有效的电话号码,如:010-29292929."},
                "mobilephone":{
                    "regex":"/(^0?[1][358][0-9]{9}$)/",
                    "alertText":"* 请输入有效的手机号码."},
                "email":{
                    "regex":"/^[a-zA-Z0-9_\.\-]+\@([a-zA-Z0-9\-]+\.)+[a-zA-Z0-9]{2,4}$/",
                    "alertText":"* 请输入有效的邮件地址."},
                "date":{
                    "regex":"/^(([0-9]{3}[1-9]|[0-9]{2}[1-9][0-9]{1}|[0-9]{1}[1-9][0-9]{2}|[1-9][0-9]{3})-(((0[13578]|1[02])-(0[1-9]|[12][0-9]|3[01]))|((0[469]|11)-(0[1-9]|[12][0-9]|30))|(02-(0[1-9]|[1][0-9]|2[0-8]))))|((([0-9]{2})(0[48]|[2468][048]|[13579][26])|((0[48]|[2468][048]|[3579][26])00))-02-29)$/",
                    "alertText":"* 请输入有效的日期,如:2008-08-08."},
                "ip":{
                    "regex":"/^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$/",
                    "alertText":"* 请输入有效的IP."},
                "chinese":{
                    "regex":"/^[\u4e00-\u9fa5]+$/",
                    "alertText":"* 请输入中文."},
                "url":{
                    "regex":"/^[a-zA-z]:\\/\\/[^s]$/",//这些验证需加强
                    "alertText":"* 请输入有效的网址."},
                "zipcode":{
                    "regex":"/^[1-9]\d{5}$/",
                    "alertText":"* 请输入有效的邮政编码."},
                "qq":{
                    "regex":"/^[1-9]\d{4,9}$/",
                    "alertText":"* 请输入有效的QQ号码."},
                "onlyNumber":{
                    "regex":"/^[0-9]+$/",
                    "alertText":"* 请输入数字."},
                "onlyLetter":{
                    "regex":"/^[a-zA-Z]+$/",
                    "alertText":"* 请输入英文字母."},
                "noSpecialCaracters":{
                    "regex":"/^[0-9a-zA-Z]+$/",
                    "alertText":"* 请输入英文字母和数字."},
                "ajaxUser":{
                    "file":"/NewsRelease_System/checkAccount.do",//ajax验证用户名，会post如下参数：validateError    ajaxUser；validateId user；validateValue  cccc
                    "alertTextOk":"* 帐号可以使用.",
                    "alertTextLoad":"* 检查中, 请稍后...",
                    "alertText":"* 帐号不能使用."},
                "ajaxLogin":{
                        "file":"/login/loginCheck.do",//ajax验证用户名，会post如下参数：validateError    ajaxUser；validateId user；validateValue  cccc
                        "alertTextOk":"* .",
                        "alertTextLoad":"* 检查中, 请稍后...",
                        "alertText":"* 用户名或密码错误."},
                "ajaxName":{
                    "file":"validateUser.php",
                    "alertText":"* This name is already taken",
                    "alertTextOk":"* This name is available",
                    "alertTextLoad":"* Loading, please wait"},
                 "ajaxCheckCourseName":{
                  	"file":"/ASP_System/checkCourseByName.do",
                  	"alertText":"* 课程已经存在.",
                  	"alertTextLoad":"* 检查中, 请稍后...",
                  	"alertTextOk":"可用"}
            }
        }
    }
})(jQuery);

$(document).ready(function() {
    $.validationEngineLanguage.newLang()
});