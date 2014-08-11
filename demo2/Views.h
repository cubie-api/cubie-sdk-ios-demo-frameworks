#import <Foundation/Foundation.h>

extern CGFloat const VIEWS_PORTRAIT_WIDTH;
extern CGFloat const VIEWS_NAVIGATION_BAR_HEIGHT;
extern CGFloat const VIEWS_STATUS_BAR_HEIGHT;
extern CGFloat const SEARCH_CELL_HEIGHT;
extern CGFloat const CELL_ACCESSORY_WIDTH;
extern CGFloat const KEYBOARD_HEIGHT;

@interface Views : NSObject

+ (void) removeAllSubViews:(UIView*) target;

+ (void) alignCenter:(UIView*) target containerWidth:(CGFloat) containerWidth;

+ (void) alignCenterMiddle:(UIView*) target containerSize:(CGSize) size;

+ (void) resize:(UIView*) target containerSize:(CGSize) size;

+ (void) resize:(UIView*) target containerWidth:(CGFloat) containerWidth;

+ (void) resize:(UIView*) target containerHeight:(CGFloat) containerHeight;

+ (void) move:(UIView*) target deltaX:(CGFloat) dx deltaY:(CGFloat) dy;

+ (void) locate:(UIView*) target x:(CGFloat) x y:(CGFloat) y;

+ (void) locate:(UIView*) target y:(CGFloat) y;

+ (void) locate:(UIView*) target x:(CGFloat) x;

+ (CGFloat) rightOf:(UIView*) view;

+ (CGFloat) bottomOf:(UIView*) view;

+ (void) alignCenterMiddle:(UIView*) target containerFrame:(CGRect) frameRect;

+ (void) alignCenterMiddle:(UIView*) target containerBounds:(CGRect) bounds;

+ (void) alignMiddle:(UIView*) target containerHeight:(CGFloat) containerHeight;

+ (void) alignBottom:(UIView*) source withTarget:(UIView*) target;

+ (void) alignMiddle:(UIView*) source withTarget:(UIView*) target;

+ (void) roundFrame:(UIView*) view;

+ (CGRect) frameFullScreen;

+ (CGRect) frameWithoutStatusBar;

+ (CGRect) frameWithoutStatusAndNavigationBar:(UIViewController*) controller;

+ (BOOL) isRetina;

+ (BOOL) isRetina4;

+ (CGFloat) adjustHeightForRetina4;

+ (void) align:(UIView*) target rightOf:(UIView*) view padding:(CGFloat) padding;

+ (void) fitScrollContentHeight:(UIScrollView*) scrollView;

@end
