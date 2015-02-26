## Introduction

plugin for Cordova to enable the detection of whether a password, pin or gesture
is required to get passed the lock screen.

#### Cordova

```javascript
<script>

    setInterval(function() {

        passlock.getStatus(

            function success(result) {
                console.log(result);
            },

            function error(result) {
                console.log(result);
            }

        );

    }, 1500);

</script> 
```

#### iOS

paste the following into ./config.xml
```xml
<feature name="passlock">
    <param name="ios-package" value="passlock" />
    <param name="onload" value="true" />
</feature>
```

#### Android

paste the following into ./platforms/android/res/xml/config.xml
```xml
<feature name="passlock">
    <param name="android-package" value="com.feedhenry.passlock.passlock" />
    <param name="onload" value="true" />
</feature>
```

