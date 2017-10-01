
#import "RNSFAuthenticationSession.h"

@implementation RNSFAuthenticationSession

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}

RCT_EXPORT_MODULE()

RCT_REMAP_METHOD(getSafariData, address:(NSString *)address callbackURL:(NSString *)callbackURL
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject)
{
    if (@available(iOS 11.0, *)) {
        NSURL * siteURL = [NSURL URLWithString:address];
        self.authentifier = [[SFAuthenticationSession alloc] initWithURL:siteURL
                                                       callbackURLScheme:callbackURL
                                                       completionHandler: ^(NSURL * cbURL, NSError * error){
                                                           NSLog(@"%@",[error localizedDescription]);
                                                           if (error != nil) {
                                                               reject(@"CompletionHandler non nil error", [error localizedDescription], error);
                                                           } else {
                                                               resolve(cbURL.absoluteString);
                                                           }
                                                       }
                             ];
        BOOL success = [self.authentifier start];

        if (success == NO) {
            NSError *error = [NSError errorWithDomain:@"Open safari" code:404 userInfo:nil];
            reject(@"Open safari", @"could not start opening safari", error);
        }
    } else {
        NSError *error = [NSError errorWithDomain:@"OS requirement" code:404 userInfo:nil];
        reject(@"OS requirement", @"iOS 11+ required", error);
        return;
    }
}

@end
