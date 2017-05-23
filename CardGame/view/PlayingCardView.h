//
//  PlayingCardView.h
//  CardGame
//
//  Created by Banuri,Santosh on 3/21/14.
//  Copyright (c) 2014 Student. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlayingCardView : UIView
@property (strong,nonatomic) NSString* suit;
@property (nonatomic) NSUInteger rank;
@property (nonatomic) BOOL faceup;

@end
