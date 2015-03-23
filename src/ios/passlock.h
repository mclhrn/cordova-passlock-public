#import <Foundation/Foundation.h>
#import <Cordova/CDVPlugin.h>

@interface passlock : CDVPlugin

- (void)status:(CDVInvokedUrlCommand*)command;
- (void)isPlatformSupported:(CDVInvokedUrlCommand*)command;

@end
