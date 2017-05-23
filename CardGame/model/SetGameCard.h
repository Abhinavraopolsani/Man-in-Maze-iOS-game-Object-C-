//
//  SetGameCard.h
//  CardGame
//
//  Created by Banuri,Santosh on 4/2/14.
//  Copyright (c) 2014 Student. All rights reserved.
//

#import "Card.h"

/**
 * A SetGameCard object is varying in four features: number (1, 2, or 3); symbol (diamond, squiggle, oval); shading (solid, striped, or open); and color (red, green, or purple).
 **/
 @interface SetGameCard : Card

/**
 * Returns a newly initialized SetGameCard object with value specified.
 **/
- (id)initWithNumber:(NSUInteger)number withSymbol:(NSUInteger)symbol withShading:(NSUInteger)shading withColor:(NSUInteger)color;

/**
 * The value of number.
 **/
@property (readonly, nonatomic) NSUInteger number;
/**
 * The value of symbol.
 **/
@property (readonly, nonatomic) NSUInteger symbol;
/**
 * The value of shading.
 **/
@property (readonly, nonatomic) NSUInteger shading;
/**
 * The value of color.
 **/
@property (readonly, nonatomic) NSUInteger color;


/**
 * Gets the max value of number of SetGameCard object

 **/
+(NSUInteger) maxNumber;

/**
 * Gets the max value of symbol of SetGameCard object
**/
+(NSUInteger) maxSymbol;

/**
 * Gets the max value of shading of SetGameCard object
 **/
+(NSUInteger) maxShading;

/**
 * Gets the max value of color of SetGameCard object
 **/
+(NSUInteger) maxColor;

@end
