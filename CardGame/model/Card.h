//
//  Card.h
//  CardGame
//
//  Created by Banuri, Santosh on 3/26/13.
//  Copyright (c) 2014 Student. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Card : NSObject


@property(strong,nonatomic) NSString *contents;


@property(nonatomic, getter = isFaceup) BOOL faceup;


@property(nonatomic, getter = isUnplayable) BOOL unplayable;


-(int) match:(NSArray*) cardArray;
              
@end
