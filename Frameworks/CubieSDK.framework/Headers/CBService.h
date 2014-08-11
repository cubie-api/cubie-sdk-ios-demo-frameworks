//
// Created by liq on 7/14/14.
// Copyright (c) 2014 cubie. All rights reserved.
//

#import <Foundation/Foundation.h>

extern const int CBDefaultFriendListPageSize;
extern NSString* const CBMessageIsEmptyErrorDomain;

@class CBUser;
@class CBUserAccessToken;
@class CBFriend;
@class CBFriendList;
@class CBMessage;
@class CBSession;
@class CBTransactionRequest;

@interface CBService : NSObject

+ (void) extendAccessToken:(void (^)(CBUserAccessToken* cubieUserAccessToken, NSError* error)) done;

+ (void) requestProfile:(void (^)(CBUser* cubieUser, NSError* error)) done;

+ (void) requestFriends:(CBFriendList*) currentFriendListOrNil pageSize:(int) pageSize done:(void (^)(CBFriendList* updatedFriendList, NSError* error)) done;

+ (void) sendMessage:(CBMessage*) cubieMessage to:(NSString*) receiverUid done:(void (^)(NSError* error)) done;

+ (void) createTransactionWithPurchaseId:(NSString*) purchaseId
                                itemName:(NSString*) itemName
                                currency:(NSString*) currency
                                   price:(NSDecimalNumber*) price
                            purchaseDate:(NSDate*) purchaseDate
                                   extra:(NSDictionary*) extra
                                    done:(void (^)(NSError* error)) done;

@end