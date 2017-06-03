
<div class="content-box-large box-with-header">
	<form name="add-staff-form" id="add-staff-form"
		action="insertPerson.f" method="POST" enctype="multipart/form-data">
		<div class="row control-group">
			<div class="form-group col-xs-4 floating-label-form-group controls">
				<label for="Staff ID">Staff ID</label> <input type="text"
					class="form-control" placeholder="Staff ID" id="staffId"
					name='staffId'>
				<p class="help-block text-danger"></p>
			</div>
			<div class="form-group col-xs-2 floating-label-form-group controls">
				<label for="gen">System Generate</label>
				<button type="button" class="btn btn-default" id='btn-gen-id'>Generate</button>
			</div>
			<div class="form-group col-xs-3 floating-label-form-group controls">
				<label for="insertType">Role</label> <select name="insertType"
					class="form-control" id='insertType'>
					<option value="m">Manager</option>
					<option value="s" selected>Staff</option>
				</select>
			</div>
			<div class="form-group col-xs-3 floating-label-form-group controls">
				<br>
				<button  type="button" class='btn btn-lg btn-info' id='btn-assign-mng'>Assign
					Manager</button>
			</div>
		</div>

		<div class="row control-group">
			<div class="form-group col-xs-3 floating-label-form-group controls">
				<label for="gender">Honorific</label> <select name="gender"
					class="form-control" id='gender'>
					<option value="m">Mr.</option>
					<option value="f">Mrs.</option>
				</select>
			</div>
			<div class="form-group col-xs-9 floating-label-form-group controls">
				<label for="name">Name and Last Name</label> <input type="text"
					class="form-control" placeholder="Name & Lastname" id="name"
					name='name' required
					data-validation-required-message="Please enter Name and Lastname.">
				<p class="help-block text-danger"></p>
			</div>
		</div>
		<div class="row control-group">
			<div class="form-group col-xs-6 floating-label-form-group controls">
				<label for="email">Email Address</label> <input type="email"
					class="form-control" placeholder="Email Address" id="email"
					name='email' required
					data-validation-required-message="Please enter Email Address.">
				<p class="help-block text-danger"></p>
			</div>
			<div class="form-group col-xs-6 floating-label-form-group controls">
				<label for="tel">Contact Number</label> <input type="tel"
					class="form-control" placeholder="Contact Number" id="tel"
					name='tel' required
					data-validation-required-message="Please enter Contact Number.">
				<p class="help-block text-danger"></p>
			</div>
		</div>
		<div class="row control-group">
			<div class="form-group col-xs-6 floating-label-form-group controls">
				<label for="division">Staff's Department</label> <input type="text"
					class="form-control" placeholder="Staff's Department" id="division"
					name='division' required
					data-validation-required-message="Please enter Staff's Department.">
				<p class="help-block text-danger"></p>
			</div>
			<div class="form-group col-xs-6 floating-label-form-group controls">
				<label for="position">Staff's Position</label> <input type="text"
					class="form-control" placeholder="Staff's Position" id="position"
					name='position' required=''
					data-validation-required-message="Please enter Staff's Position.">
				<p class="help-block text-danger"></p>
			</div>
		</div>
		<div class="row control-group">
			<div class="form-group col-xs-12 floating-label-form-group controls">
				<label for="protraitPath">Portrait Image</label> <input type="file"
					class="form-control" id="protraitPath" name='protraitPath'>
				<p class="help-block text-danger"></p>
			</div>
		</div>

		<hr>
		<!-- Access Section -->
		<div class="row control-group">
			<div class="form-group col-xs-6 floating-label-form-group controls">
				<label for="password">Password</label> <input type="password"
					class="form-control" placeholder="Password" id="password"
					name='password' required=''
					data-validation-required-message="Please enter Password.">
				<p class="help-block text-danger"></p>
			</div>
			<div class="row control-group">
				<div class="form-group col-xs-6 floating-label-form-group controls">
					<label for="confirm password">Confirm Password</label> <input
						type="password" class="form-control"
						placeholder="Confirm Password" id="cofmpassword"
						name='cofmpassword' required=''
						data-validation-required-message="Confirm New-password.">
					<p class="help-block text-danger"></p>
				</div>
			</div>
		</div>

		<br>
		<div id="success"></div>
		<div class="row">
			<div class="form-group col-xs-12">
				<button type="submit" class="btn btn-success btn-lg" id='btn-submit'>Submit</button>
			</div>
		</div>
	</form>
	<br /> <br />
</div>
<script>
	$('#insertType').on('change', function() {
		if ($('#insertType').val() == "m") {
			$('#btn-assign-mng').prop('disabled', true);
		} else {
			$("#btn-assign-mng").removeAttr("disabled");
		}
	});
	$('#btn-gen-id').click(function() {
		$.ajax({
			"url" : "utils/latestMgsId",
			"success" : function(rawId) {
				$('#staffId').val(rawId);
			}
		});
	});
	$('#btn-submit').click(function() {
		if ($('#protraitPath').val() == '') {
			$('form #add-staff-form').removeAttr("enctype");
			$('form #add-staff-form').prop("action", "insertPerson");
		}
	});
</script>