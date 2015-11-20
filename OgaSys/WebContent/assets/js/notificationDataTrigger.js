$(document).ready(
		function()
		{
			setInterval(
					function()
					{
							$.ajax(
								{
									url:"NotificationRetrieval",
									success:function(data)
									{

										obj = JSON.parse(data);
										//alert (data);
										//use for loop
										
										/*var s = "<div><span>";
											s += obj.Notification[0].NotificationContent ;
											s += "</span></div>";
										*/
									//	alert (obj.Notification[0].ObjectId);
										//document.getElementById("MyNoti").innerHTML = s;//obj.Notification[0].MsgToId;
										var s = "";
										for (var i = 0 ; i < obj.Notification.length ; i++) {
											s += "<div><span>";
											s += obj.Notification[i].NotificationContent ;
											s += "</span></div>";

										}
										//alert (document.getElementById("MyNoti").innerHTML);
										document.getElementById("MyNoti").innerHTML = s;//obj.Notification[0].MsgToId;
										
										/*obj = JSON.parse(data);
										//use for loop
										
										$.each(data, function(i, obj) {
										var s = "<div><span>";
											s += obj.NotificationContent ;
											s += "</span></div>";
										});
										
									//	alert (obj.Notification[0].ObjectId);
										document.getElementById("MyNoti").innerHTML = s;//obj.Notification[0].MsgToId;
										
										/*$.each(data, function(i, obj) {
											  //use obj.id and obj.name here, for example:
											  alert(obj.name);
											});*/
									}
								}
							)
					},10000)
		})