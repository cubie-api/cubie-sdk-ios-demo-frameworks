//
// Created by liq on 7/17/14.
// Copyright (c) 2014 cubie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cubie : NSObject

+ (NSURL*) connectUrl;

+ (NSURL*) disconnectUrl:(NSString*) uid;

+ (NSString*) appKey;

+ (NSString*) appUniqueDeviceId;

+ (BOOL) handleOpenUrl:(NSURL*) url sourceApplication:(NSString*) sourceApplication;
@end