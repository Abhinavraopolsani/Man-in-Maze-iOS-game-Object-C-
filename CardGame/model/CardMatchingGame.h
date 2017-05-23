//
//  CardMatchingGame.h
//  CardGame
//
//  Created by Banuri,Santosh on 3/30/14.
//  Copyright (c) 2014 Student. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"	

/**
 * A CardMatchingGame object contains all game playing logic. It also caculates score and hold game states.
 *
 **/
@interface CardMatchingGame : NSObject

#define FLIP_PENALTY -1


/**
 * The value of game score.
 **/
@property (readonly,nonatomic) int score;

/**
 * The cars that are involved with card mactching in last user flip.
 **/
@property (nonatomic) NSMutableArray *cardsInlastOperation;

/**
 * The value of points earned in last card matching.
 **/
@property (nonatomic) int pointsEarnInLastOperation;

/**
 * Initializes and returns a newly allocated CardMatchingGame object with a Deck and number of card matching rule.
 **/
-(id)initWitCardCount:(NSUInteger)count usingDeck:(Deck*) deck withMatchCardNumber:(NSUInteger)matchNumber;



/**
 * Perform a card flipping game play.
 
 **/
-(void)flipCardAtIndex:(NSUInteger) index;

/**
 * Get card of the index.
 
 **/
-(Card*)cardAtIndex:(NSUInteger) index;

/**
 * Reset game status including score and card staus.
 **/
-(void)resetGame;

/**
 * Draw more cards from deck
 **/
-(NSArray*)drawMoreCardWithCardCount:(NSUInteger)cardCount;

/**
 * Get count of cards that is playable
  **/
-(NSUInteger) playableCardCount;

/**
 * Remove card from card list that can be play
 **/
-(void) removeCard:(Card *)card;

/**
 * Return index of current card
 **/
-(NSInteger) indexOfCard:(Card *)card;

/**
 * Return list of cards that currently flipped up
 **/
-(NSArray*) cardFlipped;
@end
