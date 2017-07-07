/** Animation Components **/
/* Sections */
var departmentSeacrhSection = $("#div-department-search-sec");
var departmentViewfor = $("#div-department-view-for");
var staffsTableSection = $("#div-table-total-staff");
var homeSection =  $("#home");

/* Elements */
var navbMSTTitle = $("#div-header-title");
var navbMenu = $("#bs-example-navbar-collapse-1");

/*  HTML Tags */
var html = $("html");
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
    homeSection.velocity('transition.slideDownBigIn');
    departmentViewfor.velocity('transition.slideDownBigIn');
    staffsTableSection.velocity('transition.slideRightIn', function(){
	setUpStaffsTable(); //> Show Data After the Table is Animated.
    });
 /*   navbMSTTitle.velocity('transition.slideLeftIn');*//*
    navbMenu.velocity('transition.slideRightIn');*/
    
    
/* etc. */
html.smoothScroll();
}