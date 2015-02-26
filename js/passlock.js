var exec = require('cordova/exec');

var passlock = {};

passlock.getStatus = function(success, error, options) {

  exec( success, error, 'passlock', 'status', options );

}

module.exports = passlock;