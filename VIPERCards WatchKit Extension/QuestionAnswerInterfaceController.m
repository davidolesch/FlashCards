#import "QuestionAnswerInterfaceController.h"
#import "QuestionAnswerPresenter.h"
#import "QuestionAnswerInteractor.h"

@interface QuestionAnswerInterfaceController()
@property (weak, nonatomic) IBOutlet WKInterfaceLabel *questionTextLabel;
@property (weak, nonatomic) IBOutlet WKInterfaceLabel *answerTextLabel;
@end

@implementation QuestionAnswerInterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    
    [self createScreen];
    [self.answerTextLabel setText:@""];
}

- (void)willActivate {
    [super willActivate];
    [self.presenter updateView];
}

- (void)createScreen {
    QuestionAnswerPresenter *presenter = [[QuestionAnswerPresenter alloc] init];
    QuestionAnswerInteractor *interactor = [[QuestionAnswerInteractor alloc] init];
    
    self.presenter = presenter;
    presenter.view = self;
    
    presenter.interactor = interactor;
    interactor.output = presenter;
}

- (void)setQuestionText:(NSString *)questionText {
    [self.questionTextLabel setText:questionText];
}

- (void)setAnswerText:(NSString *)answerText {
    [self.answerTextLabel setText:answerText];
}

- (IBAction)touchedNextQuestion {
    [self.presenter nextQuestion];
}

- (IBAction)touchedShowAnswer {
    [self.presenter showAnswer];
}

@end