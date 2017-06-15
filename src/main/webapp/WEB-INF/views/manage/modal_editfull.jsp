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
							<label for="editType">Role</label> <select required
								name="editType" class="form-control" id='editType'>
								<option value="m">Manager</option>
								<option value="s">Staff</option>
								<option value="a">Administrator (System User)</option>
							</select> <input type='hidden' id='hide-cur-staffType' name='prevEditType' />
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
							class="form-group col-xs-2 floating-label-form-group controls">
							<label for="honorific">Honorific</label> <select name="honorific"
								class="form-control" id='honorific'>
								<option value="Mr">Mr.</option>
								<option value="Mrs">Mrs.</option>
								<option value="Ms">Ms.</option>
							</select>
						</div>
						<div
							class="form-group col-xs-5 floating-label-form-group controls">
							<label for="name">Name and Surname (English)</label> <input type="text"
								class="form-control" placeholder="Name & Lastname" id="name"
								name='name' maxlength="40" required
								pattern="[a-zA-Z\s]+"
								data-validation-required-message="Please enter Name and Lastname.">
							<p class="help-block text-danger"></p>
						</div>
						<div
							class="form-group col-xs-5 floating-label-form-group controls">
							<label for="name">Name and Surname (Local)</label>
							<input type="text" class="form-control"
								placeholder="Name & Lastname (In Local Language)"
								id="nameLocale" name='nameLocale' maxlength="40" required
								data-validation-required-message="Please enter Name and Lastname.">
							<p class="help-block text-danger"></p>
						</div>
					</div>
					<div class="row control-group">
						<div
							class="form-group col-xs-6 floating-label-form-group controls">
							<label for="email">Email Address</label> <input type="email"
								class="form-control" placeholder="Email Address" id="email"
								name='email' maxlength="30" required
								data-validation-required-message="Please enter Email Address.">
							<p class="help-block text-danger"></p>
						</div>
						<div
							class="form-group col-xs-3 floating-label-form-group controls">
							<label for="tel">Contact Number</label> <input type="tel"
								class="form-control" placeholder="Contact Number" id="tel"
								name='tel' maxlength="12" required
								data-validation-required-message="Please enter Contact Number.">
							<p class="help-block text-danger"></p>
						</div>
						<div
							class="form-group col-xs-3 floating-label-form-group controls">
							<label for="tel">Mobile No.</label> <input type="tel"
								class="form-control" placeholder="Mobile No." id="mobileTel"
								name='mobileTel' maxlength="12" required
								data-validation-required-message="Please enter Mobile Contact Number.">
							<p class="help-block text-danger"></p>
						</div>
					</div>
					<div class="row control-group">
						<div
							class="form-group col-xs-6 floating-label-form-group controls">
							<label for="division">Staff's Department</label> <input
								type="text" class="form-control"
								placeholder="Staff's Department" id="division" name='division'
								maxlength="30" required
								data-validation-required-message="Please enter Staff's Department.">
							<p class="help-block text-danger"></p>
						</div>
						<div
							class="form-group col-xs-6 floating-label-form-group controls">
							<label for="position">Staff's Position</label> <input type="text"
								class="form-control" placeholder="Staff's Position"
								id="position" name='position' maxlength="50" required
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
							<button type="button" class='btn btn-info' id='btn-assign-mng'>Assign
								Manager</button>
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
							<label for="password">Password <b id='b-pwd-msg'></b></label> <input
								type="password" class="form-control" placeholder="Password"
								id="password" name='password' required
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
								checked> : Prefer to Staff's Original.
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
							<button id='btn-submit-edit' type="submit"
								class="btn btn-success btn-lg">Submit</button>
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
	/* 	This Event will disabled the password form and its confirm form 
	 if admin prefer to not change this staff's password.  */
	$('#chkprvpass').click(function() {
		if ($('#chkprvpass').is(":checked")) {
			$('#password').prop('disabled', true);
			$('#cofmpassword').prop('disabled', true);
			$('#btn-submit-edit').prop("disabled", false);
			$('#b-pwd-msg').html('');
			$('#cofmpassword').val('');
			$('#password').val('');
		} else {
			$('#password').prop('disabled', false);
			$('#cofmpassword').prop('disabled', false);
		}
	});

	/* This Event will performs the permantly delete action of selected staff. */
	$('#lnk-delstaff')
			.click(
					function() {
						/* document.location = "deletePerson?staffId="+$('#staffId').val(value.staffId); */
						alert($('#hide-cur-staffType').val());
						if (confirm("Please, Confirm this Permantly Staff Deleting Action...")) {
							$.ajax({
								"url" : "deletePerson",
								"type" : "POST",
								"data" : {
									ajax : true,
									staffId : $('#staffId').val(),
									staffType : $('#hide-cur-staffType').val()
								},
								"success" : function(result) {
									alert("Deleted");
									location.reload();
								}
							});
						}
					});

	/* This is the Password Validator */
	$('#cofmpassword, #password').keyup(function() {
		console.log($('#cofmpassword').val() + " ><><" + $('#password').val());
		if ($('#cofmpassword').val() != $('#password').val()) {
			$('#b-pwd-msg').html('Mismatched Password!');
			$('#b-pwd-msg').css('color', 'red');
			$('#btn-submit-edit').prop("disabled", true);
		} else {
			$('#b-pwd-msg').html('Matched');
			$('#b-pwd-msg').css('color', 'green');
			$('#btn-submit-edit').prop("disabled", false);
		}
	});

	/* If the Staff is Manager then 'Assign manager' Should be disable. */
	$('#editType').on('change', function(e) {
		if ($('#editType').val() != 'm') {
			$('#btn-assign-mng').prop('disabled', false);
		} else {
			$('#btn-assign-mng').prop('disabled', true);
		}
	});
</script>