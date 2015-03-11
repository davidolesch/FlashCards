#import <UIKit/UIKit.h>
#import "QuestionAnswerView.h"
#import "QuestionAnswerPresenter.h"

@interface QuestionAnswerViewController : UIViewController <QuestionAnswerView>
@property (strong, nonatomic) QuestionAnswerPresenter *presenter;
@end