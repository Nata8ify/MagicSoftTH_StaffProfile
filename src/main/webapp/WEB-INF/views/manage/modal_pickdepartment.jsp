<div class="modal fade" id='modal-assign-department'>
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">Assign to Manager</h4>
			</div>
			<div class="modal-body">
				<table class='table table-responsive' id='table-assign-department'>
					<thead>
						<tr>
							<th>Department</th>
							<th></th>
						</tr>
					</thead>
					<tbody id='departmentlist-tbody'>

					</tbody>
				</table>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
<script>
	$("document").ready(function(){
	    $.ajax({
			"type" : "POST",
			"url" : "department/departments",
			"success" : function(departmens){
			    var departmentRow;
			    $.each($.parseJSON(departmens), function(index, val){
					departmentRow = $("<tr><td>"+val.department+"</td><td><button class='btn btn-default'><i class='glyphicon glyphicon-thumbs-up'></i></button></td></tr>").click(function(){
					    $("#division").val(val.department);
					    $("#modal-assign-department").modal("hide");
					}); 
			    	$("#departmentlist-tbody").append(departmentRow);
			    });
			},
			"error"  : function(exc){}
	    });
	});
</script>