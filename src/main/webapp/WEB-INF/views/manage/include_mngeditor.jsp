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
				<th>Position</th>
				<th>Staff Review</th>
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
		&nbsp;
		<h3 id='h3-of-mng'>
			<!-- Of The Manager -->
		</h3>
		&nbsp;
		<button
			class='btn btn-default'
			id='btn-view-all'
		><i class='glyphicon glyphicon-eye-open'></i> View All</button>
		&nbsp;
		<button
			class='btn btn-warning btn-staction'
			disabled
			id='btn-transfer-all'
		>Transfer</button>
		&nbsp;
		<button
			class='btn btn-danger btn-staction'
			disabled
			id='btn-unbind-all'
		>Unbind</button>
	</div>
	<hr>
	<table
		class="table table-responsive"
		id='table-staffs-assigned'
	>
		<thead>
			<tr>
				<th>ID</th>
				<th>Name</th>
				<th>Position</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td colspan="5"></td>
			</tr>
		</tbody>
	</table>
	<br>
	<h3>Unassigned Staffs</h3>
	<hr>
	<table
		class="table table-responsive"
		id='table-staffs-unassigned'
	>
		<thead>
			<tr>
				<th>ID</th>
				<th>Name</th>
				<th>Position</th>
				<th></th>
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
			"url" : "viewAllMngs?json=true",
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
							"data" : "position",
							"width" : "30%"
						}, {
							"width" : "35%"
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
							"url" : "${pageContext.request.contextPath}/viewAllStaffs?json=true",
							"dataSrc" : ""
						},
						"columns" : [ {
							"data" : "staffId",
							"width" : "15%"
						}, {
							"data" : "name",
							"width" : "30%"
						}, {
							"data" : "position",
							"width" : "30%"
						}, {
							"data" : "division",
							"width" : "25%"
						} ],
						"columnDefs" : [ {
							"targets" : -1,
							"data" : "",
							"searchable" : false,
							"defaultContent" : "<button class='staff-bind btn btn-default'><i class='glyphicon glyphicon-pencil'></i></button>"
						}

						],
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
							"width" : "30%"
						}, {
							"data" : "position",
							"width" : "30%"
						}, {
							"data" : "division",
							"width" : "25%"
						} ],
						"columnDefs" : [ {
							"targets" : -1,
							"data" : "",
							"searchable" : false,
							"defaultContent" : "<button class='staff-bind btn btn-default'><i class='glyphicon glyphicon-pencil'></i></button>"
						}

						],
					});

	/* This Event will do Staff filter that working on the selected manager*/
	$('#table-managers')
			.on(
					'click',
					'tr .mng-bind',
					function() {
						var mngId = managersDataTable
								.row($(this).parents('tr')).data().staffId;
						console.log(mngId);
						$.ajax({
							"url" : "searchMngsStaff?json=true&managerId="
									+ mngId,
							"success" : function(slist) {
								unassignedStaffs = $.parseJSON(slist);
								staffsDataTable.clear().draw();
								staffsDataTable.rows.add(unassignedStaffs);
								staffsDataTable.columns.adjust().draw();
							}
						});

					});
	
	/* This Event will request for total staffs and draw on the datatable. */
	$('#btn-view-all').click(function() {
						$.ajax({
							"url" : "${pageContext.request.contextPath}/viewAllStaffs?json=true",
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
																				"url" : "bindToMng",
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
				"url" : "unbindFromMng",
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
</script>