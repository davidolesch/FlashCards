#import "QuestionAnswerViewController.h"

@interface QuestionAnswerViewController ()
@property (weak, nonatomic) IBOutlet UILabel *questionTextLabel;
@property (weak, nonatomic) IBOutlet UILabel *answerTextLabel;
@end

@implementation QuestionAnswerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.answerTextLabel setText:@""];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.presenter updateView];
}

- (void)setQuestionText:(NSString *)questionText {
    [self.questionTextLabel setText:questionText];
}

- (void)setAnswerText:(NSString *)answerText {
    [self.answerTextLabel setText:answerText];
}

- (IBAction)touchedNextQuestion:(id)sender {
    [self.presenter nextQuestion];
}

- (IBAction)touchedShowAnswer:(id)sender {
    [self.presenter showAnswer];
}

@end