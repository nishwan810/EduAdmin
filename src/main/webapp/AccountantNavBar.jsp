<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
	<div class="container-fluid">
		<a class="navbar-brand" href="AccountantDashboard.jsp">Accountant
			Panel</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav ms-auto">
				<li class="nav-item"><a class="nav-link" href="CollectFee.jsp">Collect
						Fee</a></li>
				<li class="nav-item"><a class="nav-link"
					href="IssueReceipt.jsp">Issue Receipt</a></li>
				<li class="nav-item"><a class="nav-link"
					href="ExpenseManagement.jsp">Expense Management</a></li>
				<li class="nav-item"><a class="nav-link"
					href="FinancialReports.jsp"> <i class="bi bi-file-earmark-text"></i>
						Financial Reports
				</a></li>
				<li>
					<button type="button" class="btn btn-danger" data-bs-toggle="modal"
						data-bs-target="#logoutModal">Logout</button>
				</li>
			</ul>
		</div>
	</div>


	<!-- Logout Confirmation Modal -->
	<div class="modal fade" id="logoutModal" tabindex="-1"
		aria-labelledby="logoutModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title " id="logoutModalLabel">Confirm Logout</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">Are you sure you want to logout?</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Cancel</button>
					<a href="LoginPage.jsp" class="btn btn-danger">Logout</a>
				</div>
			</div>
		</div>
	</div>
</nav>
