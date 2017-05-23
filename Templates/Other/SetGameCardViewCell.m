//
//  SetGameCardViewCell.m
//  CardGame
//
//  Created by Banuri,Santosh on 3/23/14.
//  Copyright (c) 2014 Student. All rights reserved.
//

#import "SetGameCardViewCell.h"
#import "SetCardView.h"

@interface SetGameCardViewCell()
@property (weak, nonatomic) IBOutlet SetCardView *setCardView;

@end
@implementation SetGameCardViewCell

- (void) setNumber:(NSUInteger)number
{
    _number = number;
    self.setCardView.number = number+1;
}

- (void) setSymbol:(NSUInteger)symbol
{
    _symbol = symbol;
    self.setCardView.shape = symbol+1;
}

-(void) setShading:(NSUInteger)shading
{
    _shading = shading;
    self.setCardView.fill = shading+1;
}

-(void) setColor:(NSUInteger)color
{
    _color = color;
    self.setCardView.color = color+1;
}

-(void)setDrawOutLine:(BOOL)drawOutLine
{
    _drawOutLine = drawOutLine;
    self.setCardView.drawSelected = drawOutLine;
}


#pragma mark - Initialization

-(void)setup
{
    // do inialization here
    
}

-(void)awakeFromNib{
    [self setup];
}

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    [self setup];
    return self;
}


@end
