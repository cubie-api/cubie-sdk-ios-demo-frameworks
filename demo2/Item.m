#import "Item.h"


@implementation Item


- (instancetype) initWithId:(NSString*) id name:(NSString*) name currency:(NSString*) currency price:(NSDecimalNumber*) price
{
    self = [super init];
    if (self)
    {
        _id = id;
        _name = name;
        _currency = currency;
        _price = price;
    }

    return self;
}

- (NSString*) getLabelName
{
    return [NSString stringWithFormat:@"%@ %@ %@", self.name, self.currency, self.price.stringValue];

}


@end
