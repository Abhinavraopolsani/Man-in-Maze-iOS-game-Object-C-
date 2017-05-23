//
//  CardGameTests.m
//  CardGameTests
//
//  Created by Banuri,Santosh on 3/20/14.
//  Copyright (c) 2014 Student. All rights reserved.
//

#import "CardGameTests.h"
#import "SetGameCard.h"

@interface CardGameTests();

@end

@implementation CardGameTests

+(NSArray*)cardsWithNoSet{
    NSMutableArray *array = [[NSMutableArray alloc]init];
    
    [array addObject:[[SetGameCard alloc]initWithNumber:0 withSymbol:0 withShading:0 withColor:0]];
    [array addObject:[[SetGameCard alloc]initWithNumber:1 withSymbol:0 withShading:0 withColor:0]];
    [array addObject:[[SetGameCard alloc]initWithNumber:1 withSymbol:0 withShading:0 withColor:0]];
    
    return [array copy];
}

+(NSArray*)cardsWithSet{
    NSMutableArray *array = [[NSMutableArray alloc]init];
    
    [array addObject:[[SetGameCard alloc]initWithNumber:0 withSymbol:0 withShading:0 withColor:0]];
    [array addObject:[[SetGameCard alloc]initWithNumber:1 withSymbol:0 withShading:0 withColor:0]];
    [array addObject:[[SetGameCard alloc]initWithNumber:2 withSymbol:0 withShading:0 withColor:0]];
    
    return [array copy];
    
}
+(NSArray*)cardsWithSet2{
    NSMutableArray *array = [[NSMutableArray alloc]init];
    
    [array addObject:[[SetGameCard alloc]initWithNumber:0 withSymbol:1 withShading:2 withColor:0]];
    [array addObject:[[SetGameCard alloc]initWithNumber:1 withSymbol:0 withShading:0 withColor:0]];
    [array addObject:[[SetGameCard alloc]initWithNumber:2 withSymbol:2 withShading:1 withColor:0]];
    
    return [array copy];
    
}

- (void)testSetGameCardScore1{

    if(true){
        NSMutableArray *cardToCompared = [[[self class]cardsWithNoSet] mutableCopy];
        NSLog(@"cards to be comapred %@",cardToCompared);
        SetGameCard *card = [cardToCompared lastObject];
        [cardToCompared removeLastObject];
        int score = [card match:cardToCompared];
        STAssertEqualObjects(@0, @(score), @"score is not right");
    }
    
    if(true){
        NSMutableArray *cardToCompared = [[[self class]cardsWithSet] mutableCopy];
        NSLog(@"cards to be comapred %@",cardToCompared);
        SetGameCard *card = [cardToCompared lastObject];
        [cardToCompared removeLastObject];
        int score = [card match:cardToCompared];
        STAssertEqualObjects(@10, @(score), @"score is not right");
    }
    
    if(true){
        NSMutableArray *cardToCompared = [[[self class]cardsWithSet2] mutableCopy];
        NSLog(@"cards to be comapred %@",cardToCompared);
        SetGameCard *card = [cardToCompared lastObject];
        [cardToCompared removeLastObject];
        int score = [card match:cardToCompared];
        STAssertEqualObjects(@10, @(score), @"score is not right");
    }
}
@end
