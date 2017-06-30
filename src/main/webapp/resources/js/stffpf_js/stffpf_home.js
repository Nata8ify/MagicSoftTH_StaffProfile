
	/* initial stuffs */
	var Table; /* Data Table */
	var managers;
	var staffList; /* This is a total */
	var isReady = false;
	var isManagerReady = false;
	var isStaffListReady = false;
	$(document)
		.ready(
			function() {
			    $.ajax({
				"url" : "viewAll?json=true",
				"success" : function(slist) {
				     = $.parseJSON(slist);
				    console.log();
				    isReady = true;
				    enableSearch();
				}
			    });
			    $.ajax({
				"url" : "viewAllMngs?json=true",
				"success" : function(mlist) {
				    managers = $.parseJSON(mlist);
				    console.log(managers);
				    isManagerReady = true;
				    enableSearch();
				}
			    });
			    Table = $('#table-total-staff')
				    .DataTable(
					    {
						"ajax" : {
						    "url" : "${pageContext.request.contextPath}/viewAll?json=true",
						    "dataSrc" : ""
						},
						"columns" : [ {
						    "data" : "staffId",
						    "width" : "20%"
						}, {
						    "data" : "name",
						    "width" : "30%"
						}, {
						    "data" : "nameLocale",
						    "width" : "30%"
						}, {
						    "data" : "email",
						    "width" : "20%"
						} ],
						"columnDefs" : [ {
						    targets : -1,
						    orderable : false
						} ] /* E-mail is Unorderable */
						,
						"bFilter" : false,
						"pageLength" : 50
					    });

			});

	function enableSearch() {
	    if (isStaffListReady & isManagerReady & isReady) {
		$('#btn-search').prop('disabled', false);
	    }
	}

	/* Staff List Listener */
	$('#table-total-staff').on('click', 'tbody tr', function(evt) {
	    var selectedStaffId = Table.row($(this)).data().staffId;
	    searchStaff('staffid', selectedStaffId);
	});

	var modeSearch = 'namelike'; /* As Default */
	$('input[name = "modeSearch"]').click(function() {
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
	    default: //TODO
	    }
	});

	/* modal_pickmng */
	function pickMngModal() {
	    $('#mnglist-tbody').html("");
	    $
		    .each(
			    managers,
			    function(index, value) {
				var staffId = value.staffId;
				var portraitPath = value.protraitPath == null ? 'noimg.png'
					: value.protraitPath;
				var name = value.name;
				var position = value.position;
				var btnAssignHtml = $("<tr><td><img style='text-align:center' width='70px' class='img-respomsive' src='${contextPath}/resources/portraits/"
										+ portraitPath
										+ "' alt='Manager's Portriat'/></td><td>"
					+ staffId
					+ "</td><td>"
					+ name
					+ "</td><td>"
					+ position
					+ "</td><td><button class='btn btn-default btn-assign-mng'><i class='glyphicon glyphicon-ok'></i></button></td></tr>");
				$('#mnglist-tbody').append(
					btnAssignHtml.click(function() {
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

	/* Action after do Searching */
	$('#btn-search').click(
		function() {
		    log($('#input-search').is(":disabled"));
		    if ($('#input-search').val() != ''
			    || $('#input-search').is(":disabled")) {

			var searchElement = $('#input-search').val();
			searchStaff(modeSearch, searchElement);
		    } else {
			alert("Empty Field is Unaccepted.");
		    }
		});

	var tmpSearcTotal; /* keep the everytime search result. But this included total staff/manager. */
	var tmpSearch; /* keep the everytime search result. */
	var tmpSearchManagers; /* keep the everytime search result. */
	var tmpSearchStaffOrMng; /* Just Single Staff / Manager Result. */
	function searchStaff(mode, searchElement) {
	    searchElement = searchElement.trim();
	    tmpSearcTotal = [];
	    tmpSearch = [];
	    tmpSearchManager = [];
	    var cardResultBody = null; /* Keep it to build appened body.*/
	    log(mode + " :: " + searchElement);
	    var tableResultBody = $('#table-search-staff-list tbody');
	    tableResultBody.empty();
	    var searchTitle;
	    var isEmpty = true;
	    switch (mode) {
	    case 'namelike':
		$.each(staffList, function(index, val) {
		    if (val.name.toUpperCase().indexOf(
			    searchElement.toUpperCase()) !== -1
			    | val.nameLocale.indexOf(searchElement) !== -1) {
			renderRowearchResult(val, tableResultBody);
		    }
		});
		if (tmpSearcTotal.length > 0) {
		    searchTitle = "Results of By Name Search ("
			    + tmpSearcTotal.length + ").";
		    isEmpty = false;
		} else {
		    isEmpty = true;
		    searchTitle = "No Results for \"" + searchElement + "\".";
		}

		log(tmpSearcTotal);
		/* appendNameLikeSearchResult(); */
		break;
	    case 'bymng':
		tmpSearchStaffOrMng = null;
		$.each(staffList, function(index, val) {
		    if (val.hostManagerId == searchElement.toUpperCase()) {
			tmpSearch.push(val);
			/* TODO FOund Staff */
			renderRowearchResult(val, tableResultBody);
		    }
		    if (val.staffId == searchElement) {
			tmpSearchStaffOrMng = val;
		    }
		});
		log(tmpSearchStaffOrMng);
		if (tmpSearch != null) {
		    $('#h2-view-staff-topic').html(
			    " of [" + tmpSearchStaffOrMng.name + "].");
		    isEmpty = false;
		} else {
		    searchTitle = "No  of [" + tmpSearchStaffOrMng.name
			    + "].";
		    isEmpty = true;
		}

		log(tmpSearchStaffOrMng);
		log(tmpSearch);
		break;
	    case 'staffid':
		tmpSearchStaffOrMng = null;
		$.each(staffList, function(index, val) {
		    if (val.staffId.toUpperCase() == searchElement
			    .toUpperCase()) {
			tmpSearchStaffOrMng = val;
			renderStaffInfoModal(val);

		    }
		});
		log(tmpSearchStaffOrMng);
		if (tmpSearchStaffOrMng != null) {
		    $('#modal-view-staff-info').modal();
		} else {
		    alert(searchElement + " is Not Found.");
		}
		return;
	    case 'viewAll':
		tmpSearchStaffOrMng = null;
		tmpSearch = staffList; /* This is a total */
		tmpSearch = ;
		tmpSearchManagers = managers;
		if (staffList == []) {
		    isEmpty = true;
		    break;
		}
		$.each(staffList, function(index, val) {
		    tmpSearch.push(val);
		    renderRowearchResult(val, tableResultBody);
		});
		isEmpty = false;
		$('#h2-view-staff-topic').html("Magic Software Staff's Board.");
		break;
	    default: //TODO
	    }
	    if (!isEmpty) {
		$('#modal-view-staff').modal();
		$('#h2-view-staff-topic').html(searchTitle);
	    } else {
		alert("No Result For \"" + searchElement + "\".");
	    }
	}

	function renderDialogToMode(staff) {
	    if (staff.staffType === 's') {
		renderStaffInfoModal(staff);
	    } else if (staff.staffType === 'm') {
		renderManagerInfoModal(staff);
	    }
	}

	/* For Render a Set of Result as Table's Row */
	function renderRowearchResult(val, tableResultBody) {
	    tmpSearcTotal.push(val);
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
	    var nameLocaleFmt = val.nameLocale == "" ? "" : ("<br/>("
		    + val.nameLocale + ")");
	    var rowResultBody = $("<tr><td>" + staffId + "</td><td>"
		    + honorific + " " + name + nameLocaleFmt + "</td><td>"
		    + email + "</td></tr>");
	    tableResultBody.append(rowResultBody.click(function() {
		renderDialogToMode(val);
	    }));
	}
	
	


	/* For Render Selected Staff Information. [Bind 'val' On renderRowearchResult]*/
	function renderStaffInfoModal(val) {
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
	    var manager = findManagerByManagerId(val.hostManagerId); //<-Better than 3 lines below.
	    var hostManagerId = val.hostManagerId;
	    var hostManagerName = val.hostManagerName; //<-Defauq?
	    var hostManagerNameLocale = val.hostManagerNameLocale; //<-Defauq?
	    var hostManagerEmail = val.hostManagerEmail; //<-Defauq?
	    var staffType = val.staffType;
	    var startWorkingDate = val.startWorkingDate;
	    $('#span-info-workingdate').html(
		    startWorkingDate != null ? startWorkingDate
			    : "Not Available");

	    var staffId = val.staffId;
	    $('#h4-view-staff-info-title').html("Information of " + name);
	    $('#span-info-staffid').html(staffId);
	    $('#img-info-portrait').attr('src',
		    "${contextPath}/resources/portraits/" + protraitPath);
	    $('#span-info-name-honf').html(honorific + ". ");
	    $('#span-info-name').html(name);
	    /* $('#pan-info-name-local-honf').html(""); */
	    if (nameLocale != "" || nameLocale != null) {
		$('#span-info-name-locale').html(
			nameLocale == "" ? "" : ("<br/>(" + nameLocale + ")"));
	    }
	    $('#span-info-email').html(email);
	    $('#span-info-tel').html(tel);
	    $('#span-info-mobileTel').html(mobileTel == null ? '' : mobileTel);
	    $('#span-info-division').html(division);
	    $('#span-info-position').html(position);
	    if (staffType === 's') {
		$('#table-staff-mng-info').show();
		if (manager !== null) {
		    $('#span-info-name-mng-honf')
			    .html(manager.honorific + ". ");
		    $('#span-info-mng').html(hostManagerName);
		    $('#span-info-name-mng-locale').html(
			    " <br/>(" + hostManagerNameLocale + ")");
		    $('#span-info-mng-email').html(hostManagerEmail);
		    $('#btn-view-thismng').data("managerId", manager.staffId); //Keep manager in data-manager.
		} else {
		    $("#btn-view-thismng").prop("hidden", true);
		    $('#span-info-name-mng-honf').html("");
		    $('#span-info-name-mng-locale').html("");
		    $('#span-info-mng').html("-");
		    $('#span-info-mng-email').html("-");
		    $('#btn-view-thismng').data("managerId", null); //Keep 'null' in data-manager.
		}
	    } else {
		$('#table-staff-mng-info').hide();
	    }
	    $('#modal-view-staff-info').modal();
	}

	/* For Render Selected Manager Information.*/
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
	    var manager = findManagerByManagerId(val.hostManagerId); //<-Better than 3 lines below.
	    var hostManagerId = val.hostManagerId;
	    var hostManagerName = val.hostManagerName; //<-Defauq?
	    var hostManagerNameLocale = val.hostManagerNameLocale; //<-Defauq?
	    var hostManagerEmail = val.hostManagerEmail; //<-Defauq?
	    var staffType = val.staffType;
	    var startWorkingDate = val.startWorkingDate;
	    $('#span-mnginfo-workingdate').html(
		    startWorkingDate != null ? startWorkingDate
			    : "Not Available");

	    var staffId = val.staffId;
	    $('#h4-view-mng-info-title').html("Information of " + name);
	    $('#span-mnginfo-staffid').html(staffId);
	    $('#img-mnginfo-portrait').attr('src',
		    "${contextPath}/resources/portraits/" + protraitPath);
	    $('#span-mnginfo-name-honf').html(honorific + ". ");
	    $('#span-mnginfo-name').html(name);
	    /* $('#pan-info-name-local-honf').html(""); */
	    if (nameLocale != "" || nameLocale != null) {
		$('#span-mnginfo-name-locale').html(
			nameLocale == "" ? "" : ("<br/>(" + nameLocale + ")"));
	    }
	    $('#span-mnginfo-email').html(email);
	    $('#span-mnginfo-tel').html(tel);
	    $('#span-mnginfo-mobileTel').html(
		    mobileTel == null ? '' : mobileTel);
	    $('#span-mnginfo-division').html(division);
	    $('#span-mnginfo-position').html(position);
	    $("#modal-view-manager-info").modal("show");
	}

	function log(str) {
	    console.log(str);
	}

	/* Just for the manager view their . */
	$('#a-view-my-staff').click(function() {
	    searchStaff("bymng", "${thisStaff.staffId}");
	});

	/* Utilities */
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

	/* Not understand this trick so much! but will come to see another day, lol. */
	$(document).on(
		'hidden.bs.modal',
		'.modal',
		function() {
		    $('.modal:visible').length
			    && $(document.body).addClass('modal-open');
		});

	$('#modal-view-staff, #modal-view-staff-info').on('hidden.bs.modal',
		function(e) {
		    $('#btn-search').prop('disabled', false);
		});
	$('#modal-view-staff, #modal-view-staff-info').on('shown.bs.modal',
		function(e) {
		    $('#btn-search').prop('disabled', true);
		});

	/* Method's Name says Everythings. */
	function findManagerByManagerId(managerId) {
	    var manager = null;
	    $.each(managers, function(index, val) {
		if (val.staffId == managerId) {
		    manager = val;
		}
	    });
	    if (manager === undefined) {
		return null;
	    }
	    return manager;
	}
	/** LISTENER **/
	/* #btn-view-thismng : Listening View Manager Info Nutton */
	$("#btn-view-thismng").click(
		function() {
		    $("#table-mng-staff-list").empty();
		    var manager = findManagerByManagerId($(this).data(
			    "managerId"));
		    log("is null " + manager == null);
		    if (manager === null) {
			alert("No Result of Manager of this Staff.");
			return;
		    }
		    
		    
		    $.each(staffList, function(index, val) {
			if (val.hostManagerId == manager.staffId) {
			    mng.push(val);
			    renderRowMngearchResult(val, $("#table-mng-staff-list"));
			}
			log(mng);
		    });
		    renderManagerInfoModal(manager);
		    log("manager- : " + manager.name);

		});
	
	/* For Render a Set of Staff Of Manager Result as Table's Row */
	function renderRowMngearchResult(val, tableResultBody) {
	    tmpSearcTotal.push(val);
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
	    var nameLocaleFmt = val.nameLocale == "" ? "" : ("<br/>("
		    + val.nameLocale + ")");
	    var rowResultBody = $("<tr><td>" + staffId + "</td><td>"
		    + honorific + " " + name + nameLocaleFmt + "</td><td>"
		    + email + "</td></tr>");
	    tableResultBody.append(rowResultBody.click(function() {
		renderDialogToMode(val);
	    }));
	}
    