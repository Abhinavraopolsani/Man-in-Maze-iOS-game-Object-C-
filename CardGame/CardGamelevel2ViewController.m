//
//  CardGamelevel2ViewController.m
//  CardGame
//
//  Created by Banuri,Santosh on 4/10/14.
//  Copyright (c) 2014 Student. All rights reserved.
//

#import "CardGamelevel2ViewController.h"
#import "PlayingCardGameViewController.h"
#import "PlayingCardDeck.h"
#import "PlayingCardViewCell.h"
#import "PlayingCard.h"
#import "PlayingCardView.h"



@interface CardGamelevel2ViewController ()

@end

@implementation CardGamelevel2ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSUInteger)numberOfMatchedCardInGame{
    return 3;
}

-(NSString*) gameName
{
    return @"Level 2";
}

- (Deck*)getCardDeck
{
    return [[PlayingCardDeck alloc]init];
}

- (NSUInteger)startingCardCount
{
    return 15;
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


- (IBAction)exit:(id)sender
{
    
}
@end
