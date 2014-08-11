//
// Created by liq on 7/15/14.
// Copyright (c) 2014 cubie. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface CBFriend : NSObject

@property (nonatomic, readonly, copy) NSString* uid;
@property (nonatomic, readonly, copy) NSString* cubieId;
@property (nonatomic, readonly, copy) NSString* nickname;
@property (nonatomic, readonly, copy) NSString* iconUrl;
@property (nonatomic, readonly, assign) BOOL appInstalled;

- (instancetype) initWithUid:(NSString*) uid cubieId:(NSString*) cubieId nickname:(NSString*) nickname iconUrl:(NSString*) iconUrl appInstalled:(BOOL) appInstalled;

+ (instancetype) decode:(NSDictionary*) raw;

@end