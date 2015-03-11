#import <Foundation/Foundation.h>
#import <Specta/Specta.h>
#define EXP_SHORTHAND
#import "Expecta.h"
#import <OCMock.h>
#import "QuestionAnswerViewController.h"
#import "QuestionAnswerPresenter.h"
#import "QuestionAnswerInteractor.h"
#import "QuestionAnswerView.h"

SpecBegin(QuestionAnswerPresenter)

__block OCMockObject *mock;
__block QuestionAnswerViewController *view;
__block QuestionAnswerPresenter *presenter;
__block QuestionAnswerInteractor *interactor;

describe(@"Presenter", ^{
    
    beforeEach(^{
        view = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"QuestionAnswerViewController"];
        presenter = [[QuestionAnswerPresenter alloc] init];
        interactor = [[QuestionAnswerInteractor alloc] init];
        
        view.presenter = presenter;
        presenter.view = view;
        
        presenter.interactor = interactor;
        interactor.output = presenter;
        
        mock = [OCMockObject partialMockForObject:view];
    });
    
    it(@"sets the question text when the view asks for a view update", ^{
        [[mock expect] setQuestionText:[OCMArg isNotNil]];
        [view.presenter updateView];
    });
    
    it(@"sets the question text when the view asks for the next question", ^{
        [[mock expect] setQuestionText:[OCMArg isNotNil]];
        [view.presenter nextQuestion];
    });
    
    it(@"clears the answer when the view asks for the next question", ^{
        [[mock expect] setAnswerText:@""];
        [view.presenter nextQuestion];
    });
    
    it(@"sets the answer text when the view asks for the answer", ^{
        [[mock expect] setAnswerText:[OCMArg isNotNil]];
        [view.presenter showAnswer];
    });
    
    afterEach(^{
        [mock verify];
    });
});

SpecEnd