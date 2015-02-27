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

#### Add plugin to cordova project

paste the following into config.xml in your app's root directory
```xml
<!-- passlock -->

<feature name="passlock">
    <param name="ios-package" value="passlock" />
    <param name="onload" value="true" />
</feature>

<feature name="passlock">
    <param name="android-package" value="com.feedhenry.passlock.passlock" />
    <param name="onload" value="true" />
</feature>

```

#### iOS specific changes

This plugin requires the Security.framework in order to operate. You'll need to
add it to your project.


#### Android specific changes

This plugin requires Android API Level 16 and above. You will need to update 
your Cordova project to have 16 as the 'minimum' SDK version in manifest.xml:

```xml
<uses-sdk android:minSdkVersion="16" android:targetSdkVersion="19" />
```


#### Android projects in Android Studio

Importing cordova projects into android will typically fail due to gradle errors
 you can fix them by following the following steps:

###### update gradle dependencies

Update the build.gradle file in your project root and the CordovaLib root paths 
to reflect the following settings

```javascript
dependencies {
  classpath 'com.android.tools.build:gradle:1.1.0+'
}
```

```javascript
buildToolsVersion "19.1.0"
```