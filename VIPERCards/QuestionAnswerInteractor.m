#import "QuestionAnswerInteractor.h"

@implementation QuestionAnswerInteractor

- (void)requestQuestion {
    
    NSArray *questions = [self questions];
    NSString *question = questions[arc4random_uniform((int)[questions count])];
    
    [self sendQuestion:question];
}

- (void)sendQuestion:(NSString *)question {
    [self.output updateQuestion:question];
}

- (NSArray *)questions {
    
    // Source: http://en.wikipedia.org/wiki/List_of_capitals_in_the_United_States
    
    NSMutableArray *questions = [NSMutableArray array];
    NSArray *states = @[ @"Alamabama", @"Alaska", @"Arizona", @"Arkansas", @"California", @"Colorado", @"Connecticut", @"Delaware", @"Florida", @"Georgia", @"Hawaii", @"Idaho", @"Illinois", @"Indiana", @"Iowa", @"Kansas", @"Kentucky", @"Louisiana", @"Maine", @"Maryland", @"Massachusetts", @"Michigan", @"Minnestoa", @"Mississippi", @"Missouri", @"Montana", @"Nebraska", @"Nevada", @"New Hampshire", @"New Jersey", @"New Mexico", @"New York", @"North Carolina", @"North Dakota", @"Ohio", @"Oklahoma", @"Oregon", @"Pennsylvania", @"Rhode Island", @"South Carolina", @"South Dakota", @"Tennessee", @"Texas", @"Utah", @"Vermont", @"Virginia", @"Washington", @"West Virginia", @"Wisconsin", @"Wyoming"];
    [states enumerateObjectsUsingBlock:^(NSString *state, NSUInteger idx, BOOL *stop) {
        [questions addObject:[NSString stringWithFormat:@"What is the capital of %@?",state]];
    }];
    
    return [NSArray arrayWithArray:questions];
}

- (NSArray *)answers {
    
    // Source: http://en.wikipedia.org/wiki/List_of_capitals_in_the_United_States
    
    return @[ @"Montgomery", @"Juneau", @"Phoenix", @"Little Rock", @"Sacramento", @"Denver", @"Hartford", @"Dover", @"Tallahassee", @"Atlanta", @"Honolulu", @"Boise", @"Springfield", @"Indianapolis", @"Des Moines", @"Topeka", @"Frankfort", @"Baton Rouge", @"Augusta", @"Annapolis", @"Boston", @"Lansing", @"Saint Paul", @"Jackson", @"Jefferson City", @"Helena", @"Lincoln", @"Carson City", @"Concord", @"Trenton", @"Santa Fe", @"Albany", @"Raleigh", @"Bismarck", @"Columbus", @"Oklahoma City", @"Salem", @"Harrisburg", @"Providence", @"Columbia", @"Pierre", @"Nashville", @"Austin", @"Salt Lake City", @"Montepelier", @"Richmond", @"Olympia", @"Charleston", @"Madison", @"Cheyenne"];
}

- (void)requestAnswerForQuestion:(NSString *)question {
    NSUInteger index = [[self questions] indexOfObject:question];
    NSString *answer = (index == NSNotFound ? @"answer not found" : [self answers][index]);
    
    [self sendAnswer:answer];
}

- (void)sendAnswer:(NSString *)answer {
    [self.output updateAnswer:answer];
}

@end