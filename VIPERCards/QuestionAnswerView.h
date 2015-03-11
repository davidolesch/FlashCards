#import <Foundation/Foundation.h>

@protocol QuestionAnswerView <NSObject>
/**
 *  Set the question text of the question/answer view.
 *
 *  @param questionText The text to use for the question.
 */
- (void)setQuestionText:(NSString *)questionText;
/**
 *  Set the answer text of the question/answer view.
 *
 *  @param answerText The text to use for the answer.
 */
- (void)setAnswerText:(NSString *)answerText;
@end