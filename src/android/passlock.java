package com.feedhenry.passlock;

import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.CordovaInterface;
import org.apache.cordova.CordovaWebView;
import org.apache.cordova.CallbackContext;

import org.json.JSONArray;
import org.json.JSONException;

import android.content.ContentResolver;
import android.content.Context;
import android.provider.Settings;

import android.app.KeyguardManager;
import android.app.Activity;


public class passlock extends CordovaPlugin {

    private Activity _activity;
    public CallbackContext callbackContext;

    @Override
    public void initialize(CordovaInterface cordova, CordovaWebView webView) {
        super.initialize(cordova, webView);
        _activity = cordova.getActivity();
    }

    public boolean execute(String action, JSONArray args, CallbackContext callbackContext) throws JSONException {
        
        this.callbackContext = callbackContext;

        if (action.equals("status")) {

            int result = -1;

            KeyguardManager keyguardManager = (KeyguardManager)_activity.getSystemService(_activity.KEYGUARD_SERVICE);

            if(keyguardManager.isKeyguardSecure()) {
                result = 1;
            } else {
                result = 0;
            }
            callbackContext.success(result);

            return true;

        }

        return false;

    }

    private void echo(String message, CallbackContext callbackContext) {
        if (message != null && message.length() > 0) {
            callbackContext.success(message);
        } else {
            callbackContext.error("Expected one non-empty string argument.");
        }
    }

}