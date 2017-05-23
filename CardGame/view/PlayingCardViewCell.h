//
//  PlayingCardViewCell.h
//  CardGame
//
//  Created by Banuri,Santosh on 3/20/14.
//  Copyright (c) 2014 Student. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlayingCardViewCell : UICollectionViewCell
@property (nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;
@property (nonatomic) BOOL faceup;
@end
