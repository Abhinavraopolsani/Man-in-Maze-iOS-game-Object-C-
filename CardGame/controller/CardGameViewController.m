//
//  CardGameViewController.m
//  CardGame
//
//  Created by Banuri,Santosh on 3/26/14.
//  Copyright (c) 2014 Student. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCard.h"
#import "PlayingCardDeck.h"
#import "QuartzCore/QuartzCore.h"
#import "GameResult.h"
#import "CardHeaderView.h"
#import "FlipResultView.h"
#import "SetGameViewController.h"
#import "PlayingCardGameViewController.h"
#import "CardGameAppDelegate.h"

#define PLAYABLE_CARD_SECTION 0
#define PLAYDONE_CARD_SECTION 1
#import <QuartzCore/QuartzCore.h>
#import "StartViewController.h"

@interface CardGameViewController()
@property (strong, nonatomic) GameResult *gameResult;
@property (strong, nonatomic) NSMutableArray *cardsDonePlay;
@property (weak, nonatomic) IBOutlet UIButton *drawMoreCardButton;
@property (weak, nonatomic) IBOutlet FlipResultView *flipResultView;
@property CardGameAppDelegate *del;
@property int count;
@end

@implementation CardGameViewController


-(NSMutableArray *) cardsDonePlay{
    if(!_cardsDonePlay)
    {
        _cardsDonePlay = [[NSMutableArray alloc]init];
    }
    return _cardsDonePlay;
}

-(GameResult*) gameResult{
    if(!_gameResult){
        _gameResult = [[GameResult alloc]initWithGameName:self.gameName];
    }
    return _gameResult;
}

-(CardMatchingGame*) game
{
    if(!_game){
        _game = [[CardMatchingGame alloc] initWitCardCount:[self startingCardCount] usingDeck:[self getCardDeck]  withMatchCardNumber:[self numberOfMatchedCardInGame]];
    }
    return _game;
}

- (void)setFlipCount:(int)flipCount{
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %i",self.flipCount];
}
-(void)viewDidLoad:(BOOL)animated
{
    
    self.navigationItem.title=@"Level 1";
    [super viewDidLoad];
    self.count=0;
    
        NSError *error;
        NSString *noiseURL=[[NSBundle mainBundle]
                       pathForResource:@"buzzer" ofType:@"mp3"];
   
    avp=[[AVAudioPlayer alloc]initWithContentsOfURL:[NSURL fileURLWithPath:noiseURL] error:&error];
   
    self.del=[[CardGameAppDelegate alloc]init];
     if(error)
          {
            NSLog(@"failed to load sound :%@",[error localizedDescription]);
           return;
          }
          NSString   *noiseURL1=[[NSBundle mainBundle]pathForResource:@"win" ofType:@"mp3"];
  
      win=[[AVAudioPlayer alloc]initWithContentsOfURL:[NSURL fileURLWithPath:noiseURL1] error:&error];
   
    avp.delegate=self;
          [avp setVolume:1.0];
         [avp play];
   avp.numberOfLoops=-1;
    win.delegate=self;
         [win setVolume:1.0];
         [win play];
    
    win.numberOfLoops=-1;
    
         [self becomeFirstResponder];
    
    
}
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self becomeFirstResponder];
    
}
- (BOOL)canBecomeFirstResponder { return YES; }
//-(void)viewDidUnload
//{
//    [avp RE];
//    
//}
- (void)updateUI
{
    self.scoreLabel.text = [NSString stringWithFormat:@"score:%d",self.game.score];
    self.gameResult.score = self.game.score;
    if(self.flipCount)
    {
        
        
//        SetGameViewController *setgame=[self.storyboard instantiateViewControllerWithIdentifier:@"NexlLvelGame"];
//        [self.navigationController pushViewController:setgame animated:YES];
     }
    else
    {
//        PlayingCardGameViewController *playingcard=[self.storyboard instantiateViewControllerWithIdentifier:@"playingcard"];
//        [self.navigationController pushViewController:playingcard animated:YES];
        
//        UIAlertView *view=[[UIAlertView alloc]initWithTitle:@"Hello" message:@"You have finished this level and press ok to go to next level" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
//        [view show];
//        
//        
//        UIViewController *setview=[self.storyboard instantiateViewControllerWithIdentifier:@"NexlLvelGame"];
//        [self presentViewController:setview animated:YES completion:nil];
    }
    
    if( [self.game pointsEarnInLastOperation] == FLIP_PENALTY )
    {
        // flip a card
        self.flipResultView.prefixString = @"";
//        self.flipResultView.sufixString = @"flipped";
        [self.cardCollectionView reloadData];
    }
    else if( [self.game pointsEarnInLastOperation] < 0 )
    {
        NSString *music=[[NSBundle mainBundle]pathForResource:@"buzzer" ofType:@"mp3"];
        NSError *error;
        audioPlayer1=[[AVAudioPlayer alloc]initWithContentsOfURL:[NSURL fileURLWithPath:music] error:&error];
        
        audioPlayer1.delegate=self;
        //            audioPlayer1.numberOfLoops=-1;
        [audioPlayer1 play];

        // found no match
        self.flipResultView.prefixString = @"";
        
        
        self.flipResultView.sufixString = [NSString stringWithFormat: @"don’t match! %i point penalty!",abs([self.game pointsEarnInLastOperation])];
        [self.cardCollectionView reloadData];
        
    }
    else if( [self.game pointsEarnInLastOperation] > 0 )
    
    
    {
        
//        [win stop];
        
        NSString *music=[[NSBundle mainBundle]pathForResource:@"match" ofType:@"wav"];
        NSError *error;
        audioPlayer1=[[AVAudioPlayer alloc]initWithContentsOfURL:[NSURL fileURLWithPath:music] error:&error];
        
        audioPlayer1.delegate=self;
        //            audioPlayer1.numberOfLoops=-1;
        [audioPlayer1 play];

        
//        [win play];
        // found a match

        self.flipResultView.prefixString = @"Matched";
        self.flipResultView.sufixString = [NSString stringWithFormat:@"for %i points",[self.game pointsEarnInLastOperation]];
        
        NSArray *cardsToBeRemoved = [self.game cardsInlastOperation];
        NSMutableArray *cardIndexesToBeDeleted = [[NSMutableArray alloc]init];
        NSMutableArray *cardIndexesToBeAdded = [[NSMutableArray alloc]init];
        NSMutableArray *removedCard = [[NSMutableArray alloc]init];
//        self.flipCount=2;
        // get indexes of card in collection to be removed
        
       [audioPlayer1 stop];
        for(Card *card in cardsToBeRemoved)
        {
            // remove card from model
            
            NSString *music=[[NSBundle mainBundle]pathForResource:@"match" ofType:@"wav"];
            NSError *error;
            audioPlayer1=[[AVAudioPlayer alloc]initWithContentsOfURL:[NSURL fileURLWithPath:music] error:&error];
            
            audioPlayer1.delegate=self;
            //            audioPlayer1.numberOfLoops=-1;
            [audioPlayer1 play];
            

            [cardIndexesToBeDeleted addObject:[NSIndexPath indexPathForItem:[self.game indexOfCard:card] inSection:PLAYABLE_CARD_SECTION]];
//            NSString *music=[[NSBundle mainBundle]pathForResource:@"buzzer" ofType:@"mp3"];
//            NSError *error;
//            audioPlayer1=[[AVAudioPlayer alloc]initWithContentsOfURL:[NSURL fileURLWithPath:music] error:&error];
//            
//            audioPlayer1.delegate=self;
//            audioPlayer1.numberOfLoops=-1;
//            [audioPlayer1 play];
            
            
//             [win play];
            
            }
//        [audioPlayer1 stop];
//        for(int i=0;i<[cardsToBeRemoved count];i++)
//            {
//                [cardIndexesToBeAdded addObject:[NSIndexPath indexPathForItem:[self.game indexOfCard:cardsToBeRemoved[i]] inSection:PLAYABLE_CARD_SECTION]];
//            }
//        
        
        // remove card from model
        for(Card *card in cardsToBeRemoved)
        {
            self.count++;
           
            [self.game removeCard:card];
            [removedCard addObject:card];
          
            if(self.count==13)
            {
                                         UIAlertView *view=[[UIAlertView alloc]initWithTitle:@"Hello" message:@"You have finished this level and press ok to go to next level" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
              [view show];
               
            }
            //             [win play];
            

        }
//        for(Card *card in cardsToBeRemoved)
        {
//            self.count++;
            
//            [self.game removeCard:card];
//            [removedCard addObject:card];
//            if(self.count==13)
//            {
//                UIAlertView *view=[[UIAlertView alloc]initWithTitle:@"Hello" message:@"You have finished this level and press ok to go to next level" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
//                [view show];
//                
//            }
//            if(self.count==13)
//            {
//                UIAlertView *view=[[UIAlertView alloc]initWithTitle:@"Hello" message:@"You have finished this level and press ok to go to next level" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
//                [view show];
//                
//            }
            //             [win play];
            
            
        }
        
        // add cards to doneplay card list
        [cardIndexesToBeAdded addObject:[NSIndexPath indexPathForItem:[self.cardsDonePlay count] inSection:PLAYDONE_CARD_SECTION]];
        [self.cardsDonePlay addObject:[removedCard copy]];
        
        // remove card from collection view
        [self.cardCollectionView performBatchUpdates:^{
            [self.cardCollectionView deleteItemsAtIndexPaths:cardIndexesToBeDeleted];
            //[self.cardCollectionView insertItemsAtIndexPaths:cardIndexesToBeAdded];
        } completion:^(BOOL finished)
         {
            [self.cardCollectionView reloadData];
        }];
    }else{
        self.flipResultView.prefixString = @"";
        self.flipResultView.sufixString = @"";
        [self.cardCollectionView reloadData];
    }
    [self.flipResultView removeAllCardViews];
    for(int i=0;i<[self.game cardsInlastOperation].count;i++)
    {
       [self.flipResultView addCardView:[self createCardViewUsingCard:[self.game cardsInlastOperation][i]]];
    }
//    for( Card *card in [self.game cardsInlastOperation])
//    {
//        [self.flipResultView addCardView:[self createCardViewUsingCard:card]];
//    }
    

    
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(buttonIndex==1)
    {
    SetGameViewController *setgame=[self.storyboard instantiateViewControllerWithIdentifier:@"NexlLvelGame"];
    [self.navigationController presentViewController:setgame animated:YES completion:Nil];
    }
    else
    {
    StartViewController *play=[self.storyboard instantiateViewControllerWithIdentifier:@"startgame"];
    [self.navigationController presentViewController:play animated:YES completion:nil];
    }
}

- (IBAction)flipCard:(UIButton *)sender
{
    //[self.game flipCardAtIndex:[self.cardButtons indexOfObject:sender]];
    self.gameResult.score = self.game.score;
    [self updateUI];
    self.flipCount++;
}

- (IBAction)dealButtonClicked:(id)sender
{
    self.count=0;
    self.game = nil;
    self.gameResult = nil;
    self.flipCount = 0;
    self.drawMoreCardButton.enabled = YES;
    [self.drawMoreCardButton setTitle:@"Draw Cards" forState:UIControlStateNormal];
    [self updateUI];
}

- (IBAction)drawMoreCards:(id)sender
{
    self.count=self.count-3;
    NSArray *cardDrawed = [self.game drawMoreCardWithCardCount:3];

    if([cardDrawed count]+1==0)
    {
        [self.drawMoreCardButton setTitle:@"Empty Deck" forState:UIControlStateDisabled];
        [self.drawMoreCardButton setTitleColor:[UIColor grayColor] forState:UIControlStateDisabled];
        self.drawMoreCardButton.enabled = NO;
    }
    // update ui collection view
    NSMutableArray *indexesToBeAdded = [[NSMutableArray alloc]init];
    for(Card *card in cardDrawed){
        [indexesToBeAdded addObject:[NSIndexPath indexPathForItem:[self.game indexOfCard:card] inSection:PLAYABLE_CARD_SECTION]];
    }
    [self.cardCollectionView performBatchUpdates:^{
        [self.cardCollectionView insertItemsAtIndexPaths:indexesToBeAdded];
    } completion:^(BOOL finished) {
        [self.cardCollectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem: [self.cardCollectionView numberOfItemsInSection:PLAYABLE_CARD_SECTION]-1 inSection:PLAYABLE_CARD_SECTION] atScrollPosition: UICollectionViewScrollPositionNone animated:YES];
    }];
    
}

-(NSString*) gameName{
    return @"Level 1";
}

- (Deck*)getCardDeck{
    return nil;
}

- (NSUInteger)startingCardCount{
    return 0;
}

#pragma mark - ╭━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╮
#pragma mark - ┃ collection view datasource {  ┃
#pragma mark - ╰━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╯


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if(section == PLAYABLE_CARD_SECTION){ // playing cards
        return [self.game playableCardCount];
    }else if(section == PLAYDONE_CARD_SECTION){ // cards that done play
        return [self.cardsDonePlay count];
    }else{
        return 0;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell;
    if(indexPath.section == PLAYABLE_CARD_SECTION){
        cell = [self.cardCollectionView dequeueReusableCellWithReuseIdentifier:@"CardCell" forIndexPath:indexPath];
        [self updateCell:cell useringCard:[self.game cardAtIndex:indexPath.item]];

    }else if(indexPath.section == PLAYDONE_CARD_SECTION){
        cell = [self.cardCollectionView dequeueReusableCellWithReuseIdentifier:@"CardSetCell" forIndexPath:indexPath];
        //[self updateCell:cell useringCardSet:[self.cardsDonePlay objectAtIndex:indexPath.item]];
    }
    
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    CardHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"CardHeaderView" forIndexPath:indexPath];
    //NSString *searchTerm = self.searches[indexPath.section];
    //[headerView setSearchText:searchTerm];
    return headerView;
}

#pragma mark - ╭━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╮
#pragma mark - ┃ collection view datasource }  ┃
#pragma mark - ╰━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╯

#pragma mark - ╭━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╮
#pragma mark - ┃ gesture recoginzer         {  ┃
#pragma mark - ╰━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╯
- (IBAction)cardCellClicked:(UITapGestureRecognizer *)gesture {
    CGPoint tapLocation = [gesture locationInView:self.cardCollectionView];
    NSIndexPath *indexPath = [self.cardCollectionView indexPathForItemAtPoint:tapLocation];
    if(indexPath){
        [self.game flipCardAtIndex:indexPath.item];
        [self updateUI];        
    }
}

#pragma mark - ╭━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╮
#pragma mark - ┃ gesture recoginzer         }  ┃
#pragma mark - ╰━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╯


- (void) updateCell:(UICollectionViewCell*) cell useringCard:(Card*)card{
    // abstract
}

- (void) updateCell:(UICollectionViewCell*) cell useringCardSet:(NSArray*)cardSet{
    // abstract
}

- (UIView*) createCardViewUsingCard:(Card*) card{
    // abstract
    return nil;
}

@end
