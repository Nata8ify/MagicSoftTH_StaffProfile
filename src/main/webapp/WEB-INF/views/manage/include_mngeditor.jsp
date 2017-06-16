<div class="content-box-large box-with-header">
	<h3>Managers</h3>
	<hr>
	<table
		class="table table-responsive"
		id='table-managers'
	>
		<thead>
			<tr>
				<th>ID</th>
				<th>Name</th>
				<th>Name (Local)</th>
				<th>Position</th>
				<th>View Staff</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td colspan="5"></td>
			</tr>
		</tbody>
	</table>
	<br>
	<h3>Staffs</h3>
	<div id='div-action-set'>
		<h3 id='h3-of-mng'>
			<!-- Of The Manager -->
		</h3>
		&nbsp;
		<button
			class='btn btn-default'
			id='btn-view-all'
		><i class='glyphicon glyphicon-eye-open'></i> View All Assigned Staffs</button>
		&nbsp;
		<button
			class='btn btn-warning btn-staction'
			disabled
			id='btn-transfer-all'
		><i class='glyphicon glyphicon-transfer'></i> Transfer</button>
		&nbsp;
		<button
			class='btn btn-danger btn-staction'
			disabled
			id='btn-unbind-all'
		><i class='glyphicon glyphicon-remove-sign'></i> Unbind from the Manager</button>
	</div><br/>
	<h4 id='h4-assigned-staff'>Assigned Staffs</h4>
	<hr>
	<table
		class="table table-responsive table-hover"
		id='table-staffs-assigned'
	>
		<thead>
			<tr>
				<th>ID</th>
				<th>Name</th>
				<th>Name (Local)</th>
				<th>Position</th>
				<th>Department</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td colspan="5"></td>
			</tr>
		</tbody>
	</table>
	<br>
	<h4>Unassigned Staffs</h4>
	<hr>
	<table
		class="table table-responsive  table-hover"
		id='table-staffs-unassigned'
	>
		<thead>
			<tr>
				<th>ID</th>
				<th>Name</th>
				<th>Name (Local)</th>
				<th>Position</th>
				<th>Department</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td colspan="5"></td>
			</tr>
		</tbody>
	</table>
</div>
<div
	class="modal fade"
	id='modal-assign-mng'
>
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button
					type="button"
					class="close"
					data-dismiss="modal"
				>&times;</button>
				<h4 class="modal-title">Assign to Manager</h4>
			</div>
			<div class="modal-body">
				<table
					class='table table-responsive'
					id='table-assign-mng'
				>
					<thead>
						<tr>
							<th colspan="1"></th>
							<th
								colspan="1"
								id='td-mng-id'
							></th>
							<th
								colspan="2"
								id='td-mng-name'
							></th>
						</tr>
						<tr>
							<th>ID</th>
							<th>Name</th>
							<th>Position</th>
							<th>Assign</th>
						</tr>
					</thead>
					<tbody id='mnglist-tbody'>
					</tbody>
				</table>
			</div>
			<div class="modal-footer">
				<button
					type="button"
					class="btn btn-default"
					data-dismiss="modal"
				>Close</button>
			</div>
		</div>
	</div>
</div>
<script
	src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"
></script>
<script>
	/* include_mngeditor.jsp */
	
	
	/* Keep some things to do when document was loaded; */
	var managers;
	$('document').ready(function() {
		$.ajax({
			"url" : "${pageContext.request.contextPath}/viewAllMngs?json=true",
			"success" : function(mlist) {
				managers = $.parseJSON(mlist);
			}
		});
	});

	/* this var will be used managersDataTable, staffsDataTable, unassignedStaffsDataTable for define the table column.*/
	var constCols = [ {
		"data" : "staffId",
		"width" : "5%"
	}, {
		"data" : "name",
		"width" : "30%"
	}, {
		"data" : "position",
		"width" : "30%"
	}, {
		"width" : "35%"
	} ]

	/* Load and draw an staff (manager) list.*/
	var managersDataTable = $('#table-managers')
			.DataTable(
					{
						"ajax" : {
							"url" : "${pageContext.request.contextPath}/viewAllMngs?json=true",
							"dataSrc" : ""
						},
						"columns" : [ {
							"data" : "staffId",
							"width" : "5%"
						}, {
							"data" : "name",
							"width" : "30%"
						}, {
							"data" : "nameLocale",
							"width" : "30%"
						}, {
							"data" : "position",
							"width" : "30%"
						}, {
							"width" : "5%"
						} ],
						"columnDefs" : [ {
							"targets" : -1,
							"data" : "",
							"searchable" : false,
							"defaultContent" : "<button class='mng-bind btn btn-default'><i class='glyphicon glyphicon-eye-open'></i></button>"
						} ],
						"order" : [ [ 0, "asc" ] ]
					});

	/* Load and draw an assigned staff list.*/
	var staffsDataTable = $('#table-staffs-assigned')
			.DataTable(
					{
						"ajax" : {
							"url" : "${pageContext.request.contextPath}/viewAllAssignedStaffs?json=true",
							"dataSrc" : ""
						},
						"columns" : [ {
							"data" : "staffId",
							"width" : "15%"
						}, {
							"data" : "name",
							"width" : "25%"
						}, {
							"data" : "nameLocale",
							"width" : "25%"
						}, {
							"data" : "position",
							"width" : "15%"
						}, {
							"data" : "division",
							"width" : "20%"
						} ],
						"order" : [ [ 0, "asc" ] ]
					});

	var unassignedStaffsDataTable = $('#table-staffs-unassigned')
			.DataTable(
					{
						"ajax" : {
							"url" : "${pageContext.request.contextPath}/viewAllUnassignedStaffs?json=true",
							"dataSrc" : ""
						},
						"columns" : [ {
							"data" : "staffId",
							"width" : "15%"
						}, {
							"data" : "name",
							"width" : "25%"
						}, {
							"data" : "nameLocale",
							"width" : "25%"
						}, {
							"data" : "position",
							"width" : "15%"
						}, {
							"data" : "division",
							"width" : "20%"
						} ],
					});

	/* This Event will do Staff filter that working on the selected manager*/
	$('#table-managers')
			.on(
					'click',
					'tr .mng-bind',
					function() {
						var mngSelectedRowData = managersDataTable.row($(this).parents('tr')).data();
						console.log(mngSelectedRowData.staffId);
						$.ajax({
							"url" : "${pageContext.request.contextPath}/searchMngsStaff?json=true&managerId="
									+ mngSelectedRowData.staffId,
							"success" : function(slist) {
								unassignedStaffs = $.parseJSON(slist);
								staffsDataTable.clear().draw();
								staffsDataTable.rows.add(unassignedStaffs);
								staffsDataTable.columns.adjust().draw();
								viewAssigedTitle("Total Assigned Staffs of <b>"+mngSelectedRowData.name+"</b> ("+unassignedStaffs.length+")");
							}
						});

					});
	
	/* This Event will request for total staffs and draw on the datatable. */
	$('#btn-view-all').click(function() {
						$.ajax({
							"url" : "${pageContext.request.contextPath}/viewAllAssignedStaffs?json=true",
							"success" : function(slist) {
								unassignedStaffs = $.parseJSON(slist);
								staffsDataTable.clear().draw();
								staffsDataTable.rows.add(unassignedStaffs);
								staffsDataTable.columns.adjust().draw();
									
							}
						});

					});

	/* This var will contain a list of selected staff's row. on staffsDataTable */
	var staffIds = [];
	var selectedManagerId;
	$('#table-staffs-assigned tbody').on('click', 'tr', function() {
		var selectedStaffId = staffsDataTable.row($(this)).data().staffId;
		if (!$(this).hasClass('selected')) {
			$('.btn-staction').prop('disabled', false);
			$(this).addClass('selected');
			staffIds.push(selectedStaffId);
		} else {
			$(this).removeClass('selected');
			staffIds.splice($.inArray(staffIds, selectedStaffId), 1);
			if (staffIds.length == 0) {
				$('.btn-staction').prop('disabled', true);
			}
		}
		console.log(staffIds);
	});

	/* This var will contain a list of selected staff's row. on unassignedStaffsDataTable */
	$(' #table-staffs-unassigned tbody').on('click', 'tr', function() {
		var selectedStaffId = unassignedStaffsDataTable.row($(this)).data().staffId;
		if (!$(this).hasClass('selected')) {
			$('.btn-staction').prop('disabled', false);
			$(this).addClass('selected');
			staffIds.push(selectedStaffId);
		} else {
			$(this).removeClass('selected');
			staffIds.splice($.inArray(staffIds, selectedStaffId), 1);
			if (staffIds.length == 0) {
				$('.btn-staction').prop('disabled', true);
			}
		}
		console.log(staffIds);
	});
	
	/* Let's Transfer the staffs to seleted manager.*/
	$('#btn-transfer-all')
			.click(
					function() {

						$('#mnglist-tbody').html("");
						$
								.each(
										managers,
										function(index, value) {
											var mngId = value.staffId;
											var name = value.name;
											var position = value.position;
											var btnAssignHtml = $("<tr><td>"
													+ mngId
													+ "</td><td>"
													+ name
													+ "</td><td>"
													+ position
													+ "</td><td><button class='btn btn-default .btn-assign-mng'><i class='glyphicon glyphicon-thumbs-up'></i></button></td></tr>");
											$('#mnglist-tbody').append(btnAssignHtml.click(function() {
																		$.each(staffIds, function(index, value) {
																			$.ajax({
																				"url" : "${pageContext.request.contextPath}/bindToMng",
																				"data" : {
																					staffId : value,
																					managerId : mngId
																				},
																				"success" : function(result) {
																					console.log(value + " binded! "+value+" TO "+mngId+" result: "+result);
																				}
																			});
																			$('#modal-assign-mng').modal('hide');
																		});
																		location.reload();
																	}));
										});
						$('#modal-assign-mng').modal();
					});

	/* Let's Transfer the staffs to seleted manager.*/
	$('#btn-unbind-all').click(function() {
		$.each(staffIds, function(index, value) {
			$.ajax({
				"url" : "${pageContext.request.contextPath}/unbindFromMng",
				"data" : {
					staffId : value
				},
				"success" : function(result) {
					console.log(value + " unbinded! "+result);
				}
			});
		});
		location.reload();
	});
	
	/* Listener */
	$('#btn-view-all').click(function(){
		viewAssigedTitle("Total Assigned Staff");
	});
	function viewAssigedTitle(message){
		$('#h4-assigned-staff').html(message);
	}
</script>