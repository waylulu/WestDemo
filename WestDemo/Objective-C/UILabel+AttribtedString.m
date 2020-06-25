//
//  UILabel+AttribtedString.m
//  WestDemo
//
//  Created by seven on 2020/6/17.
//  Copyright © 2020 west. All rights reserved.
//

#import "UILabel+AttribtedString.h"

@implementation UILabel (AttribtedString)

- (NSMutableAttributedString *)attributedString:(NSString *)string{
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:self.text attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13],NSForegroundColorAttributeName:[UIColor blackColor]}];

        //遍历字符串中指定字符的所有位置
        NSRange isRange = [attributedString.string rangeOfString:string];
        while (isRange.location != NSNotFound || isRange.length != 0) {
            //设置指定字符的属性
            [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor blueColor] range:isRange];
            //字体背景颜色
    //        [attributedString addAttribute:NSBackgroundColorAttributeName value:[UIColor rgb:BK_Color] range:isRange];
            //重设指定字符的位置
            NSRange searchIsRange = NSMakeRange(isRange.location + isRange.length, attributedString.string.length - (isRange.location + isRange.length));
            isRange = [attributedString.string rangeOfString:string options:NSCaseInsensitiveSearch range:searchIsRange];
        }

    return attributedString;
}


@end
