#import "AppDelegate.h"
#import "QuestionAnswerViewController.h"
#import "QuestionAnswerPresenter.h"
#import "QuestionAnswerInteractor.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    [self createScreen];
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)createScreen {
    QuestionAnswerViewController *view = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"QuestionAnswerViewController"];
    QuestionAnswerPresenter *presenter = [[QuestionAnswerPresenter alloc] init];
    QuestionAnswerInteractor *interactor = [[QuestionAnswerInteractor alloc] init];
    
    view.presenter = presenter;
    presenter.view = view;
    
    presenter.interactor = interactor;
    interactor.output = presenter;
    
    self.window.rootViewController = view;
}

@end