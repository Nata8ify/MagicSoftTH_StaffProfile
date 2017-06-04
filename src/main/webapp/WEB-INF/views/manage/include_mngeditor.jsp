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
				<th>Bind</th>
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
	&nbsp;
	<h3 id='h3-of-mng'>
		<!-- Of The Manager -->
	</h3>
	&nbsp;
	<button
		class='btn btn-default'
		id='btn-bind-this-staff'
	>Bind Staff</button>
	&nbsp;
	<button
		class='btn btn-warning'
		id='btn-transfer-all'
	>Transfer All</button>
	&nbsp;
	<button
		class='btn btn-danger'
		id='btn-unbind-all'
	>Unbind All</button>
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
				<th>Assign To</th>
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
				<th>Assign To</th>
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

		var managersDataTable = $('#table-managers')
				.DataTable(
						{
							"ajax" : {
								"url" : "${pageContext.request.contextPath}/viewAllMngs?json=true",
								"dataSrc" : ""
							},
							"columns" : constCols,
							"columnDefs" : [ {
								"targets" : -1,
								"data" : "",
								"searchable" : false,
								"defaultContent" : "<button class='mng-bind btn btn-default'><i class='glyphicon glyphicon-eye-open'></i></button>"
							} ],
							"order" : [ [ 0, "asc" ] ]
						});
		var staffsDataTable = $('#table-staffs-assigned')
				.DataTable(
						{
							"ajax" : {
								"url" : "${pageContext.request.contextPath}/viewAllStaffs?json=true",
								"dataSrc" : ""
							},
							"columns" : constCols,
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
							"columns" : constCols
						});
		$('#table-managers').on(
				'click',
				'tr .mng-bind',
				function() {
					var mngId = managersDataTable.row($(this).parents('tr'))
							.data().staffId;
					console.log(mngId);
					$.ajax({
						"url" : "searchMngsStaff?json=true&managerId=" + mngId,
						"success" : function(slist) {
							unassignedStaffs = $.parseJSON(slist);
							staffsDataTable.clear().draw();
							staffsDataTable.rows.add(unassignedStaffs);
							staffsDataTable.columns.adjust().draw();
						}
					});

				});
	</script>