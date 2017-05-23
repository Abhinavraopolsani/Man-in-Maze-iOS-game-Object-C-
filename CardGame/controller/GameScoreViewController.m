//
//  GameScoreViewController.m
//  CardGame
//
//  Created by Banuri,Santosh on 4/7/14.
//  Copyright (c) 2014 Student. All rights reserved.
//

#import "GameScoreViewController.h"
#import "GameResult.h"
#import "StartViewController.h"

@interface GameScoreViewController ()
@property (weak, nonatomic) IBOutlet UITextView *display;
@property int highscor;
@property int lowscore;

@end

@implementation GameScoreViewController

-(void) updateUI{
    NSString *displayText = @"";
    
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"HH:mm MMM dd"];
    
    int x=0;
    for(GameResult *result in [GameResult allGameResults])
    {
        
        if(x>5)
        {
            
        }
        else
        {
        NSString* formattedDate = [formatter stringFromDate:result.end];
        displayText = [displayText stringByAppendingFormat:@"%@ Score: %d ( %@ for %g sec)\n",result.gameName, result.score, formattedDate, round(result.duration)];
        }
        x++;
    }
    self.highscor=0;
    for(GameResult *res in [GameResult allGameResults])
    {
        
        if(res.score > self.highscor)
        {
            self.highscor=res.score;
            
        }
    }
    self.highscoretf.text=[NSString stringWithFormat:@"%d",self.highscor];
    if([displayText length]==0)
    {
        displayText = @"There is no game score available! go to play some games.";
    }
    self.display.text = displayText;
}

-(void)setup
{
    
}

-(void) viewWillAppear:(BOOL)animated
{
 
    [super viewWillAppear:animated];
    
    [self updateUI];

//    self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"scoring.jpg"]];
}

-(void)awakeFromNib
{
    [self setup];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    [self setup];
    return self;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
- (IBAction)back:(id)sender
{
    StartViewController *start=[self.storyboard instantiateViewControllerWithIdentifier:@"startgame"];
    [self presentViewController:start animated:YES completion:nil];
    
}
@end
