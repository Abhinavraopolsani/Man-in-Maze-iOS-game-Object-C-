//
//  CardGameAppDelegate.h
//  CardGame
//
//  Created by Banuri,Santosh on 3/18/14.
//  Copyright (c) 2014 Student. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
@interface CardGameAppDelegate : UIResponder <UIApplicationDelegate,AVAudioPlayerDelegate>
{
    AVAudioPlayer *audioPlayer1;
}

@property (strong, nonatomic) UIWindow *window;
@property int flipcount;
-(void)playmusic;


@end
