//
//  TinyunBridge.m
//  ESportsGameClient
//
//  Created by Justine Angelo Rangel on 6/4/20.
//

#import "TinyunBridge.h"
#import <tingyunApp/NBSAppAgent.h>

@implementation TinyunBridge
+ (void)run {
  [NBSAppAgent startWithAppID:@"1a1cecbe1647416ca0039d5b51b303a5"];
}
@end
