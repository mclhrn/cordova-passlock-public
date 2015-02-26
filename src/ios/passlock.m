#import "passlock.h"

@implementation passlock

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