//
//  UIButton+SoundButton.m
//  WestDemo
//
//  Created by seven on 2020/6/9.
//  Copyright © 2020 west. All rights reserved.
//

#import "UIButton+SoundButton.h"

@implementation UIButton (SoundButton)

-(void)drawRect:(CGRect)rect

{
    
    [super drawRect:rect];
    
    [super addTarget:self action:@selector(s) forControlEvents:(UIControlEventTouchUpInside)];
    
}
-(void)s{
    UIImpactFeedbackGenerator * gen = [[UIImpactFeedbackGenerator alloc] initWithStyle:(UIImpactFeedbackStyleMedium)];
    [gen prepare];
    [gen impactOccurred];
}

@end
