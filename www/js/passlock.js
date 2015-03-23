var exec = require('cordova/exec');
var eventEmitter = cordova.require('com.feedhenry.eventemitter.EventEmitter');

var obj = function() {

  var self = this;

  var _isPlatformSupported = -1;
  var _isTracking = false;
  var _trackInterval = 500;
  var _trackerHandle;
  var _lastKnownState = -1;

  self.status = {
    disabled: 0,
    enabled: 1,
    unknown: -1
  };

  var _getStatus = function(success, error, options, immediate) {

    if(_isTracking && !immediate) {
      success(_lastKnownState);
      return;
    }

    options = options || [];

    exec( function(result) {
      success(result);
    }, function(result) {
      error(result);
    } , 'passlock', 'status', options );

  };

  self.isPlatformSupported = function() {
    if(_isPlatformSupported == -1) {
      _isPlatformSupported = _getIsPlatformSupported();
    }
    return _isPlatformSupported;
  }

  self.getStatus = function(success, error, options) {

    if(!_isPlatformSupported) {
      console.log('[PassLock] this platform is not supported');
      return _getStatus(success, error, options, false);
    }

  }

  var _getIsPlatformSupported = function(success, error, options) {
    
    exec( function(result) {
      success( (result == 1) );
    }, function(result) {
      error(result);
    } , 'passlock', 'isPlatformSupported', options );

  }

  self.start = function() {

    if(_isTracking) {
      return;
    }

    _isTracking = true;
    _trackerHandle = setInterval(function() {

      _getStatus(function success(result) {

        self.emit('tick', result);

        if(result != _lastKnownState) {
          self.emit('change', result);
        }
        _lastKnownState = result;

        if(result == self.status.enabled) {
          self.emit('enabled');
        } else {
          self.emit('disabled');
        } 

      }, function error(err) {
        console.log('> error: ' + err );
        self.emit('error', [err]);
      },null,true);

    }, _trackInterval);

  };

  this.stop = function() {
    clearInterval(_trackerHandle);
    _trackerHandle = null;
    _isTracking = false;
    _lastKnownState = -1;
  }

};

obj.prototype = new eventEmitter();

var passlock = new obj();

module.exports = passlock;