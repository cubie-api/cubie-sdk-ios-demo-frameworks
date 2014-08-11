//
// Created by liq on 7/15/14.
// Copyright (c) 2014 cubie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CBFriendList : NSObject
@property (nonatomic, readonly, strong) NSMutableArray* allFriends;
@property (nonatomic, readonly, assign) BOOL hasMore;

+ (instancetype) list;

- (void) update:(NSArray*) friends;
@end