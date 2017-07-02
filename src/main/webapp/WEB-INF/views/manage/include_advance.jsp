<c:set var="context" value="${pageContext.request.contextPath}" />
<script
	src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
<div class='row well'>
	<div class='col-sm-12'>
		<fieldset>
			<legend>Department Management</legend>
			<table class='table table-responsive'>
				<tbody>
					<tr>
						<td>Create New Department :</td>
					</tr>
					<tr>
						<td><input class="form-control" id="input-create-department" maxlength="100"
							placeholder="Department's Name" /></td>
						<td>
							<button class="btn btn-default" id="btn-create-department">
								<i class="glyphicon glyphicon-plus-sign"></i> Create Department
							</button>&nbsp;&nbsp;
						</td>
						<td><i id="create-department-result"></i></td>
					</tr>

				</tbody>
			</table>
			<hr />

			<table id="table-department" style="width: 100%">
				<thead>
					<tr>
						<th>Department Title</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>

				</tbody>
			</table>
			<hr />
		</fieldset>
		<div class="modal fade" id='modal-edit-department'>
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Department Editor</h4>
					</div>
					<div class="modal-body">
						<div class="row">
							<div class="col-sm-12">
							<input type="hidden" id="input-hide-department-id"/>
							<input class="form-control" id="input-edit-department" required maxlength="100"/><br/>
						</div>
						</div>
						<div class="row">
						<div class="col-sm-6"><a href="#" style="color: red;" id="a-delete-department">Delete This Department</a></div>
							<div class="col-sm-4"><br/></div>
							<div class="col-sm-1"><button  class="btn btn-success" id="btn-submit-edit-department">Submit</button></div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>

		<script type="text/javascript">
		var departments;
		var departmentTable;
	    $(document)
		    .ready(
			    function() {//Load & Append Data into Department Table.
				$.ajax({
					    "type" : "POST",
					    "url" : "department/departments",
					    "success" : function(departments) {
						departmentTable = $("#table-department")
							.DataTable(
								{
								    "data" : $
									    .parseJSON(departments),
								    "columns" : [{
										"data" : "department",
										"width" : "70%"
									    },{
										"width" : "30%"
									    } ],
								    "columnDefs" : [ {
									"targets" : -1,
									"searchable" : false,
									"render" : function(url,type,row,
										meta) {
									    return '<button class="btn btn-default btn-edit-department"><i class="glyphicon glyphicon-pencil"></i></button>';
									}
								    } ]
								});
					    }
					});
			    });
	    $("#table-department").on("click", "tr .btn-edit-department", function(evt){
		var rowData = departmentTable.row($(this).parents("tr")).data();	
		$("#input-edit-department").val(rowData.department);
		$("#input-hide-department-id").val(rowData.departmentId);
			$("#modal-edit-department").modal("show");
	    });
	    $("#a-delete-department").click(function(){
			confirm("This Department will be Deleted, Please Confirm the action.")?$.ajax({
			    "type" : "POST",
			    "url" : "department/delbyId",
			    "data" : {"departmentId" : $("#input-hide-department-id").val()},
			    "success" : function(result){
				location.reload();
			    }
			}):console.log("Deleting Abort");
	    });
	    $("#btn-submit-edit-department").click(function(){
			$.ajax({
			    "type" : "POST",
			    "url" : "department/update",
			    "data" : {"departmentId" : $("#input-hide-department-id").val(), "department" : $("#input-edit-department").val()},
			    "success" : function(result){
				location.reload();
			    }
			});
	    });
	    
	    $("#btn-create-department").click(
		    function() {
			var department = $("#input-create-department").val();
			$.ajax({
			    "type" : "POST",
			    "url" : "department/create",
			    "data" : {
				"department" : department
			    },
			    "success" : function(result) {
				$("#create-department-result").html(
					"Department Added.");
			    },
			    "error" : function(exc) {
				$("#create-department-result").html(
					"Department Not Add.");
			    }
			});
		    });
	</script>
		<!-- ++++++++++++++++++++++++++++++++++++ -->
		<table class='table table-responsive'>
			<tbody>
				<tr>
					<td>Administrator Permission</td>
				</tr>
				<tr>
					<td><input class="form-control" id="input-grantadm-staff-id"
						placeholder="Staff ID" /></td>
					<td>
						<button class="btn btn-info" id="btn-grantadm-grant">Grant</button>&nbsp;&nbsp;
						<button class="btn btn-danger" id="btn-grantadm-revoke">Revoke</button>
					</td>
				</tr>
			</tbody>
		</table>

		<script type="text/javascript">
	    $("#btn-grantadm-grant").click(
		    function() {
			var staffId = $("#input-grantadm-staff-id").val()
				.trim().toUpperCase();
			grantAdminPermission(staffId, true,
				"Administrator Permission Granted to "
					+ staffId + ".");
		    });
	    $("#btn-grantadm-revoke").click(
		    function() {
			var staffId = $("#input-grantadm-staff-id").val()
				.trim().toUpperCase();
			grantAdminPermission(staffId, false,
				"Administrator Permission Revoked on "
					+ staffId + ".");
		    });
	    /* 	    $("#input-grantadm-staff-id").keyup(function(){
	     console.log($(this).val());
	     }); */
	    function grantAdminPermission(staffId, isAdmGrant, preResponse) {
		if (staffId == "") {
		    alert("Staff ID Field is Required.");
		} else {
		    $
			    .ajax({
				"url" : "grantadm",
				"data" : {
				    isGrantAdminRole : isAdmGrant,
				    staffId : staffId
				},
				"success" : function(response) {
				    if (response == "true") {
					alert(preResponse);
				    } else {
					alert("Invalid Staff ID, Please check Staff ID and try again.");
				    }
				}
			    });
		}
	    }
	</script>

		<form action="deleteAll" method="post">
			<table class='table table-responsive'>
				<tbody>
					<tr>
						<td colspan="2">Delete Total Staffs From the Database <b
							style="color: red;">(CAN NOT UNDONE)</b></td>
					</tr>

					<tr>
						<td><input type='text' name='confirmPharse'
							class='form-control' id='input-truncate-confirm'
							placeholder='Type "CONFIRM_DELETE_ALL"' /></td>
						<td><button disabled class='btn btn-danger' type="submit"
								id='btn-confirm-deleteall'>
								<i class='glyphicon glyphicon-exclamation-sign'></i> Delete All
							</button></td>
					</tr>
				</tbody>
			</table>
		</form>
		<script type="text/javascript">
	    $('#input-truncate-confirm')
		    .keyup(
			    function() {
				if ($('#input-truncate-confirm').val() !== 'CONFIRM_DELETE_ALL') {
				    $('#btn-confirm-deleteall').prop(
					    'disabled', true);
				} else {
				    $('#btn-confirm-deleteall').prop(
					    'disabled', false);
				}
			    });
	</script>
	</div>
</div>
