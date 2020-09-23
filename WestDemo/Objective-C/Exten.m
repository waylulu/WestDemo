//
//  Exten.m
//  WestDemo
//
//  Created by seven on 2020/6/17.
//  Copyright © 2020 west. All rights reserved.
//

#import "Exten.h"
#import <UIKit/UIKit.h>

@implementation Exten

+ (NSMutableAttributedString *)attributedBaseString:(NSString *)baseString keyString:(NSString*)keyString{
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:baseString attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13],NSForegroundColorAttributeName:[UIColor blackColor]}];

        //遍历字符串中指定字符的所有位置
        NSRange isRange = [attributedString.string rangeOfString:keyString];
        while (isRange.location != NSNotFound || isRange.length != 0) {
            //设置指定字符的属性
            [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor blueColor] range:isRange];
            //字体背景颜色
    //        [attributedString addAttribute:NSBackgroundColorAttributeName value:[UIColor rgb:BK_Color] range:isRange];
            //重设指定字符的位置
            NSRange searchIsRange = NSMakeRange(isRange.location + isRange.length, attributedString.string.length - (isRange.location + isRange.length));
            isRange = [attributedString.string rangeOfString:keyString options:NSCaseInsensitiveSearch range:searchIsRange];
        }

    return attributedString;
}



/**
 *  判断当前时间是否处于某个时间段内
 *
 *  @param startTime        开始时间
 *  @param expireTime       结束时间
 */

+ (BOOL)validateWithStartTime:(NSString *)startTime withExpireTime:(NSString *)expireTime {
    NSDate *today = [NSDate date];
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    
    [dateFormat setDateFormat:@"HH:mm"];
    NSString * todayStr=[dateFormat stringFromDate:today];//将日期转换成字符串
    today = [ dateFormat dateFromString:todayStr];//转换成NSDate类型。日期置为方法默认日期
    
    NSDate *start = [dateFormat dateFromString:startTime];
    NSDate *expire = [dateFormat dateFromString:expireTime];

    if ([today compare:start] == NSOrderedDescending && [today compare:expire] == NSOrderedAscending) {
        return YES;
    }
    return NO;
}

@end
