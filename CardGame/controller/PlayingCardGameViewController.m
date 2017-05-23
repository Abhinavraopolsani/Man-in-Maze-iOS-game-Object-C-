//
//  PlayingCardGameViewController.m
//  CardGame
//
//  Created by Banuri,Santosh on 3/29/14.
//  Copyright (c) 2014 Student. All rights reserved.
//

#import "PlayingCardGameViewController.h"
#import "PlayingCardDeck.h"
#import "PlayingCardViewCell.h"
#import "PlayingCard.h"
#import "PlayingCardView.h"

@interface PlayingCardGameViewController ()
@end

@implementation PlayingCardGameViewController


-(NSUInteger)numberOfMatchedCardInGame
{
    return 2;
}

-(NSString*) gameName
{
    return @"";
}

- (Deck*)getCardDeck
{
    return [[PlayingCardDeck alloc]init];
}

- (NSUInteger)startingCardCount
{
    return 15;
}
-(void)viewDidLoad
{
    self.navigationItem.title=@"Level 1";
    [super viewDidLoad];
}
- (void) updateCell:(UICollectionViewCell*) cell useringCard:(Card*)card
{
    if([cell isKindOfClass:[PlayingCardViewCell class]]  && [card isKindOfClass:[PlayingCard class]] )
    {
        PlayingCardViewCell *playingCardViewCell = (PlayingCardViewCell*) cell;
        PlayingCard *playingCard = (PlayingCard*) card;
        playingCardViewCell.suit = playingCard.suit;
        playingCardViewCell.rank = playingCard.rank;
        playingCardViewCell.faceup= playingCard.faceup;
    }
}

- (UIView*) createCardViewUsingCard:(Card*) card
{
    PlayingCardView *result;
    if([card isKindOfClass:[PlayingCard class]]){
        PlayingCard *playingCard = (PlayingCard*)card;
        result = [[PlayingCardView alloc]init];
        result.suit = playingCard.suit;
        result.rank = playingCard.rank;
        result.faceup = YES;
    }
    return result;
}


@end
