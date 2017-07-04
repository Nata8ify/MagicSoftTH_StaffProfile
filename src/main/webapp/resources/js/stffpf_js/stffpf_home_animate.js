/** Animation Components **/
var departmentSeacrhSection = $("#div-department-search-sec");

/** Animation Function **/
function slideFadeDepartmentSearch(isShow){
    if(isShow){
	departmentSeacrhSection.velocity("fadeIn",{duration: 1500});
    }else{
	
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