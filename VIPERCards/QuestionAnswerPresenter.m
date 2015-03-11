#import "QuestionAnswerPresenter.h"

@interface QuestionAnswerPresenter ()

@property (strong, nonatomic) NSString *currentQuestion;

@end

@implementation QuestionAnswerPresenter

- (void)updateView {
    [self.interactor requestQuestion];
}

- (void)nextQuestion {
    [self clearAnswer];
    [self.interactor requestQuestion];
}

- (void)showAnswer {
    [self.interactor requestAnswerForQuestion:self.currentQuestion];
}

- (void)clearAnswer {
    [self updateAnswer:@""];
}

- (void)updateQuestion:(NSString *)question {
    self.currentQuestion = question;
    [self.view setQuestionText:question];
}

- (void)updateAnswer:(NSString *)answer {
    [self.view setAnswerText:answer];
}

@end