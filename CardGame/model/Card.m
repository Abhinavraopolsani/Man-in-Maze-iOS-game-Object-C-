//
//  Card.m
//  CardGame
//
//  Created by Banuri,Santosh on 3/26/14.
//  Copyright (c) 2014 Student. All rights reserved.
//

#import "Card.h"

@interface Card()
@end

@implementation Card

-(int) match:(NSArray*) cardArray
{
    int score = 0;
    for(Card *card in cardArray)
    {
        if([self.contents isEqualToString:card.contents]){
            score = 1;
        }
    }
    return score;
}

@end
