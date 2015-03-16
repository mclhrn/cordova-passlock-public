## Introduction

**Compatible with Android (Api Level 16+) and iOS 8.0**

plugin for Cordova to enable the detection of whether a password, pin or gesture
is required to get passed the lock screen.

This plugin exposes node-style events which you can bind to, like so:

```javascript
passlock.start();
passlock.on('change', function(state) {
    console.log('Passlock status changed to: ' + state);
});

```

#### Methods

begin tracking changes to the passlock:
```javascript
passlock.start();
```

end tracking changes:
```javascript
passlock.stop();
```

get the status of the passlock (will return most recent value if tracking is enabled):
```javascript
passlock.getStatus(success, error, options);
```

#### Events

* enabled: triggered when the passlock is enabled
* disabled: triggered when the passlock is disabled (or otherwise unknown)
* change: triggered when the passlock state changes
* tick: triggered each time the internal timer 'ticks'

#### Global Scope

passlock is attached to the window global scope so that you may access it anywhere within your application.

```javascript
var passlock = window.passlock;
```
