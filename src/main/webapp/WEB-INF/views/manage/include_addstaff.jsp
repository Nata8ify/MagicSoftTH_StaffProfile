<div class="content-box-large box-with-header">
	<form name="add-staff-form" id="add-staff-form" action="insertPerson.f"
		method="POST" enctype="multipart/form-data">
		<div class="row control-group">
			<div class="form-group col-xs-2 floating-label-form-group controls">
				<label for="Staff ID">Staff ID</label> <input type="text"
					class="form-control" placeholder="Staff ID" id="staffId"
					name='staffId' required maxlength="6">
				<p class="help-block text-danger" id="txt-warn-staffId" style="color: red;"></p>
			</div>
			<div class="form-group col-xs-2 floating-label-form-group controls">
				<label for="gen">System Generate</label>
				<button type="button" class="btn btn-default" id='btn-gen-id'>Generate</button>
			</div>
			<div class="form-group col-xs-6 floating-label-form-group controls">
				<label for="insertType">Role</label> <select name="insertType"
					class="form-control" id='insertType'>
					<option value="m" id='opt-manager' >Manager</option>
					<option value="s" id='opt-staff' selected>Staff</option>
				</select>
			</div>
			<div class="form-group col-xs-2 floating-label-form-group controls">
				<br> <input type="hidden" name='hostManagerId'
					id='hostManagerId' />
				<button type="button" class='btn btn-lg btn-info'
					id='btn-assign-mng' disabled>Loading Managers</button>
			</div>
		</div>
		<div class="row control-group">
								<div
									class="form-group col-xs-3 floating-label-form-group controls">
									<label for="honorific">Title</label> <select name="honorific"
										class="form-control" id='honorific'>
										<option value="Mr">Mr.</option>
										<option value="Mrs">Mrs.</option>
										<option value="Ms">Ms.</option>
									</select>
								</div>
								<div
									class="form-group col-xs-4 floating-label-form-group controls">
									<input type="hidden" id="name" name='name' />
									<label for="name">First Name (English)</label> <input
										type="text" class="form-control" placeholder="Firstname (Eng)"
										id="fname" maxlength="40" required
										pattern="[a-zA-Z\s\-]+"
										data-validation-required-message="Please enter Name.">
									<p class="help-block text-danger"></p>
								</div>
								<div
									class="form-group col-xs-5 floating-label-form-group controls">
									<label for="name">Last Name (English)</label> <input
										type="text" class="form-control" placeholder="Lastname (Eng)"
										id="lname"maxlength="40" required
										pattern="[a-zA-Z\s\-]+"
										data-validation-required-message="Please enter Lastname.">
									<p class="help-block text-danger"></p>
								</div>
							</div>
							<div class="row control-group">
								<div
									class="form-group col-xs-3 floating-label-form-group controls"></div>
								<div
									class="form-group col-xs-4 floating-label-form-group controls">
									<input type="hidden" id="nameLocale" name='nameLocale' />
									<label for="name">First Name (Local)</label> <input
										type="text" class="form-control"
										placeholder="First Name (In Local Language)"
										id="fnameLocale"  maxlength="40"
										data-validation-required-message="Please enter Local Firstname.">
									<p class="help-block text-danger"></p>
								</div>
								<div
									class="form-group col-xs-5 floating-label-form-group controls">
									<label for="name">Last Name (Local)</label> <input
										type="text" class="form-control"
										placeholder="Lastname (In Local Language)"
										id="lnameLocale" maxlength="40"
										data-validation-required-message="Please enter Local Lastname.">
									<p class="help-block text-danger"></p>
								</div>
								<script type="text/javascript">
									var inputName = $("#name");
									var inputFirstName = $("#fname");
									var inputLastName = $("#lname");
									var inputNameLocale = $("#nameLocale");
									var inputFirstNameLocal = $("#fnameLocale");
									var inputLastNameLocal = $("#lnameLocale");
									$("#add-staff-form").submit(function(){
									    inputName.val(inputFirstName.val()+" "+inputLastName.val());
									    console.log(inputName.val());
									    inputNameLocale.val(inputFirstNameLocal.val()+" "+inputLastNameLocal.val());
									   
									});
								</script>
							</div>
		<div class="row control-group">
			<div class="form-group col-xs-12 floating-label-form-group controls">
				<input type="hidden" name='birthDate' />
				<label for="birthDate">Birth Date</label> <input
					class="form-control" id="birthDate"    required=''  placeholder="A.D. as dd-mm-yyyy"
					data-validation-required-message="Please Choose a Birth date of Staff." >
				<p class="help-block text-danger"></p>
			</div>
		</div>
<div class="row control-group">
	<div class="form-group col-xs-6 floating-label-form-group controls">
		<label for="email">Email Address</label> 
		<div class="input-group" >
		<input
			class="form-control" placeholder="Email Address" id="email"
			name='email' maxlength="60" required
			data-validation-required-message="Please enter Email Address.">
			<span class="input-group-addon" id="basic-addon2">@magicsoftware.co.th</span>
		</div>
		<p class="help-block text-danger"></p>
	</div>
	<div class="form-group col-xs-3 floating-label-form-group controls">
		<label for="tel">Contact Number</label> <input type="tel"
			class="form-control" placeholder="Contact Number (without '-')" id="tel" name='tel'
			maxlength="12" required 
			data-validation-required-message="Please enter Contact Number. ">
		<p class="help-block text-danger"></p>
	</div>
	<div class="form-group col-xs-3 floating-label-form-group controls">
		<label for="tel">Mobile Contact Number </label> <input type="tel"
			class="form-control" placeholder="Mobile Contact Number (without '-')"
			id="mobileTel" name='mobileTel' maxlength="12" required 
			data-validation-required-message="Please enter Mobile Contact Number.">
		<p class="help-block text-danger"></p>
	</div>
</div>
<div class="row control-group">
	<div class="form-group col-xs-5 floating-label-form-group controls">
		<label for="division">Staff's Department</label> <a href="#division" data-target="#modal-assign-department" data-toggle="modal"> [Choose]</a> <input type="text"
			class="form-control" placeholder="Staff's Department" id="division"
			name='division' maxlength="100" required readonly
			data-validation-required-message="Please enter Staff's Department.">
		<p class="help-block text-danger"></p>
	</div>
	<div class="form-group col-xs-4 floating-label-form-group controls">
		<label for="position">Staff's Position</label> <input type="text"
			class="form-control" placeholder="Staff's Position" id="position"
			name='position' maxlength="50" required=''
			data-validation-required-message="Please enter Staff's Position.">
		<p class="help-block text-danger"></p>
	</div>
	<div class="form-group col-xs-3 floating-label-form-group controls">
	<input type="hidden" name='startWorkingDate' />
		<label for="startWorkingDate">Start Working Date</label> <input
			class="form-control" id="startWorkingDate" 
			 required='' placeholder="A.D. as dd-mm-yyyy"
			data-validation-required-message="Start Working Date is Require.">
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
	<div class="form-group col-xs-2 floating-label-form-group controls">
		<label for="password">Default Password <b id='b-pwd-msg'></b></label> <input
			type="text" class="form-control" placeholder="Password"
			id="password" name='password' 
			data-validation-required-message="Please enter Password.">
		<p class="help-block text-danger" style="color: red;"></p>
	</div>
	<div class="form-group col-xs-10 floating-label-form-group controls"><br>
		<b class="help-block">* Please Keep this Password to this Staff. [No E-mail Forwarding by Now]</b>
	</div>
</div>
<br>
<div id="success"></div>
<div class="row" align="right">
	<div class="form-group col-xs-12">
		<button type="submit" class="btn btn-success btn-lg" id="btn-submit-add-staff"
			disabled="disabled">Submit</button> 
		<button type="reset" class="btn btn-waring btn-lg" id="btn-submit-add-staff"
			id='btn-submit-insert' onclick="resetRoleDropdown()">Reset</button>	
	</div>
</div>
</form>
<br />
<br />
</div>
<script>
    /* System will generate the recomendation and usable MagicSoftware Staff ID. */
    $('#btn-gen-id').click(function() {
	$.ajax({
	    "url" : "${pageContext.request.contextPath}/utils/latestMgsId",
	    "success" : function(rawId) {
		$('#staffId').val(rawId);
		staffIdValidator(rawId);
	    }
	});
    });

    /* If there are no image attrachs in a form then the request will be sent as a normal request. */
    $('#btn-submit').click(function() {
	if ($('#protraitPath').val() == '') {
	    $('form #add-staff-form').removeAttr("enctype");
	    $('form #add-staff-form').prop("action", "insertPerson");
	}
    });

    $("#staffId").change(function(){
		staffIdValidator($(this).val());
    });
    
    /* #birthDate, #startWorkingDate : This is the Date  Formatter after these Input Data is Changed.*/
    $("#birthDate").change(function(){
		$("input[name='birthDate']").val(formatToModelDate($(this).val()));
    });
    
    $("#startWorkingDate").change(function(){
		
		$("input[name='startWorkingDate']").val(formatToModelDate($(this).val()));
    });
    
</script>
<script>
    /* This section will load the manager list to be picked when admin need to assign the manager to staff.*/
    var managers;
    $(document).ready(function() {
	/* #birthDate, #startWorkingDate : Mask Date's Format into date these Inputs. */
	$("#birthDate").mask('99-99-9999');
	$("#startWorkingDate").mask('99-99-9999');
	
	$.ajax({
	    "url" : "${pageContext.request.contextPath}/viewAllMngs?json=true",
	    "success" : function(mlist) {
		managers = $.parseJSON(mlist);
		$('#btn-assign-mng').prop("disabled", false);
		$('#btn-assign-mng').html("Assign Manager");
	    }
	});
	$.ajax({
	    "type" : "post",
	    "url" : "utils/genPassword",
	    "success" : function(result){
		console.log("result : "+result);
			$("#password").val(result);
	    }
	});
    });
    /* modal_pickmng */
    $('#btn-assign-mng')
	    .click(
		    function() {

			$('#mnglist-tbody').html("");
			$.each(
					managers,
					function(index, value) {
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
					    $('#mnglist-tbody')
						    .append(
							    btnAssignHtml
								    .click(function() {
									$(
										'#hostManagerId')
										.val(
											staffId);
									$(
										"#opt-staff")
										.html(
											"Staff (assign to "
												+ name
												+ ")");
									$(
									"#opt-manager")
									.html(
										"Manager (assign to "
											+ name
											+ ")");
									$(
										'#modal-assign-mng')
										.modal(
											'hide');
								    }));
					});
			$('#modal-assign-mng').modal();
			
			
		    });
</script>
<script>
	/** Utility Functions **/
	function staffIdValidator(staffId){
	    $.ajax({
			"url" : "utils/validateStaffId",
			"data" : {staffId : staffId},
	    	"success" : function(isValid){
	    	   var isIdValid = isValid == "true";
	    		$("#btn-submit-add-staff").prop("disabled", !isIdValid);
	    		if(isIdValid){
	    		    $("#txt-warn-staffId").html("");
	    		} else {
	    			$("#txt-warn-staffId").html("\""+staffId.toUpperCase()+"\" is Already Used.");
	    		}
	    	}
	    });
	}
	function resetRoleDropdown(){
	    //Clean Assign Manager's Dropdown.
	    $("#opt-manager").html("Manager");
	    $("#opt-staff").html("Staff");
	    $("#hostManagerId").val("");
	}
	
	function formatToModelDate(date){
	    return date.substring(6,10).concat("-").concat(date.substring(3,5)).concat("-").concat(date.substring(0,2));
	}
</script>