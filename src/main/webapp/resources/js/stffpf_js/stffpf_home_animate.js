/** Animation Components **/
/* Sections */
var departmentSeacrhSection = $("#div-department-search-sec");
var departmentViewfor = $("#div-department-view-for");
var staffsTableSection = $("#div-table-total-staff");

/* Elements */
var navbMSTTitle = $("#div-header-title");
var navbMenu = $("#bs-example-navbar-collapse-1");

/*  HTML Tags */
var body = $("body");

/** Animation Function **/
function slideFadeDepartmentSearch(isShow){
    if(isShow){
	departmentSeacrhSection.velocity('transition.slideDownBigIn');
    }else{
	if(departmentSeacrhSection.css("opacity") == 0){return;}
	departmentSeacrhSection.velocity('transition.slideUpBigOut');
    }
}
/*PPLJHTGRFEDDCSA : Message from the Future.*/
/** Listening Function **/
$("document").ready(function(){
    onStartInvisible();
    onStartVisible();
});

/** Initial Set Up Function **/
function onStartInvisible(){
    body.velocity("fadeIn", {duration : "slow"});
}
function onStartVisible(){
    departmentViewfor.velocity('transition.slideDownBigIn');
    staffsTableSection.velocity('transition.slideRightIn');
    navbMSTTitle.velocity('transition.slideLeftIn');
    navbMenu.velocity('transition.slideRightIn');
}