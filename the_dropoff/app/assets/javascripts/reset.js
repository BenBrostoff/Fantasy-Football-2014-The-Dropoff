var reset = function(){
    console.log("EXECUTING");
    return $.ajax({
      url : '/reset',
      method : 'GET'
  });
}

var initialize = function() {
  $(document).on("click", ".reset", reset)
  console.log("BANKS");
}

$(document).ready(function() {
  console.log("BILL");
  initialize();
});