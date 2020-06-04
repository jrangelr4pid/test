//
//  TinyunBridge.h
//  ESportsGameClient
//
//  Created by Justine Angelo Rangel on 6/4/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TinyunBridge : NSObject
+ (void)registerAppID:(NSString*)appID crashReport:(BOOL)report;
+ (void)setUserIdentifier:(NSString*)identifier;
+ (void)leaveBreadCrumb:(NSString*)breadCrumb;
+ (void)trackEvent:(NSString*)event;
+ (void)beginTracer:(NSString*)trace;
+ (void)endTracer:(NSString*)trace;
@end

NS_ASSUME_NONNULL_END
