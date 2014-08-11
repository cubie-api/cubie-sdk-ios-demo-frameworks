//
// Created by liq on 7/16/14.
// Copyright (c) 2014 cubie. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CBAccessToken;
@class CBPref;

@interface CBSession : NSObject

typedef void (^SessionCallback)(CBSession* session);

+ (CBSession*) getSession;

+ (void) init:(SessionCallback) callback;

- (void) open:(SessionCallback) callback;

- (void) close:(SessionCallback) callback;

- (void) close;

- (void) finishConnect:(CBAccessToken*) accessToken;

- (void) finishDisconnect;

- (BOOL) isOpen;

- (long long) getExpireTime;

- (NSString*) getAccessToken;

- (void) testMakeAccessTokenNeedToRefresh;

- (void) testInvalidAccessToken;

@end