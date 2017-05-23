//
//  StartViewController.h
//  CardGame
//
//  Created by Banuri,Santosh on 4/17/14.
//  Copyright (c) 2014 Student. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StartViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *play;

- (IBAction)score:(id)sender;

- (IBAction)credits:(id)sender;


@end
