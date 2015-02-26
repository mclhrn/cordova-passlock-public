var exec = require('cordova/exec');

var passlock = {};

passlock.getStatus = function(success, error, options) {

  options = options || [];

  exec( function(result) {
    var out = (result == 1);
    success(out);
  }, function(result) {
    error(result);
  } , 'passlock', 'status', options );

}

module.exports = passlock;