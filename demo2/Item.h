#import <Foundation/Foundation.h>


@interface Item : NSObject

@property (nonatomic, readonly, copy) NSString* id;
@property (nonatomic, readonly, copy) NSString* name;
@property (nonatomic, readonly, copy) NSString* currency;
@property (nonatomic, readonly, copy) NSDecimalNumber* price;

- (instancetype) initWithId:(NSString*) id name:(NSString*) name currency:(NSString*) currency price:(NSDecimalNumber*) price;

- (NSString*) getLabelName;

@end
