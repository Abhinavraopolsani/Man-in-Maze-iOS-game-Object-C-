//
//  CardGameViewController.h
//  CardGame
//
//  Created by Banuri,Santosh on 3/26/14.
//  Copyright (c) 2014 Student. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CardMatchingGame.h"
#import <AVFoundation/AVFoundation.h>
#import <AudioToolbox/AudioToolbox.h>

#define Disable_Alpha 0.4

@interface CardGameViewController : UIViewController<UICollectionViewDataSource, UIAlertViewDelegate, AVAudioPlayerDelegate>
{
   AVAudioPlayer *avp;
   AVAudioPlayer *win;
    AVAudioPlayer *audioPlayer1;

}



@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;


@property (weak, nonatomic) IBOutlet UICollectionView *cardCollectionView;


@property (nonatomic) int flipCount;


@property (strong, nonatomic) CardMatchingGame *game;


@property (nonatomic) NSUInteger numberOfMatchedCardInGame;


@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

@property (weak, nonatomic) IBOutlet UILabel *lastFlipResultLabel;


@property (readonly, nonatomic) NSString *gameName;




/**
 * UI updated when flip is done
 **/
- (void)updateUI;


/**
 * perform action when a deal button is clicked
 **/

- (IBAction)dealButtonClicked:(id)sender;

/**
 * perform action when a button is clicked

 **/
- (IBAction)flipCard:(UIButton *)sender;


- (Deck*)getCardDeck;

/**
 * get card count which used for initilaized the game
 * @return card count
 **/
- (NSUInteger)startingCardCount;

/**
 * update card content in ui collection view
 **/

- (void) updateCell:(UICollectionViewCell*) cell useringCard:(Card*)card;


@end
