
/** initial stuffs * */
var staffsTable; /* Data Table */
var staffs; /* This is a total staffs. */
var managers; /* This is a total managers. */
var staffList; /* This is a actual total staffs [include manager]. */
var isStaffsReady = false;
var isManagerReady = false;
var isStaffListReady = false;
$(document).ready(function () {
    	
	appendSearchDepartmentModule(findAllDepartment());
	$.ajax({
		"url": "viewAllStaffs?json=true",
		"success": function (slist) {
			staffs = $.parseJSON(slist);
		}
	});
	$.ajax({
		"url": "viewAllMngs?json=true",
		"success": function (mlist) {
			managers = $.parseJSON(mlist);
		}
	});

	$.when($.ajax({
		"url": "viewAll?json=true"
	})).then(function (json) {
		staffList = $.parseJSON(json);
	});
});


var modeSearch = 'namelike'; /* As Default */
$('input[name = "modeSearch"]').click(function () {
	$('#input-search').prop('disabled', false);
	modeSearch = $(this).val();
	switch ($(this).val()) {
		case 'namelike':
			$('#input-search').prop("placeholder", "By Name Search");
			$('#label-search').html("By Name Search");
			break;
		case 'bymng':
			/* Pop the Modal Manager up! */

			$('#input-search').prop('disabled', true);
			pickMngModal();
			break;
		case 'staffid':
			$('#input-search').prop("placeholder", "By Staff ID Search");
			$('#label-search').html("By Staff ID Search");
			break;
		case 'viewAll':
			$('#input-search').prop("placeholder", "'Search' to View");
			$('#input-search').prop('disabled', true);
			break;
		default: // TODO
	}
});

/* modal_pickmng */
function pickMngModal() {
	$('#mnglist-tbody').html("");
	$
		.each(
		managers,
		function (index, value) {
			var staffId = value.staffId;
			var portraitPath = value.protraitPath == null ? 'noimg.png'
				: value.protraitPath;
			var name = value.name;
			var position = value.position;
			var btnAssignHtml = $("<tr><td><img style='text-align:center' width='70px' class='img-respomsive' src='resources/portraits/"
				+ portraitPath
				+ "' alt='Manager's Portriat'/></td><td>"
				+ staffId
				+ "</td><td>"
				+ name
				+ "</td><td>"
				+ position
				+ "</td><td><button class='btn btn-default btn-assign-mng'><i class='glyphicon glyphicon-ok'></i></button></td></tr>");
			$('#mnglist-tbody').append(
				btnAssignHtml.click(function () {
					searchStaff(modeSearch, staffId);
					$('#modal-assign-mng')
						.modal('hide');

					/* TODO Render */

					$('#h2-view-staff-topic').html(
						"Results for (" + name
						+ ").");
					$('#modal-view-staff').modal();
				}));
		});
	$('#modal-assign-mng').modal();
};

var tmpSearcTotalStaffs; /*
				     * keep the everytime search result. But
				     * this included total staff/manager.
				     */
var tmpSearchStaffs; /* keep the everytime search result. */
var tmpSearchManagers; /* keep the everytime search result. */
var tmpSearchStaffOrMng; /* Just Single Staff / Manager Result. */
function searchStaff(mode, searchElement) {
	searchElement = searchElement.trim();
	tmpSearcTotalStaffs = [];
	tmpSearchStaffs = [];
	tmpSearchManager = [];
	var cardResultBody = null; /* Keep it to build appened body. */
	log(mode + " :: " + searchElement);
	var tableResultBody = $('#table-search-staff-list tbody');
	tableResultBody.empty();
	var searchTitle;
	var isEmpty = true;
	switch (mode) {
		case 'bymng':
			tmpSearchStaffOrMng = null;
			$.each(staffList, function (index, val) {
				if (val.hostManagerId == searchElement.toUpperCase()) {
					tmpSearchStaffs.push(val);
					/* TODO FOund Staff */
					renderRowStaffSearchResult(val, tableResultBody);
				}
				if (val.staffId == searchElement) {
					tmpSearchStaffOrMng = val;

				}
			});
			log(tmpSearchStaffOrMng);
			if (tmpSearchStaffs != null) {
				$('#h2-view-staff-topic').html(
					"Staffs of [" + tmpSearchStaffOrMng.name + "].");
				isEmpty = false;
			} else {
				searchTitle = "No Staffs of [" + tmpSearchStaffOrMng.name
					+ "].";
				isEmpty = true;
			}
			break;
		case 'staffid':
			tmpSearchStaffOrMng = null;
			$.each(staffList, function (index, val) {
				if (val.staffId.toUpperCase() == searchElement
					.toUpperCase()) {
					tmpSearchStaffOrMng = val;
				}
			});
			log(tmpSearchStaffOrMng);
			/* TODO Render */
			if (tmpSearchStaffOrMng != null) {
				switch (tmpSearchStaffOrMng.staffType) {
					case 's': renderStaffInfoModal(tmpSearchStaffOrMng, true); break;
					case 'm': prependStaffsManagerDialog(tmpSearchStaffOrMng.staffId); break;
				}
			} else {
				alert(searchElement + " is Not Found.");
			}
			return;
		default: // TODO
	}
	if (!isEmpty) {
		$('#modal-view-staff').modal();
		$('#h2-view-staff-topic').html(searchTitle);
	} else {
		alert("No Result For \"" + searchElement + "\".");
	}
}

/* For Render a Set of Result as Table's Row */
function renderRowStaffSearchResult(val, tableResultBody) {
	tmpSearcTotalStaffs.push(val);
	var protraitPath = val.protraitPath == null ? 'noimg.png'
		: val.protraitPath;
	var honorific = val.honorific;
	var name = val.name;
	var email = val.email;
	var tel = val.tel;
	var division = val.division;
	var position = val.position;
	var hostManagerName = val.hostManagerName;
	var staffType = val.staffType;
	var staffId = val.staffId;
	var nameLocaleFmt = val.nameLocale == null ? "" : ("<br/>("
		+ val.nameLocale + ")");
	var rowResultBody = $("<tr><td>" + staffId + "</td><td>"
		+ honorific + " " + name + nameLocaleFmt + "</td><td>"
		+ email + "</td></tr>");
	tableResultBody.append(rowResultBody.click(function () {
		if (staffType === 's') {
			renderStaffInfoModal(val, true);
		} else if (staffType === 'm') {
			renderManagerInfoModal(val);
		}

	}));
}

/*
 * For Render Selected Staff Information. [Bind 'val' On
 * renderRowStaffSearchResult]
 */
function renderStaffInfoModal(val, isMngViewInclude) {

	var protraitPath = val.protraitPath == null ? 'noimg.png'
		: val.protraitPath;
	var honorific = val.honorific;
	var name = val.name;
	var nameLocale = val.nameLocale;
	var email = val.email;
	var tel = val.tel;
	var mobileTel = val.mobileTel;
	var division = val.division;
	var position = val.position;
	var manager = findManagerByManagerId(val.hostManagerId); // <-Better
	// than
	// 3
	// lines
	// down
	// below.
	var hostManagerId = val.hostManagerId;
	var hostManagerName = val.hostManagerName; // <-Defauq?
	var hostManagerNameLocale = val.hostManagerNameLocale; // <-Defauq?
	var hostManagerEmail = val.hostManagerEmail; // <-Defauq?
	var staffType = val.staffType;
	var startWorkingDate = val.startWorkingDate;

	$('#span-info-workingdate').html(
		startWorkingDate != null ? startWorkingDate
			: "Not Available");

	var staffId = val.staffId;
	$('#h4-view-staff-info-title').html("Information of " + name);
	$('#span-info-staffid').html(staffId);
	$('#img-info-portrait').attr('src',
		"resources/portraits/" + protraitPath);
	$('#span-info-name-honf').html(honorific + ". ");
	$('#span-info-name').html(name);
	/* $('#pan-info-name-local-honf').html(""); */
	if (nameLocale != "" && nameLocale != null) {
		$('#span-info-name-locale').html(
			nameLocale == "" ? ""
				: ("<br/>(" + nameLocale + ")"));
	}
	$('#span-info-email').html(email);
	$('#span-info-tel').html(tel);
	$('#span-info-mobileTel').html(
		mobileTel == null ? '' : mobileTel);
	$('#span-info-division').html(division);
	$('#span-info-position').html(position);
	if (staffType === 's') {
		$('#table-staff-mng-info').show();
		if (manager !== null) {
			$('#span-info-name-mng-honf').html(
				manager.honorific + ". ");
			$('#span-info-mng').html(hostManagerName);
			if(hostManagerNameLocale != "" && hostManagerNameLocale != null){
			$('#span-info-name-mng-locale').html(
				" <br/>(" + hostManagerNameLocale + ")");}
			$('#span-info-mng-email').html(hostManagerEmail);
			$('#btn-view-thismng').prop("disabled", false);
			$('#btn-view-thismng').data("managerId",
				manager.staffId); // Keep manager in
			// data-manager.
		} else {
			$('#span-info-name-mng-honf').html("");
			$('#span-info-name-mng-locale').html("");
			$('#span-info-mng').html("-");
			$('#span-info-mng-email').html("-");
			$('#btn-view-thismng').prop("disabled", true);
		}
	} else {
		$('#table-staff-mng-info').hide();
	}
	$('#modal-view-staff-info').modal();
	if (isMngViewInclude) {
		$('#table-staff-mng-info').show();
	} else {
		$('#table-staff-mng-info').hide();
		log(false);
	}
}

/* For Render Selected Manager Information. */
function renderManagerInfoModal(val) {
	var protraitPath = val.protraitPath == null ? 'noimg.png'
		: val.protraitPath;
	var honorific = val.honorific;
	var name = val.name;
	var nameLocale = val.nameLocale;
	var email = val.email;
	var tel = val.tel;
	var mobileTel = val.mobileTel;
	var division = val.division;
	var position = val.position;
	var manager = findManagerByManagerId(val.hostManagerId); // <-Better
	// than
	// 3
	// lines
	// down
	// below.
	var hostManagerId = val.hostManagerId;
	var hostManagerName = val.hostManagerName; // <-Defauq?
	var hostManagerNameLocale = val.hostManagerNameLocale; // <-Defauq?
	var hostManagerEmail = val.hostManagerEmail; // <-Defauq?
	var staffType = val.staffType;
	var startWorkingDate = val.startWorkingDate;
	$('#span-mnginfo-workingdate').html(
		startWorkingDate != null ? startWorkingDate
			: "Not Available");

	var staffId = val.staffId;

	$('#h4-view-mng-info-title').html("Information of " + name);
	$('#h5-mng-staff-title').html("Staffs of " + honorific + ". " + name);
	$('#span-mnginfo-staffid').html(staffId);
	$('#img-mnginfo-portrait').attr('src',
		"resources/portraits/" + protraitPath);
	$('#span-mnginfo-name-honf').html(honorific + ". ");
	$('#span-mnginfo-name').html(name);
	/* $('#pan-info-name-local-honf').html(""); */
	if (nameLocale != "" && nameLocale != null) {
		$('#span-mnginfo-name-locale').html(
			nameLocale == "" ? "" : ("<br/>(" + nameLocale + ")"));
	}
	$('#span-mnginfo-email').html(email);
	$('#span-mnginfo-tel').html(tel);
	$('#span-mnginfo-mobileTel').html(
		mobileTel == null ? '' : mobileTel);
	$('#span-mnginfo-division').html(division);
	$('#span-mnginfo-position').html(position);
	$('#table-staff-mng-info').show();
	if (manager !== null) {
		$('#span-info-name-mng-honf').html(
			manager.honorific + ". ");
		$('#span-mnginfo-mng').html(manager.name);
		if (manager.nameLocale != "" && manager.nameLocale != null) {
		$('#span-mnginfo-name-mng-locale').html(
			" <br/>(" + manager.nameLocale + ")");}
		$('#span-mnginfo-mng-email').html(manager.email);
		$('#btn-mngview-thismng').prop("disabled", false);
		$('#btn-mngview-thismng').data("managerId",
			manager.staffId); // Keep manager in data-manager.
	} else {
		$('#span-mnginfo-name-mng-honf').html("");
		$('#span-mnginfo-name-mng-locale').html("");
		$('#span-mnginfo-mng').html("-");
		$('#span-mnginfo-mng-email').html("-");
		$('#btn-mngview-thismng').prop("disabled", true);
	}
	$("#modal-view-manager-info").modal();
}

function log(str) {
	console.log(str);
}

/*
 * Not understand this trick so much! but will come to see another day,
 * lol.
 */
$(document).on(
	'hidden.bs.modal',
	'.modal',
	function () {
		$('.modal:visible').length
			&& $(document.body).addClass('modal-open');
	});

$('#modal-view-staff, #modal-view-staff-info').on('hidden.bs.modal',
	function (e) {
		$('#btn-search').prop('disabled', false);
	});
$('#modal-view-staff, #modal-view-staff-info').on('shown.bs.modal',
	function (e) {
		$('#btn-search').prop('disabled', true);
	});


/** LISTENER * */
/*
 * #table-total-staff : When User Select Staff Data Row then.. make it
 * Display Information.
 */
$('#table-total-staff').on('click', 'tbody tr', function (evt) {
	var selectedStaffId = staffsTable.row($(this)).data().staffId;
	searchStaff('staffid', selectedStaffId);
});

/*
 * #select-filter-staff-type : Filter the type of Staff Requested to
 * View.
 */
$("#select-filter-staff-by").change(function () {
    var isShow = false;
	switch ($(this).val()) {
		case "all": updateMainStaffTable(staffsTable, staffList); break;
		case "s": updateMainStaffTable(staffsTable, staffs); break;
		case "m": updateMainStaffTable(staffsTable, managers); break;
		case "department": isShow = true;
	}
	slideFadeDepartmentSearch(isShow);
});

/* #btn-view-thismng : Listening View Manager Info Nutton */
var staffsMngTable;
$("#btn-view-thismng, #btn-mngview-thismng").click(function () {
	$("#modal-view-staff-info").modal("hide");
	prependStaffsManagerDialog($(this).data("managerId"));
});
function prependStaffsManagerDialog(managerId) {
	var manager = findManagerByManagerId(managerId);
	renderManagerInfoModal(manager);
	setTimeout(() => {
		var mngStaffs = findStaffByManagerId(manager.staffId);
		if (staffsMngTable == undefined) {
			staffsMngTable = $("#table-mng-staffs").DataTable({
				"data": mngStaffs,
				"columns": [{
					"data": "staffId",
					"width": "20%"
				}, {
					"data": "name",
					"width": "30%"
				}, {
					"data": "nameLocale",
					"width": "30%"
				}, {
					"data": "email",
					"width": "20%"
				}],
				"language": {
				        searchPlaceholder: "ID, Name, E-mail"
				    }
			});
		} else {
			updateMainStaffTable(staffsMngTable, mngStaffs);
		}
	}, 700);
}
/**
 * #select-filter-staff-by-department : When Option of Search By
 * Department was selected *
 */
$("#select-filter-staff-by-department").change(function (evt) {
	var staffsOnDepartment = findStaffByDepartment($(this).val());
	updateMainStaffTable(staffsTable, staffsOnDepartment);
});

/** Utility Functions * */
function updateMainStaffTable(dataTable, staffs) {
	dataTable.clear().draw();
	dataTable.rows.add(staffs);
	dataTable.columns.adjust().draw();
}
function getTHHonorofic(honorofic) {
	switch (honorofic) {
		case "Mr":
			return "นาย";
		case "Mrs":
			return "นางสาว";
		case "Ms":
			return "นาง";
	}
}
/* Setup Staffs Table */
function setUpStaffsTable(){
    staffsTable = $('#table-total-staff').DataTable(
		{
			"ajax": {
				"url": "viewAll?json=true",
				"dataSrc": ""
			},
			"columns": [{
				"data": "staffId",
				"width": "20%"
			}, {
				"data": "name",
				"width": "30%"
			}, {
				"data": "nameLocale",
				"width": "30%"
			}, {
				"data": "email",
				"width": "20%"
			}],
			"columnDefs": [{
				targets: -1,
				orderable: false
			}] /* E-mail is Unorderable */
			,
			"pageLength": 10,
			"language": {
			        searchPlaceholder: "ID, Name, E-mail"
			    }
		});
}

/* Method's Name says Everythings. */
function findManagerByManagerId(managerId) {
	var manager;
	$.each(managers, function (index, val) {
		if (val.staffId == managerId) {
			manager = val;
		}
	});
	if (manager === undefined) {
		return null;
	}
	return manager;
}
function findStaffByManagerId(managerId) {
	var mngStaffs = [];
	$.each(staffList, function (index, val) {
		if (val.hostManagerId == managerId) {
			mngStaffs.push(val);
		}
	});
	return mngStaffs;
}
var departments = []; // Collection of Departments.
function findAllDepartment() {
	$.ajax({
		"type": "POST",
		"url": "adm/department/departments",
		"success": function (departments) {
			departments = $.parseJSON(departments);
			appendSearchDepartmentModule(departments);
			return departments;
		}
	});
	return null;
}
function findStaffByDepartment(department) {
	var staffsOnDepartment = [];
	$.each(staffList, function (index, val) {
		if (val.division == department) {
			staffsOnDepartment.push(val);
		}
	});
	return staffsOnDepartment;
}
/*
  * To Append Values and Manage Deaprtment's Listener into Department's
  * Dropdown.
  */
function appendSearchDepartmentModule(departments) {
	var optionData;
	var department;
	$.each(departments, function (index, val) {
		department = val.department;
		optionData = $("<option value='" + department + "'>" + department + "</option>");
		$("#select-filter-staff-by-department").append(optionData);
	});
}