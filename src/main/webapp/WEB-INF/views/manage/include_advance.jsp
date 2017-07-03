
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
