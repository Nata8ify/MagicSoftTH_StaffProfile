<div class="modal fade" id='modal-staff-edit'>
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">Profile Editor</h4>
			</div>
			<div class="modal-body">
				<form name="staff-edit-form" id="staff-edit-form"
					action="editPerson.f" method="POST" enctype="multipart/form-data">
					<div class="row control-group">
						<div
							class="form-group col-xs-4 floating-label-form-group controls">
							<label for="editType">Role</label> <select name="editType"
								class="form-control" id='editType'>
								<option value="m">Manager</option>
								<option value="s">Staff</option>
								<option value="a">Administrator (System User)</option>
							</select>
						</div>
						<div
							class="form-group col-xs-8 floating-label-form-group controls">
							<label for="Staff ID">Staff ID</label> <input type="text"
								class="form-control" placeholder="Staff ID" id="staffId"
								name='staffId' readonly>
							<p class="help-block text-danger"></p>
						</div>
					</div>

					<div class="row control-group">
						<div
							class="form-group col-xs-3 floating-label-form-group controls">
							<label for="gender">Honorific</label> <select name="gender"
								class="form-control" id='gender'>
								<option value="m">Mr.</option>
								<option value="f">Mrs.</option>
							</select>
						</div>
						<div
							class="form-group col-xs-9 floating-label-form-group controls">
							<label for="name">Name and Last Name</label> <input type="text"
								class="form-control" placeholder="Name & Lastname" id="name"
								name='name' required
								data-validation-required-message="Please enter Name and Lastname.">
							<p class="help-block text-danger"></p>
						</div>
					</div>
					<div class="row control-group">
						<div
							class="form-group col-xs-6 floating-label-form-group controls">
							<label for="email">Email Address</label> <input type="email"
								class="form-control" placeholder="Email Address" id="email"
								name='email' required
								data-validation-required-message="Please enter Email Address.">
							<p class="help-block text-danger"></p>
						</div>
						<div
							class="form-group col-xs-6 floating-label-form-group controls">
							<label for="tel">Contact Number</label> <input type="tel"
								class="form-control" placeholder="Contact Number" id="tel"
								name='tel' required
								data-validation-required-message="Please enter Contact Number.">
							<p class="help-block text-danger"></p>
						</div>
					</div>
					<div class="row control-group">
						<div
							class="form-group col-xs-6 floating-label-form-group controls">
							<label for="division">Staff's Department</label> <input
								type="text" class="form-control"
								placeholder="Staff's Department" id="division" name='division'
								required
								data-validation-required-message="Please enter Staff's Department.">
							<p class="help-block text-danger"></p>
						</div>
						<div
							class="form-group col-xs-6 floating-label-form-group controls">
							<label for="position">Staff's Position</label> <input type="text"
								class="form-control" placeholder="Staff's Position"
								id="position" name='position' required
								data-validation-required-message="Please enter Staff's Position.">
							<p class="help-block text-danger"></p>
						</div>
					</div>
					<div class="row control-group">
						<div
							class="form-group col-xs-6 floating-label-form-group controls">
							<label for="hostManagerName-show">Staff's Manager</label> <input
								type="text" class="form-control" id="hostManagerName-show"
								disabled>
						</div>
						<input type="hidden" id="hostManagerId" name="hostManagerId" /> <br>
						<div
							class="form-group col-xs-6 floating-label-form-group controls">
							<button type="button" class='btn btn-info'
								id='btn-assign-mng'>Assign Manager</button>
						</div>
					</div>
					<div class="row control-group">
						<div
							class="form-group col-xs-12 floating-label-form-group controls">
							<label for="protraitPath">Portrait Image</label> <input
								type="file" class="form-control" id="protraitPathNew"
								name='protraitPath'>
							<p class="help-block text-danger"></p>
						</div>
					</div>

					<hr>
					<!-- Access Section -->
					<div class="row control-group">
						<div
							class="form-group col-xs-6 floating-label-form-group controls">
							<label for="password">Password</label> <input type="password"
								class="form-control" placeholder="Password" id="password"
								name='password' required
								data-validation-required-message="Please enter Password."
								disabled>
							<p class="help-block text-danger"></p>
						</div>
						<div class="row control-group">
							<div
								class="form-group col-xs-6 floating-label-form-group controls">
								<label for="confirm password">Confirm Password</label> <input
									type="password" class="form-control"
									placeholder="Confirm Password" id="cofmpassword"
									name='cofmpassword' required
									data-validation-required-message="Confirm New-password."
									disabled>
								<p class="help-block text-danger"></p>
							</div>
						</div>
					</div>
					<div class="row control-group">
						<div class="form-group col-xs-6  controls">
							<input type="checkbox" class="" id="chkprvpass" name='chkprvpass'
								checked> : Refer to Staff's Original.
						</div>
						<div class="form-group col-xs-6  controls">
							<a href='#' style='color: red' id='lnk-delstaff'>Delete This
								Staff from The System</a>
						</div>
					</div>
					<input type="hidden" id="protraitPathOld" name="protraitPathOld" />
					<br>
					<div id="success"></div>
					<div class="row">
						<div class="form-group col-xs-12">
							<button type="submit" class="btn btn-success btn-lg">Submit</button>
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" id='btn-submit'
					data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
<script>
	////
	$('#chkprvpass').click(function() {
		if ($('#chkprvpass').is(":checked")) {
			$('#password').prop('disabled', true);
			$('#cofmpassword').prop('disabled', true);
		} else {
			$('#password').prop('disabled', false);
			$('#cofmpassword').prop('disabled', false);
		}
	});

	$('#lnk-delstaff')
			.click(
					function() {
						/* document.location = "deletePerson?staffId="+$('#staffId').val(value.staffId); */
						if (confirm("Please, Confirm this Permantly Staff Deleting Action...")) {
							$.ajax({
								"url" : "deletePerson",
								"type" : "POST",
								"data" : {
									ajax : true,
									staffId : $('#staffId').val()
								},
								"success" : function(result) {
									alert("Should be deled!");
								}
							});
						}
					});
</script>