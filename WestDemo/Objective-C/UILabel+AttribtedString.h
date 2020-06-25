//
//  UILabel+AttribtedString.h
//  WestDemo
//
//  Created by seven on 2020/6/17.
//  Copyright © 2020 west. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (AttribtedString)

- (NSMutableAttributedString *)attributedString:(NSString *)string;
@end

NS_ASSUME_NONNULL_END
