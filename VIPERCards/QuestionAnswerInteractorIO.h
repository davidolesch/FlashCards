#import <Foundation/Foundation.h>

@protocol QuestionAnswerInteractorInput <NSObject>
/**
 *  Request a question update from the Interactor.
 */
- (void)requestQuestion;
/**
 *  Request the answer to the passed question.
 *
 *  @param question The question string for which you want the corresponding answer.
 */
- (void)requestAnswerForQuestion:(NSString *)question;
@end

@protocol QuestionAnswerInteractorOutput <NSObject>
/**
 *  Receive a question update from the Interactor.
 *
 *  @param question The text of the new question.
 */
- (void)updateQuestion:(NSString *)question;
/**
 *  Receive an answer from the Interactor.
 *
 *  @param answer The text of the answer to the question that was requested.
 */
- (void)updateAnswer:(NSString *)answer;
@end