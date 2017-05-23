//
//  SetGameCardViewCell.h
//  CardGame
//
//  Created by Banuri,Santosh on 3/23/14.
//  Copyright (c) 2014 Student. All rights reserved.
//I have made some changes

#import <UIKit/UIKit.h>

@interface SetGameCardViewCell : UICollectionViewCell
@property (nonatomic) NSUInteger number;
@property (nonatomic) NSUInteger symbol;
@property (nonatomic) NSUInteger shading;
@property (nonatomic) NSUInteger color;
@property (nonatomic) BOOL drawOutLine;
@end

