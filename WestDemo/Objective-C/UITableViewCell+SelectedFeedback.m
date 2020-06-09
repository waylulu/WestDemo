//
//  UITableViewCell+SelectedFeedback.m
//  WestDemo
//
//  Created by seven on 2020/6/9.
//  Copyright © 2020 west. All rights reserved.
//

#import "UITableViewCell+SelectedFeedback.h"

@implementation UITableViewCell (SelectedFeedback)
- (void)drawRect:(CGRect)rect{
//    [super performSelector:@selector(gen) withObject:self];
    [super drawRect:rect];
    
    
    UIView *view_bg = [[UIView alloc]initWithFrame:self.frame];
    view_bg.backgroundColor = [UIColor cyanColor];
    self.selectedBackgroundView = view_bg;
    
    
}
- (void)gen{
    UISelectionFeedbackGenerator * gen = [[UISelectionFeedbackGenerator alloc] init];
    [gen selectionChanged];
}
@end
