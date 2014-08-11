//
// Created by liq on 7/16/14.
// Copyright (c) 2014 cubie. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface CBMessageActionParams : NSObject
@property (nonatomic, copy) NSString* androidExecuteParam;
@property (nonatomic, copy) NSString* androidMarketParam;
@property (nonatomic, copy) NSString* iosExecuteParam;

+ (instancetype) params;

- (instancetype) androidExecuteParam:(NSString*) androidExecuteParam;

- (instancetype) androidMarketParam:(NSString*) androidMarketParam;

- (instancetype) iosExecuteParam:(NSString*) iosExecuteParam;

- (instancetype) executeParam:(NSString*) androidExecuteParam;

- (instancetype) marketParam:(NSString*) androidMarketParam;

@end