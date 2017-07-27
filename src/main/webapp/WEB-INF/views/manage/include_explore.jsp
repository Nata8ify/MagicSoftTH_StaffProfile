<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<c:set var="resContextPath" value="${pageContext.request.contextPath}/resources/" />
	<div class="col-md-12 panel-default">
		<div class="content-box-header panel-heading">
			<div class="panel-title ">Staff Explorer</div>
			<!-- 							<div class="panel-options">
								<a href="#" data-rel="collapse"><i
									class="glyphicon glyphicon-refresh"></i></a> <a href="#"
									data-rel="reload"><i class="glyphicon glyphicon-cog"></i></a>
							</div> -->
		</div>
		<div class="content-box-large box-with-header">
			<table id='staff-explore-table'>
				<thead>
					<tr>
						<th></th>
						<th>StaffId</th>
						<th>Name</th>
						<th>Name (Local)</th>
						<th>E-mail</th>
						<th>Tel</th>
						<th>Division</th>
						<th>Position</th>
						<th>Edit</th>
					</tr>
				</thead>
				<tbody></tbody>
			</table>
			<br /> <br />
		</div>
	</div>
	<script src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript">
		var staffTable;
		$(document)
			.ready(
			function () {
				staffTable = $('#staff-explore-table')
					.DataTable(
					{
						"ajax": {
							"url": "${pageContext.request.contextPath}/viewAll?json=true",
							"dataSrc": ""
						},
						"columns": [{
							"data": "protraitPath",
							"width": "10%"
						}, {
							"data": "staffId",
							"width": "5%"
						}, {
							"data": "name",
							"width": "15%"
						}, {
							"data": "nameLocale",
							"width": "15%"
						}, {
							"data": "email",
							"width": "10%"
						}, {
							"data": "tel",
							"width": "10%"
						}, {
							"data": "division",
							"width": "10%"
						}, {
							"data": "position",
							"width": "10%"
						}, {
							"width": "5%"
						}],
						"columnDefs": [
							{
								"targets": 0,
								"data": "protraitPath",
								"searchable": false,
								"render": function (
									url, type, row,
									meta) {
									var imgSource = row.protraitPath == null ? "${pageContext.request.contextPath}/resources/portraits/noimg.png"
										: "${pageContext.request.contextPath}/resources/portraits/"
										+ row.protraitPath;
									return '<img src="' + imgSource + '" width="100px" alt="Portrait"/>';
								}
							},
							{
								"targets": -1,
								"data": "",
								"searchable": false,
								"defaultContent": "<button class='staff-edit btn btn-default'><i class='glyphicon glyphicon-pencil'></i></button>"
							}

						],
						"order": [[1, "asc"]]
					});
			});
	</script>
	<script type="text/javascript">
		/* modal_editfull */
		var staffList; /* This is a total */
		$(document)
			.ready(
			function () {
				$.when($.ajax({
							"url": "${pageContext.request.contextPath}/viewAll?json=true"
						})).then(function (json) {
							staffList = $.parseJSON(json);
						});

				var unassignedStaffs;
				$.ajax({"url": "${pageContext.request.contextPath}/viewAllUnassignedStaffs?json=true",
						"success": function (uslist) {
							unassignedStaffs = $.parseJSON(uslist);}});

				var staffs;
				$.ajax({"url": "${pageContext.request.contextPath}/viewAllStaffs?json=true",
						"success": function (slist) {
							staffs = $.parseJSON(slist);}});
				var managers;
				$.ajax({"url": "${pageContext.request.contextPath}/viewAllMngs?json=true",
						"success": function (mlist) {
							managers = $.parseJSON(mlist);}});
			});
		var thisStaff; /* Selected Staff [GLOBAL] */
		$('#staff-explore-table tbody').on('click', 'tr .staff-edit', function () {
		    	thisStaff = staffTable.row($(this).parents('tr')).data();
				appendEditStaffData(thisStaff);
				$('#modal-staff-edit').modal();
			});
	</script>
	<script>
		/* modal_pickmng */
		var managers;
		$.ajax({
			"url": "${pageContext.request.contextPath}/viewAllMngs?json=true",
			"success": function (mlist) {
				managers = $.parseJSON(mlist);
			}
		});
		$('#btn-assign-mng').click(function () {
				$('#mnglist-tbody').html("");
				$.each(managers, function (index, value) {
						var staffId = value.staffId;
						var name = value.name;
						var position = value.position;
						var btnAssignHtml = $("<tr><td>"
							+ staffId
							+ "</td><td>"
							+ name
							+ "</td><td>"
							+ position
							+ "</td><td><button class='btn btn-default .btn-assign-mng'><i class='glyphicon glyphicon-thumbs-up'></i></button></td></tr>");
						$('#mnglist-tbody').append(
							btnAssignHtml.click(function () {
									$('#hostManagerId').val(staffId);
									$('#hostManagerName-show').val(name);
									$('#opt-staffid').val("Staff (assign to "+ name + ")");
									$('#modal-assign-mng').modal('hide');
								}));});
				$('#modal-assign-mng').modal();

			});
	</script>
	<script>
		/** Functions **/
		/* appendEditStaffData : To Append Staff data on Staff Editor's Form. */
		function appendEditStaffData(thisStaff){
		    $.each(staffList, function (index, value) {
			if (value.staffId == thisStaff.staffId) {
				$('#editType').val(value.staffType);
				$('#staffId').val(value.staffId);
				$('#name').val(value.name);
				$('#fname').val(value.name.substring(0, value.name.indexOf(" ")));
				$('#lname').val(value.name.substring(value.name.indexOf(" ")+1));
				$('#nameLocale').val(value.nameLocale);
				$('#fnameLocale').val(value!=null?value.nameLocale.substring(0, value.nameLocale.indexOf(" ")):""); 
				$('#lnameLocale').val(value!=null?value.nameLocale.substring(value.nameLocale.indexOf(" ")+1):"");
				$('#email').val(value.email.substring(0, value.email.indexOf("@")));
				$('#tel').val(value.tel);
				$('#mobileTel').val(value.mobileTel);
				$('#division').val(value.division);
				$('#position').val(value.position);
				$('#honorific').val(value.honorific);
				$('#hostManagerId').val(value.hostManagerId);
				$('#protraitPathOld').val(value.protraitPath);
				$("#span-current-portrait-path").html(value.protraitPath!=null?(" ("+value.protraitPath.substring(value.protraitPath.indexOf("portraits/")+1)+")"):" (No Portrait)");
				$('#hide-cur-staffType').val(value.staffType);
				$('#birthDate').val(moment(new Date(value.birthDate)).format("DD-MM-YYYY"));
				$('input[name="birthDate"]').val(moment(new Date(value.birthDate)).format("YYYY-MM-DD"));
				$('#startWorkingDate').val(moment(new Date(value.startWorkingDate)).format("DD-MM-YYYY"));
				$('input[name="startWorkingDate"]').val(moment(new Date(value.birthDate)).format("YYYY-MM-DD"));
				$('#hostManagerName-show').val(value.hostManagerName != null ? value.hostManagerName : "Unassigned");
				$("#img-preview-portrait").attr("src", "${resContextPath}portraits/" + (value.protraitPath == null ? "noimg.png" : value.protraitPath));
				if(value.protraitPath == null){$("#select-portarit-default").prop("checked", true);}
				else {$("#select-portarit-keep").prop("checked", true);}
			}
		});
		}
	</script>