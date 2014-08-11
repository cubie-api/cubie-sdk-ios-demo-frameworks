#import "DemoMainViewController.h"
#import "CBSession.h"
#import "SendMessageViewController.h"
#import <CocoaLumberjack/DDLog.h>

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

    UIButton* connectButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [connectButton addTarget:self action:@selector(openCubie) forControlEvents:UIControlEventTouchUpInside];
    [connectButton setTitle:@"Open Cubie" forState:UIControlStateNormal];
    [connectButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [connectButton sizeToFit];
    connectButton.center = self.view.center;
    [self.view addSubview:connectButton];
}

- (void) viewDidAppear:(BOOL) animated
{
    if ([CBSession getSession] && [[CBSession getSession] isOpen])
    {
        [self gotoSendMessageView];
    } else
    {
        DDLogVerbose(@"DemoMainViewController CBSession init");
        __weak DemoMainViewController* preventCircularRef = self;
        [CBSession init:^(CBSession* session) {
            if ([session isOpen])
            {
                DDLogVerbose(@"DemoMainViewController CBSession init isOpen");
                [preventCircularRef gotoSendMessageView];
            } else
            {
            }
        }];
    }
}

- (void) gotoSendMessageView
{
    SendMessageViewController* sendMessageViewController = [[SendMessageViewController alloc] initSendMessage];
    [self.navigationController pushViewController:sendMessageViewController animated:YES];
}

- (void) openCubie
{
    DDLogVerbose(@"DemoMainViewController openCubie");
    __weak DemoMainViewController* preventCircularRef = self;
    [[CBSession getSession] open:^(CBSession* session) {
        if ([session isOpen])
        {
            DDLogVerbose(@"DemoMainViewController openCubie isOpen");
            [preventCircularRef gotoSendMessageView];
        } else
        {
        }
    }];
}

@end
