#import "ShopViewController.h"
#import "Item.h"
#import "CBService.h"

@interface ShopViewController()<UIAlertViewDelegate>
@property (nonatomic, strong) NSArray* items;
@property (nonatomic, strong) Item* selectedItem;
@end

@implementation ShopViewController

- (id) initShop
{
    self = [super init];
    if (self)
    {
        _items = @[
          [[Item alloc] initWithId:@"sword"
                              name:@"Sword"
                          currency:@"TWD"
                             price:[[NSDecimalNumber alloc] initWithInt:90]],
          [[Item alloc] initWithId:@"shield"
                              name:@"Shield"
                          currency:@"TWD"
                             price:[[NSDecimalNumber alloc] initWithInt:60]],
          [[Item alloc] initWithId:@"arrow"
                              name:@"Arrow"
                          currency:@"TWD"
                             price:[[NSDecimalNumber alloc] initWithInt:30]],
          [[Item alloc] initWithId:@"bow"
                              name:@"Bow"
                          currency:@"TWD"
                             price:[[NSDecimalNumber alloc] initWithInt:60]]

        ];
    }

    return self;
}

- (NSInteger) tableView:(UITableView*) tableView numberOfRowsInSection:(NSInteger) section
{
    return self.items.count;
}

- (UITableViewCell*) tableView:(UITableView*) tableView cellForRowAtIndexPath:(NSIndexPath*) indexPath
{
    static NSString* reuseId = @"FriendCell";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:reuseId];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1
                                      reuseIdentifier:reuseId];
    }
    Item* item = self.items[(NSUInteger) indexPath.row];
    cell.textLabel.text = item.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@%@", item.currency, item.price];
    return cell;
}

- (void) tableView:(UITableView*) tableView didSelectRowAtIndexPath:(NSIndexPath*) indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    self.selectedItem = self.items[(NSUInteger) indexPath.row];
    [[[UIAlertView alloc] initWithTitle:nil message:[NSString stringWithFormat:@"Buy %@?", self.selectedItem.name]
                               delegate:self
                      cancelButtonTitle:@"Cancel"
                      otherButtonTitles:@"Buy", nil] show];
}

- (void) alertView:(UIAlertView*) alertView clickedButtonAtIndex:(NSInteger) buttonIndex
{
    if (alertView.cancelButtonIndex != buttonIndex)
    {
        [CBService createTransactionWithPurchaseId:@"234"
                                          itemName:self.selectedItem.id
                                          currency:self.selectedItem.currency
                                             price:self.selectedItem.price
                                      purchaseDate:[NSDate date]
                                             extra:nil
                                              done:^(NSError* error) {
                                                  if (error)
                                                  {
                                                      NSLog(@"createTransaction failure:%@", error);
                                                      return;
                                                  }
                                                  NSLog(@"createTransaction success");
                                              }];
    }
}

@end
