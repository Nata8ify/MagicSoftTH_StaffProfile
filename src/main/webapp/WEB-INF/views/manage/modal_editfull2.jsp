
<div class="modal fade" id='modal-staff-edit'>
	<div class="modal-dialog" style="width: 80%">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">Profile Editor</h4>
			</div>
			<form name="staff-edit-form" id="staff-edit-form"
				action="editPerson.f" method="POST" enctype="multipart/form-data">
				<div class="modal-body">
					<div class="row control-group">
						<div
							class="form-group col-xs-4 floating-label-form-group controls">
							<label for="editType">Role</label> <select required
								name="editType" class="form-control" id='editType'>
								<option value="m">Manager</option>
								<option value="s">Staff</option>
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
							<label for="honorific">Title</label> <select name="honorific"
								class="form-control" id='honorific'>
								<option value="Mr">Mr.</option>
								<option value="Mrs">Mrs.</option>
								<option value="Ms">Ms.</option>
							</select>
						</div>
						<div
							class="form-group col-xs-3 floating-label-form-group controls">
							<label for="name">Name and Surname (English)</label> <input
								type="text" class="form-control" placeholder="Name & Lastname"
								id="name" name='name' maxlength="40" required
								pattern="[a-zA-Z\s\-]+"
								data-validation-required-message="Please enter Name and Lastname.">
							<p class="help-block text-danger"></p>
						</div>
						<div
							class="form-group col-xs-4 floating-label-form-group controls">
							<label for="name">Name and Surname (Local)</label> <input
								type="text" class="form-control"
								placeholder="Name & Lastname (In Local Language)"
								id="nameLocale" name='nameLocale' maxlength="40"
								data-validation-required-message="Please enter Name and Lastname.">
							<p class="help-block text-danger"></p>
						</div>
						<div
							class="form-group col-xs-3 floating-label-form-group controls">
							<input type="hidden" name='birthDate' /> <label for="birthDate">Birth
								Date (A.D. : dd-mm-yyyy)</label> <input class="form-control"
								id="birthDate" required='' placeholder="A.D. as dd-mm-yyyy"
								data-validation-required-message="Please Choose a Birth date of Staff.">
							<p class="help-block text-danger"></p>
						</div>
					</div>
					<div class="row control-group">
						<div
							class="form-group col-xs-6 floating-label-form-group controls">
							<label for="email">Email Address</label>
							<div class="input-group">
								<input type="text" class="form-control"
									placeholder="Email Address" id="email" name='email'
									maxlength="60" required
									data-validation-required-message="Please enter Email Address.">
								<span class="input-group-addon" id="basic-addon2">@magicsoftware.co.th</span>
							</div>
							<p class="help-block text-danger"></p>
						</div>
						<div
							class="form-group col-xs-3 floating-label-form-group controls">
							<label for="tel">Contact Number</label> <input type="tel"
								class="form-control" placeholder="Contact Number (without '-')"
								id="tel" name='tel' maxlength="12" required
								data-validation-required-message="Please enter Contact Number.">
							<p class="help-block text-danger"></p>
						</div>
						<div
							class="form-group col-xs-3 floating-label-form-group controls">
							<label for="tel">Mobile No.</label> <input type="tel"
								class="form-control" placeholder="Mobile No. (without '-')"
								id="mobileTel" name='mobileTel' maxlength="12" required
								data-validation-required-message="Please enter Mobile Contact Number.">
							<p class="help-block text-danger"></p>
						</div>
					</div>
					<div class="row control-group">
						<div
							class="form-group col-xs-5 floating-label-form-group controls">
							<label for="division">Staff's Department <a
								href="#division" data-target="#modal-assign-department"
								data-toggle="modal"> [Choose]</a></label> <input type="text"
								class="form-control" placeholder="Staff's Department"
								id="division" name='division' maxlength="100" required
								data-validation-required-message="Please enter Staff's Department.">
							<p class="help-block text-danger"></p>
						</div>
						<div
							class="form-group col-xs-4 floating-label-form-group controls">
							<label for="position">Staff's Position</label> <input type="text"
								class="form-control" placeholder="Staff's Position"
								id="position" name='position' maxlength="50" required
								data-validation-required-message="Please enter Staff's Position.">
							<p class="help-block text-danger"></p>
						</div>
						<div
							class="form-group col-xs-3 floating-label-form-group controls">
							<input type="hidden" name='startWorkingDate' /> <label
								for="startWorkingDate">Start Working Date (A.D. :
								dd-mm-yyyy)</label> <input class="form-control" id="startWorkingDate"
								required='' placeholder="A.D. as dd-mm-yyyy"
								data-validation-required-message="Start Working Date is Require.">
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
						<!-- Safe to Remove -->
						<div
							class="form-group col-xs-6 floating-label-form-group controls">
							<label>Portrait Image</label>
							<table>
								<tr>
									<td><input type="radio" value="keep"
										name='portraitPathOpt' id='select-portarit-keep' checked>
									<td>
									<td>: Keep No Change</td>
								</tr>
								<tr>
									<td><input type="radio" value="new"
										id='select-portarit-new' name='portraitPathOpt'>
									<td>
									<td>: Upload New Image</td>
									<td>
											<input style="display: none;"
												type="file" class="form-control" id="protraitPathNew"
												name='protraitPath'>
									</td>
								</tr>
								<tr>
									<td><input type="radio" value="default"
										id='select-portarit-default' name='portraitPathOpt'>
									<td>
									<td>: Use No Image</td>
								</tr>
							</table>
						</div>
						<!-- /Safe to Remove -->
					</div>
					<hr>
					<!-- Access Section -->
					<div class="row control-group">
						<div class="form-group col-xs-4  controls">
							<input type="checkbox" class="" id="chkresetpass"
								name='chkresetpass'> <label> : Reset a Password
							</label> <input style="display: none;" class="form-control"
								placeholder="Password" id="password" name='password' required
								data-validation-required-message="Please enter Password."
								disabled>
							<p class="help-block text-danger"></p>
						</div>
						<div class="form-group col-xs-8  controls">
						</div>
					</div>

					<input type="hidden" id="protraitPathOld" name="protraitPathOld" />
					<br>
					<div id="success"></div>
				</div>
				<div class="modal-footer">
				<div id="div-restore-data-sec"  style="float: left;">
					<button type="button" class="btn btn-default" id='btn-restore-default' >Restore to Default</button>
					&nbsp;<i id="i-restore-data-mgs" hidden="">Information Restored</i>
				</div>
				<div id="div-edit-action-sec">
					<button id='btn-submit-edit' type="submit" class="btn btn-success">Submit</button>
					&nbsp;&nbsp; <a href='#' style='color: red' id='lnk-delstaff'><button
							id='btn-submit-delete' type="button" class="btn btn-danger">Delete</button></a>
					&nbsp;&nbsp;
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
				</div>
			</form>
		</div>
	</div>
</div>
<script>
    /* Do somethings when a Document is Ready. */
    $("document").ready(function() {
	/* #birthDate, #startWorkingDate : Mask Date's Format into date these Inputs. */
	$("#birthDate").mask('99-99-9999');
	$("#startWorkingDate").mask('99-99-9999');
    });

    /* 	This Event will disabled the password form and its confirm form 
     if admin prefer to not change this staff's password.  */
    $("#chkresetpass").click(function() {
	if ($(this).prop("checked")) {
	    $.ajax({
		"type" : "post",
		"url" : "utils/genPassword",
		"success" : function(result) {
		    $("#password").val(result);
		}
	    });
	    $("#password").prop("disabled", false);
	    $("#password").css("display", "inline-block");
	} else {
	    $("#password").prop("disabled", true);
	    $("#password").css("display", "none");
	}
    });

    /* btn-restore-default : Restore before Editing Staff's Data into Editor.*/
    $("#btn-restore-default").click(function(){
		var	restoreDataMsg = $("#i-restore-data-mgs");
		appendEditStaffData(thisStaff);
		restoreDataMsg.fadeIn();
		setTimeout(() => {
		    restoreDataMsg.fadeOut();
		}, 3000);
    });
    
    /* This Event will performs the permantly delete action of selected staff. */
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

    /* Listen If Portrait Path Option is Changed */
    $('input[name="portraitPathOpt"]').change(function() {
	switch ($('input[name="portraitPathOpt"]:checked').val()) {
	case "new":
	    $('#protraitPathNew').prop('disabled', false);
	    $('#protraitPathNew').prop('readonly', false);
	    $('#protraitPathNew').prop('required', true);
	    $("#protraitPathNew").css('display', 'inline-block');
	    break;
	case "keep":
	    $('#protraitPathNew').prop('readonly', true);
	    $('#protraitPathNew').prop('required', false);
	    $("#protraitPathNew").css('display', 'none');
	    $('#protraitPathNew').val("");
	    break;
	default:
	    $('#protraitPathNew').prop('disabled', true);
	    $("#protraitPathNew").css('display', 'none');
	    $('#protraitPathNew').prop('required', false);
	}
    });

    $('#protraitPathNew').change(function() {
	if ($(this).val() != null) {
	    $('#select-portarit-new').prop('checked', true);
	}
    });

    /* #birthDate, #startWorkingDate : This is the Date  Formatter after these Input Data is Changed.*/
    $("#birthDate").change(function() {
	$("input[name='birthDate']").val(formatToModelDate($(this).val()));
    });

    $("#startWorkingDate").change(
	    function() {
		console.log(formatToModelDate($(this).val()));
		$("input[name='startWorkingDate']").val(
			formatToModelDate($(this).val()));
	    });
</script>

<script>
    /** Utility Functions **/
    function resetRoleDropdown() {
	//Clean Assign Manager's Dropdown.
	$("#hostManagerName-show").val("Unassigned");
	$("#hostManagerId").val("");
    }

    function formatToModelDate(date) {
	return date.substring(6, 10).concat("-").concat(date.substring(3, 5))
		.concat("-").concat(date.substring(0, 2));
    }
</script>