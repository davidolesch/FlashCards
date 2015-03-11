#import <Foundation/Foundation.h>
#import "QuestionAnswerInteractorIO.h"

@interface QuestionAnswerInteractor : NSObject <QuestionAnswerInteractorInput>
@property (weak, nonatomic) id<QuestionAnswerInteractorOutput> output;
@end