//
//  SFMyRoundRectButton.m
//  SonicFit
//
//  Created by Nihar Mehta on 2/17/14.
//  Copyright (c) 2014 FUHSD. All rights reserved.
//

#import "SFMyRoundRectButton.h"

@implementation SFMyRoundRectButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    CALayer *btnLayer = [super layer];
    [btnLayer setMasksToBounds:YES];
    [btnLayer setCornerRadius:5.0f];

    [super drawRect:rect];

    [btnLayer setMasksToBounds:YES];
    [btnLayer setCornerRadius:5.0f];
}

@end
