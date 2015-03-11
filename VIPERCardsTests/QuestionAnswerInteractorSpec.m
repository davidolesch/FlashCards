#import <Foundation/Foundation.h>
#import <Specta/Specta.h>
#define EXP_SHORTHAND
#import "Expecta.h"
#import <OCMock.h>
#import "QuestionAnswerInteractor.h"
#import "QuestionAnswerInteractor+Testing.h"


SpecBegin(QuestionAnswerInteractor)

__block OCMockObject *mock;
__block QuestionAnswerInteractor *interactor;

describe(@"Interactor", ^{
    
    beforeEach(^{
        interactor = [[QuestionAnswerInteractor alloc] init];
    });
    
    it(@"sends a question update after a question is requested", ^{
        mock = [OCMockObject partialMockForObject:interactor];
        [[[mock expect] output] updateQuestion:[OCMArg isNotNil]];
        [interactor requestQuestion];
        [mock verify];
    });
    
    it(@"sends the correct answer update after an answer is requested to a valid question", ^{
        mock = [OCMockObject partialMockForObject:interactor];
        [[[mock expect] output] updateAnswer:@"Hartford"];
        [interactor requestAnswerForQuestion:@"What is the capital of Connecticut?"];
        [mock verify];
    });
    
    it(@"sends \"answer not found\" after an answer is requested to an invalid question", ^{
        mock = [OCMockObject partialMockForObject:interactor];
        [[[mock expect] output] updateAnswer:@"answer not found"];
        [interactor requestAnswerForQuestion:@"invalid question test"];
        [mock verify];
    });
    
    it(@"has an equal number of questions and answers", ^{
        expect([interactor questions].count).to.equal([interactor answers].count);
    });
});
SpecEnd