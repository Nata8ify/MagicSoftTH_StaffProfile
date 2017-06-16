<div class='row'>
	<div class='col-sm-12'>
	<form action="deleteAll" method="post">
		<table class='table table-responsive'>
			<tbody>
			<tr><td colspan="2">Delete Total Staffs From the Database <b style="color: red;">(CAN NOT UNDONE)</b></td></tr>
				
				<tr>
					<td><input type='text' name='confirmPharse' class='form-control' id='input-truncate-confirm' placeholder='Type "CONFIRM_DELETE_ALL"'/></td>
					<td><button disabled class='btn btn-danger' type="submit" id='btn-confirm-deleteall'><i class='glyphicon glyphicon-exclamation-sign'></i> Delete All</button></td>
				</tr>
			</tbody>
		</table>
		</form>
		<script type="text/javascript">
			$('#input-truncate-confirm').keyup(function(){
				if($('#input-truncate-confirm').val() !== 'CONFIRM_DELETE_ALL'){
					$('#btn-confirm-deleteall').prop('disabled', true);
				} else {
					$('#btn-confirm-deleteall').prop('disabled', false);
				}
			});
			
		</script>
	</div>
</div>
