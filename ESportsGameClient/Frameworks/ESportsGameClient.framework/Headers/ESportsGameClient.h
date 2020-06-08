//
//  ESportsGameClient.h
//  ESportsGameClient
//
//  Created by Justine Angelo Rangel on 6/7/20.
//  Copyright © 2020 R4pid Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <React/RCTBridgeModule.h>

//! Project version number for ESportsGameClient.
FOUNDATION_EXPORT double ESportsGameClientVersionNumber;

//! Project version string for ESportsGameClient.
FOUNDATION_EXPORT const unsigned char ESportsGameClientVersionString[];

@interface LaunchMode : NSObject
+ (instancetype)usingPartnerMemberToken:(NSString*)token publicToken:(NSString*)publicToken;
+ (instancetype)usingGameLaunchToken:(NSString*)token publicToken:(NSString*)publicToken;
@end

@interface HomeIcon : NSObject
+ (instancetype)_default;
+ (instancetype)back;
+ (instancetype)customURL:(NSString*)url;
@end

@interface Theme : NSObject
+ (instancetype)_default;
+ (instancetype)dark;
+ (instancetype)light;
+ (instancetype)customJSONFile:(NSString*)file;
@end

@protocol ESportsGameClientDelegate <NSObject>
- (UIViewController*)esportsGameClientPresentationController;
@optional
- (void)esportsGameClientWillShow;
- (void)esportsGameClientDidShow;
- (void)esportsGameClientWillDismiss;
- (void)esportsGameClientDidDismiss;
- (void)esportsGameClientAccountDidTapped;
@end

@interface ESportsGameClient : NSObject<RCTBridgeModule>
@property (nonatomic, strong) LaunchMode* launchMode;
@property (nonatomic, strong) HomeIcon* homeIcon;
@property (nonatomic, strong) Theme* theme;
@property (nonatomic, strong) NSString* accountName;

+ (instancetype)sharedInstance;
+ (void)configure;
+ (void)show:(id<ESportsGameClientDelegate>)delegate;
+ (void)dismiss;
@end
