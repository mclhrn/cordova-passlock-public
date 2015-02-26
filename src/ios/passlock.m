#import "passlock.h"
#import "UIDevice+PasscodeStatus.h"

@implementation passlock

- (void)status:(CDVInvokedUrlCommand*)command
{
    __weak passlock* weakSelf = self;
    
    [self.commandDelegate runInBackground:^{
        
        CDVPluginResult* result = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"No camera available"];
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

@end