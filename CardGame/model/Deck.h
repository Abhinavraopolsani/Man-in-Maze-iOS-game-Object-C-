//
//  Deck.h
//  CardGame
//
//  Created by Banuri,Santosh on 3/26/14.
//  Copyright (c) 2014 Student. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

/**
 * A Deck object represents a collection of Card objects handles Card abstract concept in game.
 *
 **/
@interface Deck : NSObject



/**
 * Inserts a given card either at the top of the Deck or in the bottom of the Deck.
 *
**/
-(void) addCard:(Card*)card atTop:(BOOL)atTop;

/**
 * Returns a random card from the Deck object and remove it from the Deck object.
 *
 **/
-(Card*) drawRandomCard;

@end
