
function pageBackTo(page){
			var url = document.getElementById('url').value;
   			if(page == 1){
   				alert("已经是第一页了");
   				return false;
   			}else{
   				page--;
   				document.getElementById('pageBack').href=url+"&page="+page;
   				return true;
   			}
}

function pageNextTo(page,hasPages){
			var url = document.getElementById('url').value;
   			if(page == hasPages){
   				alert("已经是最后一页了");
   				return false;
   			}else{
   				page++;
   				document.getElementById('pageNext').href=url+"&page="+page;
				return true;
   			}
}

function pageFirst(page){
			var url = document.getElementById('url').value;
   			if(page == 1){
   				alert("已经是第一页了");
   				return false;
   			}else{
   				page = 1;
   				document.getElementById('pageFirst').href=url+"&page="+page;
   				return true;
   			}
}
function pageLast(page,hasPages){
			var url = document.getElementById('url').value;
   			if(page == hasPages){
   				alert("已经是最后一页了");
   				return false;
   			}else{
   				page = hasPages;
   				document.getElementById('pageLast').href=url+"&page="+page;
   				return true;
   			}
}

function pageTo(select){
	var url = document.getElementById('url').value;
	location.href = url+"&page="+select.value;
}

function changePerFolioAmount(newPerFolioAmount){
	var url = document.getElementById('url').value;
	var perFolioAmount = document.getElementById('perFolioAmount').value;
	if(newPerFolioAmount == perFolioAmount){
		return false;
	}
	document.getElementById('setPerFolioAmount').href=url+"&perFolioAmount="+perFolioAmount;
	return true;
}











