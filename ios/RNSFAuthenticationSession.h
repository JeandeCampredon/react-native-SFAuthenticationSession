
#if __has_include("RCTBridgeModule.h")
#import "RCTBridgeModule.h"
#else
#import <React/RCTBridgeModule.h>
#endif

@import SafariServices;

@interface RNSFAuthenticationSession : NSObject <RCTBridgeModule>
@property (nonatomic) SFAuthenticationSession * authentifier;
@end

