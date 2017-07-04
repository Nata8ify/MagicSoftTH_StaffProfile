/** Animation Components **/
var departmentSeacrhSection = $("#div-department-search-sec");

/** Animation Function **/
function slideFadeDepartmentSearch(isShow){
    if(isShow){
	departmentSeacrhSection.velocity('transition.slideDownBigIn');
    }else{
	departmentSeacrhSection.velocity('transition.slideDownBigOut');
    }
}

/** Listening Function **/
$("document").ready(function(){
    onStartInvisible();
});

/** Initial Set Up Function **/
function onStartInvisible(){
    $("body").velocity("fadeIn", {duration : "slow"});
}