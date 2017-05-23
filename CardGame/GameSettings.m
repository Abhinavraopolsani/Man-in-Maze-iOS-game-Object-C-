//
//  GameSettings.m
//  CardGame
//
//  Created by Banuri,Santosh on 4/3/14.
//  Copyright (c) 2014 Student. All rights reserved.
//

#import "GameSettings.h"
#import "GameResult.h"
@implementation GameSettings



-(void) updateUI{
    NSString *displayText = @"";
    
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"HH:mm MMM dd"];
    
    
    for(GameResult *result in [GameResult allGameResults]){
        NSString* formattedDate = [formatter stringFromDate:result.end];
        displayText = [displayText stringByAppendingFormat:@"%@ Score: %d ( %@ for %g sec)\n",result.gameName, result.score, formattedDate, round(result.duration)];
    }
    if([displayText length]==0){
        displayText = @"There is no game score available! go to play some games.";
    }
    self.display.text = displayText;
}

-(void)setup
{
    
}

-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self updateUI];
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
@end
