<div
	class="modal fade"
	id='modal-editself'
>
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button
					type="button"
					class="close"
					data-dismiss="modal"
				>&times;</button>
				<h4 class="modal-title">Profile Editor</h4>
			</div>
			<div class="modal-body">
				<form
					name="edit-self-form"
					id="edit-self-form"
					action="editSelf.f"
					method="post"
					enctype="multipart/form-data"
				>
					<div class="row control-group">
						<div
							class="form-group col-xs-12 floating-label-form-group controls"
						>
							<label for="Staff ID">Staff ID</label> <input
								type="text"
								class="form-control"
								placeholder="Staff ID"
								id="staffId"
								name='staffId'
								readonly
								value="${thisStaff.staffId}"
							>
							<p class="help-block text-danger"></p>
						</div>
					</div>
					<div class="row control-group">
						<div
							class="form-group col-xs-12 floating-label-form-group controls"
						>
							<label for="name">Name and Last Name</label> <input
								type="text"
								class="form-control"
								placeholder="Name & Lastname"
								id="name"
								name='name'
								maxlength="40"
								required
								data-validation-required-message="Please enter your Name and Lastname."
								value="${thisStaff.name}"
							>
							<p class="help-block text-danger"></p>
						</div>
					</div>
					<div class="row control-group">
						<div
							class="form-group col-xs-6 floating-label-form-group controls"
						>
							<label for="email">Email Address</label> <input
								type="email"
								class="form-control"
								placeholder="Email Address"
								id="email"
								name='email'
								maxlength="30"
								required
								data-validation-required-message="Please enter your Email Address."
								value="${thisStaff.email}"
							>
							<p class="help-block text-danger"></p>
						</div>
						<div
							class="form-group col-xs-6 floating-label-form-group controls"
						>
							<label for="tel">Contact Number</label> <input
								type="tel"
								class="form-control"
								placeholder="Contact Number"
								id="tel"
								name='tel'
								maxlength="12"
								required
								data-validation-required-message="Please enter your Contact Number."
								value="${thisStaff.tel}"
							>
							<p class="help-block text-danger"></p>
						</div>
					</div>
					<div class="row control-group">
						<div
							class="form-group col-xs-12 floating-label-form-group controls"
						>
							<label for="protraitPath">Portrait Image</label> <input
								type="file"
								class="form-control"
								id="protraitPath"
								name='protraitPath'
								value="${thisStaff.protraitPath}"
							>
							<p class="help-block text-danger"></p>
						</div>
					</div>
					<hr>
					<!-- Access Section -->
					<div class="row control-group">
						<div
							class="form-group col-xs-6 floating-label-form-group controls"
						>
							<label for="password" id='label-pwd-msg'>Password</label> <input
								type="password"
								class="form-control"
								placeholder="Password"
								id="password"
								name='password'
								required
								data-validation-required-message="Please enter your Password."
								value="${thisStaffAccess.password}"
							>
							<p class="help-block text-danger"></p>
						</div>
						<div class="row control-group">
							<div
								class="form-group col-xs-6 floating-label-form-group controls"
							>
								<label for="confirm password">Confirm Password</label> <input
									type="password"
									class="form-control"
									placeholder="Confirm Password"
									id="cofmpassword"
									name='cofmpassword'
									required
									data-validation-required-message="Confirm Your New-password."
									value="${thisStaffAccess.password}"
								>
								<p class="help-block text-danger"></p>
							</div>
						</div>
					</div>
					<br>
					<div id="success"></div>
					<div class="row">
						<div class="form-group col-xs-12">
							<button
								type="submit"
								class="btn btn-success btn-lg"
								id='btn-submit-editself'
							>Submit</button>
						</div>
					</div>
				</form>
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
<script>

/* This is the Password Validator */
$('#cofmpassword, #password').keyup(function() {
	console.log($('#cofmpassword').val()+" ><><"+ $('#password').val());
	if($('#cofmpassword').val() != $('#password').val()){
		$('#label-pwd-msg').html('Mismatched Password!');
		$('#label-pwd-msg').css('color', 'red');
		$('#btn-submit-editself').prop("disabled", true);
	} else {
		$('#label-pwd-msg').html('Matched');
		$('#label-pwd-msg').css('color', 'green');
		$('#btn-submit-editself').prop("disabled", false);
	}
});
</script>