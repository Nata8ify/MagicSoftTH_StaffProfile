<!-- Staff Info Results Modals -->
<div class="modal fade" id="modal-view-manager-info" role="dialog"
	aria-hidden="true" >
	<div class="modal-content" tabindex="-2">
		<div class="close-modal" data-dismiss="modal">
			<div class="lr">
				<div class="rl"></div>
			</div>
		</div>
		<div class="container">
			<div class="row style='margin: auto'">
				<div class="col-lg-12">
					<div class="modal-body" style='margin: auto'
						id='modal-search-result'>
						<h4 id='h4-view-mng-info-title'>TITLE</h4>
						<div class='row' style="vertical-align: middle;">
							<div class='col-sm-2' style="vertical-align: middle;">
								<img id='img-mnginfo-portrait' width='150px'
									class='img img-responsive' />
							</div>
							<div class='col-sm-5'>
								<table class='table table-responsive' id='table-view-mnginfo'>
									<tbody>
										<tr>
											<td></td>
											<td>Staff ID :</td>
											<td><span id='span-mnginfo-staffid'></span></td>
										</tr>
										<tr>
											<td></td>
											<td>Name & Surname :</td>
											<td><span id='span-mnginfo-name-honf'></span><span
												id='span-mnginfo-name'></span> <span
												id='span-mnginfo-name-locale'></span></td>
										</tr>
										<tr>
											<td></td>
											<td>Department :</td>
											<td><span id='span-mnginfo-division'></span></td>
										</tr>
										<tr>
											<td></td>
											<td>Position :</td>
											<td><span id='span-mnginfo-position'></span></td>
										</tr>
										<tr>
											<td></td>
											<td>Working date :</td>
											<td><span id='span-mnginfo-workingdate'></span></td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class='col-sm-5'>
								<table class='table table-responsive'>
									<tbody>
										<tr>
											<td></td>
											<td>E-mail :</td>
											<td><span id='span-mnginfo-email'></span></td>
										</tr>
										<tr>
											<td></td>
											<td>Tel. :</td>
											<td><span id='span-mnginfo-tel'></span></td>
										</tr>
										<tr>
											<td></td>
											<td>Mobile No. :</td>
											<td><span id='span-mnginfo-mobileTel'></span></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						
						<div class='row'>
							<div class='col-lg-12'><hr />
							<br/><h5 id="h5-mng-staff-title"></h5><br/>
								<table id='table-mng-staffs'
									style="text-align: left; width: 100%" class='hover'>
									<thead>
										<tr>
											<th>Staff ID</th>
											<th>Name and Surname</th>
											<th></th>
											<th>E-mail Address</th>
										</tr>
									</thead>
									<tbody></tbody>
								</table>
							</div>
						</div>

						<div class='row'>
							<div class='col-lg-12' style="text-align: right;">
								<br>
								<button style='margin-right: 1%' type="button"
									class="btn btn-default btn-close-modal" data-dismiss="modal">
									<i class="fa fa-times"></i> Close
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
	$("#table-mng-staffs").on("click", "tbody tr", function(evt){
	    var rowData = staffsMngTable.row($(this)).data();
	    setTimeout(() => {
		renderStaffInfoModal(rowData, false);
	    }, 500);
	    log(rowData);
	});
	
</script>