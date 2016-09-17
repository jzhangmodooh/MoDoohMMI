$(document).ready(function() {
	$("#create").click(function() {
		$('#newform').slideToggle();
	});
	$('#submit').click(function() {
		if ($('#userNamebyID').val() == "null") {
			alert("Customer doesn't exist!");
		} else if ($('#deviceNamebyID').val() == "null") {
			alert("Device doesn't exist!");
		}else if($('#storage').val() == ""){
			alert("storage cannot be empty!");
		} 
		else {
			$('#newform form').submit(
					 $.post("addDeviceModelAction", $("#newform form").serialize(),function(data, textStatus){  
				            if(textStatus =="success"){  
				            	 $("#ajaxShow").load("viewDeviceModelAction");
				            }else{  
				                alert(textStatus);  
				            }  
				        })
					 );
			$('#newform').slideUp();
		}
	});
	$('#cancel').click(function() {
		$('#newform').slideUp();
	});
});



function dataSubmit(value) {
	var txt = "detail" + value;
	if ($('#userNamebyID' + value).val() == "null") {
		alert("Customer doesn't exist!");
	} else if ($('#carNameEditByID' + value).val() == "null") {
		alert("Device doesn't exist!");
	} else {
		$("#" + txt).slideUp(500);
		$("#" + txt).children("form").submit();
		alert("Updates saved!");
	}
}

function cancel(value) {
	var txt = "detail" + value;
	$("#" + txt).slideUp(500);
}

function addFile() {
	$("#deviceID")
			.after(
					"<input type=\"file\"  class=\"form-control file\" name = \"uploadFile\" id = \"uploadFile\">");
}
function subFile() {
	if ($("#deivceID").prev().attr("id") != "firstFile") {
		$("#deviceID").prev().remove();
	}
}