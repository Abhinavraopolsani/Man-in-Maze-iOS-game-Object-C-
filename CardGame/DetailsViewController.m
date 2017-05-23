//
//  DetailsViewController.m
//  CardGame
//
//  Created by Banuri,Santosh on 4/17/14.
//  Copyright (c) 2014 Student. All rights reserved.
//

#import "DetailsViewController.h"
#import "StartViewController.h"
@interface DetailsViewController ()

@end

@implementation DetailsViewController

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
//    
//     self.displaynames.text=s3;
    
    self.name1.text=@"Santosh Banuri";
    self.name2.text=@"Nivedan Suresh";
    self.name3.text=@"Dinesh Valishetty";
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/**
 * When clicked on back button it returns to the home page
 **/
- (IBAction)back:(id)sender
{
    StartViewController *start=[self.storyboard instantiateViewControllerWithIdentifier:@"startgame"];
    [self presentViewController:start animated:YES completion:nil];
    
}
@end
