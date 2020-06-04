//
//  ESportsGameClientManagerBridge.m
//  ESportsGameClientMobile
//
//  Created by Justine Angelo Rangel on 4/30/20.
//  Copyright © 2020 R4pid Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(ESportsGameClientManager, NSObject)

RCT_EXTERN_METHOD(registerAppID:(NSString*)appID crashReport:(BOOL)crashReport)
RCT_EXTERN_METHOD(setUserIdentifier:(NSString*)identifier)
RCT_EXTERN_METHOD(dismiss)
RCT_EXTERN_METHOD(accountTapped)

@end
