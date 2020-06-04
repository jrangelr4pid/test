//
//  TinyunBridge.m
//  ESportsGameClient
//
//  Created by Justine Angelo Rangel on 6/4/20.
//

#import "TinyunBridge.h"
#import <tingyunApp/NBSAppAgent.h>

@implementation TinyunBridge
+ (void)registerAppID:(NSString *)appID crashReport:(BOOL)report {
  [NBSAppAgent startWithAppID:appID];
  if (report) {
    [NBSAppAgent setStartOption: NBSOption_Crash];
  }
}

+ (void)setUserIdentifier:(NSString *)identifier {
  [NBSAppAgent setUserIdentifier:identifier];
}

+ (void)leaveBreadCrumb:(NSString *)breadCrumb {
  [NBSAppAgent leaveBreadcrumb:breadCrumb];
}

+ (void)trackEvent:(NSString *)event {
  [NBSAppAgent trackEvent:event];
}

+ (void)beginTracer:(NSString *)trace {
  beginTracer(trace)
}

+ (void)endTracer:(NSString *)trace {
  endTracer(trace)
}

@end
