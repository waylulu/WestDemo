//
//  MyNetApiClient.h
//  ZGChat
//
//  Created by JackLee on 2019/7/11.
//  Copyright © 2019 Ruby. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

typedef NS_ENUM(NSInteger, HttpType) {
    HttpType_POST = 0,
    HttpType_GET,
    HttpType_PUT,
    HttpType_DELETE,
};
typedef void(^FinshBlock)(NSDictionary * obj,NSError * error);

@interface MyNetApiClient : AFHTTPSessionManager

@property (nonatomic, strong) NSArray *urlArray;

+ (instancetype)sharedClient;

+(void)requestPOSTUrl:(NSString*)url parameters:(id)data msg:(NSString*)msg superView:(UIView*)view finshBlock:(void (^)(NSDictionary * obj,NSError * error))finshBlock;
+(void)reqeustType:(HttpType)type Url:(NSString*)url msg:(NSString*)msg parameters:(id)data superView:(UIView*)view  finshBlock:(FinshBlock)finshBlock;

+(void)psotWithUrl:(NSString*)url body:(id)body superView:(UIView*)view  finshBlock:(FinshBlock)finshBlock;


+(void)httpSendMsgWithType:(int)type data:(id )dic target:(NSString*)targetid mediaType:(int)mediaType remoteMediaUrl:(NSString *)remoteMediaUrl finshBlock:(FinshBlock)finshBlock;


+(NSString*)httpUrlWithUrlStr:(NSString*)urlstr isPort:(BOOL)isPort;

@end
