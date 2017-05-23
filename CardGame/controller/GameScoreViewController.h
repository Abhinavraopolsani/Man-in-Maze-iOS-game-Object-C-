//
//  GameScoreViewController.h
//  CardGame
//
//  Created by Banuri,Santosh on 4/7/14.
//  Copyright (c) 2014 Student. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GameScoreViewController : UIViewController<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UILabel *highscoretf;

- (IBAction)back:(id)sender;


@end
