#import <WatchKit/WatchKit.h>
#import <Foundation/Foundation.h>
#import "QuestionAnswerView.h"
#import "QuestionAnswerPresenter.h"

@interface QuestionAnswerInterfaceController : WKInterfaceController <QuestionAnswerView>
@property (strong, nonatomic) QuestionAnswerPresenter *presenter;
@end
