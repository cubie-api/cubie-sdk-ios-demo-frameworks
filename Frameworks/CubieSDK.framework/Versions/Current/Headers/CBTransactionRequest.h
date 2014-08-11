//
// Created by liq on 7/24/14.
// Copyright (c) 2014 cubie. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface CBTransactionRequest : NSObject

@property (nonatomic, readonly, copy) NSString* purchaseId;
@property (nonatomic, readonly, copy) NSString* itemName;
@property (nonatomic, readonly, copy) NSString* currency;
@property (nonatomic, readonly, copy) NSDecimalNumber* price;
@property (nonatomic, readonly, strong) NSDate* purchaseDate;
@property (nonatomic, readonly, strong) NSDictionary* extra;

//- (instancetype) initWithPurchaseId:(NSString*) purchaseId itemName:(NSString*) itemName currency:(NSString*) currency price:(NSDecimalNumber*) price purchaseDate:(NSDate*) purchaseDate extra:(NSDictionary*) extra;

- (NSString*) toJson;

+ (CBTransactionRequest*) create:(NSString*) purchaseId
                           itemName:(NSString*) itemName
                           currency:(NSString*) currency
                              price:(NSDecimalNumber*) price
                       purchaseDate:(NSDate*) purchaseDate
                              extra:(NSDictionary*) extra;
@end