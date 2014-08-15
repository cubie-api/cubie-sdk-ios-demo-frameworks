#import "DemoMainViewController.h"
#import "SendMessageViewController.h"
#import <CubieSDK/UIViewController+CBSession.h>
#import <CocoaLumberjack/DDLog.h>
#import <CubieSDK/Cubie.h>

static const int ddLogLevel = LOG_LEVEL_VERBOSE;

@implementation DemoMainViewController

- (instancetype) initMain
{
    self = [super init];
    if (self)
    {
    }

    return self;
}

- (void) viewDidLoad
{
    [super viewDidLoad];

    self.navigationController.navigationBar.topItem.title = @"Demo";

    UIButton* connectButton = [Cubie buttonWithCubieStyle];
    [connectButton addTarget:self action:@selector(openCubie) forControlEvents:UIControlEventTouchUpInside];
    connectButton.center = self.view.center;
    [self.view addSubview:connectButton];
}

- (void) viewDidAppear:(BOOL) animated
{
    [super viewDidAppear:animated];
    [self onCBSessionOpen:@selector(gotoSendMessageView) onCBSessionClose:nil];
}

- (void) gotoSendMessageView
{
    SendMessageViewController* sendMessageViewController = [[SendMessageViewController alloc] initSendMessage];
    [self.navigationController pushViewController:sendMessageViewController animated:YES];
}

- (void) openCubie
{
    DDLogVerbose(@"DemoMainViewController openCubie");
    [self connect:@selector(gotoSendMessageView)];
}

@end
