<div class="content-box-large box-with-header">
	<h3>Managers</h3>
	<hr>
	<table class="table table-responsive" id='table-managers'>
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
	<h3>Staffs</h3>&nbsp;<h3 id='h3-of-mng'><!-- Of The Manager --></h3>
	&nbsp;<button class='btn btn-default' id='btn-bind-this-staff'>Bind Staff</button>
	&nbsp;<button class='btn btn-warning' id='btn-transfer-all'>Transfer All</button>
	&nbsp;<button class='btn btn-danger' id='btn-unbind-all'>Unbind All</button>
	<hr>
	<table class="table table-responsive" id='table-staffs-assigned'>
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
	<table class="table table-responsive" id='table-staffs-unassigned'>
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
<div class="modal fade" id='modal-assign-mng'>
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">Assign to Manager</h4>
			</div>
			<div class="modal-body">
				<table class='table table-responsive' id='table-assign-mng'>
					<thead>
						<tr>
							<th colspan="1"></th>
							<th colspan="1" id='td-mng-id'></th>
							<th colspan="2" id='td-mng-name'></th>
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
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>