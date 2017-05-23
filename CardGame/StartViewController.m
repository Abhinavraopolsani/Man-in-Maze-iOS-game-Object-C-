//
//  StartViewController.m
//  CardGame
//
//  Created by Banuri,Santosh on 4/17/14.
//  Copyright (c) 2014 Student. All rights reserved.
//

#import "StartViewController.h"
#import "GameScoreViewController.h"
#import "DetailsViewController.h"
@interface StartViewController ()
@property BOOL toogle;
@property  NSTimer *timer;
@end

@implementation StartViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
   
    
    [super viewDidLoad];
      [self flashOn:self.play];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background.jpg"]];
    self.navigationItem.title=@"Memory Game";
   
	// Do any additional setup after loading the view.
}
- (void)flashOff:(UIView *)v
{
    [UIView animateWithDuration:1.0 delay:0 options:UIViewAnimationOptionAllowUserInteraction animations:^ {
        v.alpha = .01;  //don't animate alpha to 0, otherwise you won't be able to interact with it
    } completion:^(BOOL finished) {
        [self flashOn:v];
    }];
}

- (void)flashOn:(UIView *)v
{
    [UIView animateWithDuration:1.0 delay:0 options:UIViewAnimationOptionAllowUserInteraction animations:^ {
        v.alpha = 1;
    } completion:^(BOOL finished)
    {
        [self flashOff:v];
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)score:(id)sender
{
    GameScoreViewController *gm=[self.storyboard instantiateViewControllerWithIdentifier:@"gamescore"];
    [self presentViewController:gm animated:YES completion:nil];
    
}

- (IBAction)credits:(id)sender
{
    DetailsViewController *details=[self.storyboard instantiateViewControllerWithIdentifier:@"creditgame"];
    [self presentViewController:details animated:YES completion:nil];
    
}


@end
