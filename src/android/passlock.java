package com.feedhenry.passlock;

import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.CordovaInterface;
import org.apache.cordova.CordovaWebView;
import org.apache.cordova.CallbackContext;

import org.json.JSONArray;
import org.json.JSONException;

import android.app.KeyguardManager;
import android.app.Activity;
import android.os.Build;


public class passlock extends CordovaPlugin {

    private Activity _activity;

    @Override
    public void initialize(CordovaInterface cordova, CordovaWebView webView) {
        super.initialize(cordova, webView);
        _activity = cordova.getActivity();
    }

    public boolean execute(String action, JSONArray args, CallbackContext callbackContext) throws JSONException {
        
        if(action.equals("status")) {

            int result = -1; // unknown status 

            KeyguardManager keyguardManager = (KeyguardManager)_activity.getSystemService(_activity.KEYGUARD_SERVICE);

            if(keyguardManager.isKeyguardSecure()) {
                result = 1;
            } else {
                result = 0;
            }
            callbackContext.success(result);

            return true;

        } else if(action.equals("isPlatformSupported")) {

            int result;
            
            if(Build.VERSION.SDK_INT >= 16) {
                result = 1;
            } else {
                result = 0;
            }
            callbackContext.success(result);

            return true;

        }

        return false;

    }

}