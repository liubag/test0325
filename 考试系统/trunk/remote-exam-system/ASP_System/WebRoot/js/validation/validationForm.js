function validate(rule) {
	if(true){
    for (var id in rule) {
        var obj = rule[id];

        var str = "validate[required,";

        if (obj['required'] != undefined && obj['required'] == false) {
            str = str.split("[")[0] + "[optional,";
        }
        for (var i in obj) {
            if (i == 'required') {
                continue;
            } else if (i == 'custom') {
                for (var j = 0; j < obj[i].length; j++) {
                    str += "custom[" + obj[i][j] + "],";
                }
            } else if (i == 'ajax'){
            	str += "ajax[" + obj[i] + "],";
            } else {
                str += i + "[" + obj[i] + "],";
            }
        }
        str = str.substring(0, str.lastIndexOf(",")) + "]";

        $("#" + id).addClass(str);
    }
    $("form").validationEngine();
	}
}

