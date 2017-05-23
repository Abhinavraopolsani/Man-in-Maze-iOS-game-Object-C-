//
//  FlipResultView.h
//  CardGame
//
//  Created by Banuri,Santosh on 3/25/14.
//  Copyright (c) 2014 Student. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FlipResultView : UIView
@property (strong,nonatomic) NSString *prefixString;
@property (strong,nonatomic) NSString *sufixString;
-(void) addCardView:(UIView*)cardView;
-(void) removeAllCardViews;
@end
