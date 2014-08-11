#import <Foundation/Foundation.h>

@class CBFriend;

@protocol SelectFriendDelegate<NSObject>
- (void) selectFriend:(CBFriend*) friend;
@end

@interface SelectFriendViewController : UITableViewController
@property (nonatomic, assign) id<SelectFriendDelegate> delegate;

- (id) initSelectFriend;
@end
