//
//  Exten.h
//  WestDemo
//
//  Created by seven on 2020/6/17.
//  Copyright © 2020 west. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Exten : NSObject
+ (NSMutableAttributedString *)attributedBaseString:(NSString *)baseString keyString:(NSString*)keyString;

/**
 *  判断当前时间是否处于某个时间段内
 *
 *  @param startTime        开始时间
 *  @param expireTime       结束时间
 */

+ (BOOL)validateWithStartTime:(NSString *)startTime withExpireTime:(NSString *)expireTime;
@end


NS_ASSUME_NONNULL_END
