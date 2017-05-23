//
//  GameResult.h
//  CardGame
//
//  Created by Banuri,Santosh on 4/12/14.
//  Copyright (c) 2014 Student. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 * A Gsameresult objects handles persistence score.
 */

@interface GameResult : NSObject


@property (readwrite, nonatomic) NSString *gameName;


@property (readonly, nonatomic) NSDate *start;


@property (readonly, nonatomic) NSDate *end;


@property (readonly, nonatomic) NSTimeInterval duration;


@property (nonatomic) int score;


-(id)initWithGameName:(NSString*)gameName;


+(NSArray *)allGameResults;


+(void)deleteAllGameResults;


@end
