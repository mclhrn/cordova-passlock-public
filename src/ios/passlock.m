#import "passlock.h"
#import "UIDevice+PasscodeStatus.h"

@implementation passlock

- (void)status:(CDVInvokedUrlCommand*)command
{
    __weak passlock* weakSelf = self;
    
    [self.commandDelegate runInBackground:^{
        
        int status = [self getPasscodeState];
        CDVPluginResult* result;
        
        if(status < 0) {
            result = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Could not determine passlock status"];
        } else {
            result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:status];
        }
        
        [weakSelf.commandDelegate sendPluginResult:result callbackId:command.callbackId];
        
    }];
    
}

- (int)getPasscodeState
{
    LNPasscodeStatus status = [UIDevice currentDevice].passcodeStatus;
    switch (status) {
        case LNPasscodeStatusEnabled:
            return 1;
            
        case LNPasscodeStatusDisabled:
            return 0;
            
        case LNPasscodeStatusUnknown:
        default:
            return -1;
    }
}

- (void)isPlatformSupported:(CDVInvokedUrlCommand*)command
{
    __weak passlock* weakSelf = self;

    [self.commandDelegate runInBackground:^{
        
        CDVPluginResult* result;
        int status = [self getPlatformSupport];
        
        result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:status];
        
        [weakSelf.commandDelegate sendPluginResult:result callbackId:command.callbackId];
        
    }];
}


- (bool)getPlatformSupport
{
    #if TARGET_IPHONE_SIMULATOR
        return false;
    #else
        return [[UIDevice currentDevice].systemVersion floatValue] >= 8.0;
    #endif
}

@end