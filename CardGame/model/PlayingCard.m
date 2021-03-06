//
//  PlayingCard.m
//  CardGame
//
//  Created by Banuri,Santosh on 3/26/14.
//  Copyright (c) 2014 Student. All rights reserved.
//

#import "PlayingCard.h"

@interface PlayingCard()

@end

@implementation PlayingCard

-(int) match:(NSArray*) cardArray{
    int score = 0;
    if([cardArray count]>0){
        BOOL matchRank = TRUE;        
        BOOL matchSuit = TRUE;
        
        for(id card in cardArray){ // iterator through each element in array
            if([card isKindOfClass:[PlayingCard class]]){ 
                PlayingCard *playingCard = (PlayingCard*) card;
                
                if(self.rank != playingCard.rank){
                    matchRank = false;
                }
                
                if(![self.suit isEqualToString: playingCard.suit]){
                    matchSuit = false;
                }
                
            }
        }
        
        score += matchSuit ? 1*pow(2,[cardArray count]) : 0;
        score += matchRank ? 4*pow(2,[cardArray count]) : 0;
    }
    return score;
}

-(NSString*) contents{
    return [[[PlayingCard rankStrings]objectAtIndex:self.rank] stringByAppendingString:self.suit];
}

@synthesize suit = _suit; // because we provide setter AND getter

+(NSArray*) validSuits{
    return @[@"♥",@"♦",@"♠",@"♣"];
}

-(void) setSuit:(NSString*)suit{
    if([PlayingCard.validSuits containsObject:suit]){
        _suit = suit;
    }
}

-(NSString*) suit{
    return _suit ? _suit : @"?";
}

+(NSArray*) rankStrings
{
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

+(NSUInteger) maxRank
{
    return PlayingCard.rankStrings.count-1;
}

-(void) setRank:(NSUInteger)rank
{
    if(rank <= [PlayingCard maxRank]){
        _rank = rank;
    }
}


@end
