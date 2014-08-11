#import "Views.h"


CGFloat const VIEWS_PORTRAIT_WIDTH = 320;
CGFloat const CELL_ACCESSORY_WIDTH = 30;
CGFloat const SEARCH_CELL_HEIGHT = 44;
CGFloat const VIEWS_NAVIGATION_BAR_HEIGHT = 44;
CGFloat const VIEWS_STATUS_BAR_HEIGHT = 20;

//216 is normal keyboard height
CGFloat const KEYBOARD_HEIGHT = 216;

/**
* always roundf rect's properties, or in non-retina display, we will see pixel dithering
*
*/
@implementation Views

+ (void) removeAllSubViews:(UIView*) target
{
    for (UIView* sub in target.subviews)
    {
        [sub removeFromSuperview];
    }
}

+ (void) alignCenter:(UIView*) target containerWidth:(CGFloat) containerWidth
{
    CGRect rect = target.frame;
    rect.origin.x = roundf((containerWidth - rect.size.width) / 2);
    target.frame = rect;
}

+ (void) alignCenterMiddle:(UIView*) target containerSize:(CGSize) size
{
    CGRect rect = target.frame;
    rect.origin.x = roundf((size.width - rect.size.width) / 2);
    rect.origin.y = roundf((size.height - rect.size.height) / 2);
    target.frame = rect;
}

+ (void) resize:(UIView*) target containerSize:(CGSize) size
{
    CGRect rect = target.frame;
    rect.size = size;
    target.frame = rect;
}

+ (void) resize:(UIView*) target containerWidth:(CGFloat) containerWidth
{
    CGRect rect = target.frame;
    rect.size = CGSizeMake(MAX(0, containerWidth), rect.size.height);
    target.frame = rect;
}

+ (void) resize:(UIView*) target containerHeight:(CGFloat) containerHeight
{
    CGRect rect = target.frame;
    rect.size = CGSizeMake(rect.size.width, MAX(0, containerHeight));
    target.frame = rect;
}

+ (void) move:(UIView*) target deltaX:(CGFloat) dx deltaY:(CGFloat) dy
{
    CGRect rect = target.frame;
    rect.origin.x += dx;
    rect.origin.y += dy;
    target.frame = rect;
}

+ (void) locate:(UIView*) target x:(CGFloat) x y:(CGFloat) y
{
    CGRect rect = target.frame;
    rect.origin.x = x;
    rect.origin.y = y;
    target.frame = rect;
}

+ (void) locate:(UIView*) target y:(CGFloat) y
{
    CGRect rect = target.frame;
    rect.origin.y = y;
    target.frame = rect;
}

+ (void) locate:(UIView*) target x:(CGFloat) x
{
    CGRect rect = target.frame;
    rect.origin.x = x;
    target.frame = rect;
}

+ (CGFloat) rightOf:(UIView*) view
{
    return view.frame.origin.x + view.frame.size.width;
}

+ (CGFloat) bottomOf:(UIView*) view
{
    return view.frame.origin.y + view.frame.size.height;
}

+ (void) alignCenterMiddle:(UIView*) target containerFrame:(CGRect) frameRect
{
    CGRect rect = target.frame;
    rect.origin.x = roundf(frameRect.origin.x + (frameRect.size.width - rect.size.width) / 2);
    rect.origin.y = roundf(frameRect.origin.y + (frameRect.size.height - rect.size.height) / 2);
    target.frame = rect;
}

+ (void) alignCenterMiddle:(UIView*) target containerBounds:(CGRect) bounds
{
    CGRect rect = target.frame;
    rect.origin.x = roundf((bounds.size.width - rect.size.width) / 2);
    rect.origin.y = roundf((bounds.size.height - rect.size.height) / 2);
    target.frame = rect;
}

+ (void) alignMiddle:(UIView*) target containerHeight:(CGFloat) containerHeight
{
    CGRect rect = target.frame;
    rect.origin.y = roundf((containerHeight - rect.size.height) / 2);
    target.frame = rect;
}

+ (void) alignBottom:(UIView*) source withTarget:(UIView*) target
{
    [self locate:source y:[self bottomOf:target] - source.bounds.size.height];
}

+ (void) alignMiddle:(UIView*) source withTarget:(UIView*) target
{
    [self locate:source y:target.frame.origin.y + (target.bounds.size.height - source.bounds.size.height) * 0.5];
}

+ (void) roundFrame:(UIView*) view
{
    view.frame = CGRectMake(roundf(view.frame.origin.x),
                            roundf(view.frame.origin.y),
                            roundf(view.frame.size.width),
                            roundf(view.frame.size.height));
}

/**
*
* full screen frame size, exclude status bar and navigation bar
*
* in retina3: {{0, 0}, {320, 480}}
*
* in retina4: {{0, 0}, {320, 568}}
*
*/
+ (CGRect) frameFullScreen
{
    return [[UIScreen mainScreen] bounds];
}

/**
* in retina3: {{0, 20}, {320, 460}}
*
* in retina4: {{0, 20}, {320, 548}}
*
* please note statusBar default is 20 point, but it may be higher in some situations, such as in-call, wifi-hotspot
*/
+ (CGRect) frameWithoutStatusBar
{
    return [[UIScreen mainScreen] applicationFrame];
}

+ (CGRect) frameWithoutStatusAndNavigationBar:(UIViewController*) controller
{
    CGRect screenRect = [self frameWithoutStatusBar];
    return CGRectMake(screenRect.origin.x,
                      screenRect.origin.y,
                      screenRect.size.width,
                      screenRect.size.height - controller.navigationController.navigationBar.frame.size.height);
}

+ (BOOL) isRetina
{
    return ([[UIScreen mainScreen] respondsToSelector:@selector(scale)] && [[UIScreen mainScreen] scale] == 2);
}

+ (BOOL) isRetina4
{
    if (![self isRetina])
    {
        return NO;
    }
    return [UIScreen mainScreen].bounds.size.height == 568.0f;
}

+ (CGFloat) adjustHeightForRetina4
{
    return [self isRetina4] ? 568 - 480 : 0;
}

+ (void) align:(UIView*) target rightOf:(UIView*) view padding:(CGFloat) padding
{
    [self locate:target x:view.bounds.size.width - target.bounds.size.width - padding];
}

+ (UIImage*) resize:(UIImage*) image
{
    return [UIImage imageWithCGImage:image.CGImage scale:2
                         orientation:image.imageOrientation];
}

+ (void) fitScrollContentHeight:(UIScrollView*) scrollView
{
    CGFloat scrollViewHeight = 0.0f;
    for (UIView* view in scrollView.subviews)
    {
        if (!view.hidden)
        {
            CGFloat y = view.frame.origin.y;
            CGFloat h = view.frame.size.height;
            if (y + h > scrollViewHeight)
            {
                scrollViewHeight = h + y;
            }
        }
    }
    [scrollView setContentSize:(CGSizeMake(scrollView.frame.size.width, scrollViewHeight))];
}

/**
* To support specific controller auto rotatable, you need custom following method
*
*
* iOS6 only
* -(NSUInteger) supportedInterfaceOrientations
* {
*    return UIInterfaceOrientationMaskAllButUpsideDown;
* }
*/

@end
