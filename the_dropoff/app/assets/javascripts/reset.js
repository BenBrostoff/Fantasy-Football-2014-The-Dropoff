var refresh = function() {
  window.location.replace("/");
}

var reset = function(){
    console.log("EXECUTING");
    return $.ajax({
      url : '/reset',
      method : 'GET'
  });
}

var resetAndRefresh = function() {
  reset();
  refresh();
}

var initialize = function() {
  $(document).on("click", ".reset", resetAndRefresh)
}

$(document).ready(function() {
  initialize();
});