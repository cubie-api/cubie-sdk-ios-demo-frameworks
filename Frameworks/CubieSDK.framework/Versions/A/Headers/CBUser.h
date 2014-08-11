//
// Created by liq on 7/14/14.
// Copyright (c) 2014 cubie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CBUser : NSObject
@property (nonatomic, readonly, copy) NSString* uid;
@property (nonatomic, readonly, copy) NSString* cubieId;
@property (nonatomic, readonly, copy) NSString* nickname;
@property (nonatomic, readonly, copy) NSString* iconUrl;

- (instancetype) initWithUid:(NSString*) uid cubieId:(NSString*) cubieId nickname:(NSString*) nickname iconUrl:(NSString*) iconUrl;

+ (instancetype) decode:(NSDictionary*) raw;

@end