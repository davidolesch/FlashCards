#import <Foundation/Foundation.h>
#import "QuestionAnswerInteractorIO.h"
#import "QuestionAnswerView.h"

@interface QuestionAnswerPresenter : NSObject <QuestionAnswerInteractorOutput>
@property (weak, nonatomic) id<QuestionAnswerView> view;
@property (strong, nonatomic) id<QuestionAnswerInteractorInput> interactor;

/**
 *  Get the current content.
 */
- (void)updateView;
/**
 *  Go to the next question.
 */
- (void)nextQuestion;
/**
 *  Show answer for the current question.
 */
- (void)showAnswer;

@end