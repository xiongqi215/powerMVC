<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<div class="container">
	<div class="panel panel-info">
		<div class="panel-heading">login</div>
		<div class="panel-body">
			<form>
				<div class="input-group">

					<span class="input-group-addon" id="basic-addon1">User Id:</span> <input
						type="text" class="form-control" aria-describedby="basic-addon1"
						name=""> 
					<span class="input-group-addon" id="basic-addon2">Password:</span>
					<input type="text" class="form-control"
						aria-describedby="basic-addon2" name="">
				</div>


				<div class="btn-toolbar" role="toolbar" aria-label="...">
					<div class="btn-group" role="group" aria-label="...">
						<button type="button" class="btn btn-default">Login</button>
					</div>
					<div class="btn-group" role="group" aria-label="...">
						<button type="button" class="btn btn-default">Cancel</button>
					</div>
				</div>
			</form>

		</div>
	</div>
</div>