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
				<button type="button" class="btn btn-default" data-dismiss="modal" onclick="resetRoleDropdown()">Unassign</button> &nbsp;
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
