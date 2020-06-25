//
//  MyNetApiClient.m
//  ZGChat
//
//  Created by JackLee on 2019/7/11.
//  Copyright © 2019 ZhiGe. All rights reserved.
//

#import "MyNetApiClient.h"
#import <MBProgressHUD/MBProgressHUD.h>
#import <YYKit/YYKit.h>
@interface MyNetApiClient()

/// 多种url地址可切换
@property (nonatomic, assign) BOOL roteUrlBool;

@end

@implementation MyNetApiClient
+ (instancetype)sharedClient {
    static MyNetApiClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient =[MyNetApiClient manager];
        _sharedClient.responseSerializer = [AFJSONResponseSerializer serializer];
        _sharedClient.requestSerializer = [AFJSONRequestSerializer serializer];

        _sharedClient.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html",@"text/plain",nil];
        
//        //获取可以切换的ip地址
//        NSMutableArray *tempswitchArray = [[NSMutableArray alloc] init];
//        NSArray *swithUrlArray = ZChatServiceSwitchUrl;
//        if (swithUrlArray && swithUrlArray.count > 0) {
//            for (NSString *url in swithUrlArray) {
//                
//                if (url && url.length > 0) {
//                    [tempswitchArray addObject:url];
//                }
//            }
//        }
//        if (tempswitchArray.count > 0) {
//            _sharedClient.urlArray = tempswitchArray;
//            _sharedClient.roteUrlBool = YES;
//        }else{
//            _sharedClient.roteUrlBool = NO;
//        }
        
    });
    
    return _sharedClient;
}

+(void)requestPOSTUrl:(NSString*)url parameters:(id)data msg:(NSString*)msg superView:(UIView*)view finshBlock:(void (^)(NSDictionary * obj,NSError * error))finshBlock{
    [self reqeustType:HttpType_POST Url:url msg:msg parameters:data superView:view finshBlock:finshBlock];
}

#pragma mark ======================== reqeust ========================
+(void)reqeustType:(HttpType)type Url:(NSString*)url msg:(NSString*)msg parameters:(id)data superView:(UIView*)view  finshBlock:(FinshBlock)finshBlock{
    
    MBProgressHUD *hud;
    if (view) {
        hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
        hud.label.text = msg ? : @"";
        [hud showAnimated:YES];
    }
//
//    if ([ZGUsetInfo myUserInfo].userId) {
//        [[MyNetApiClient sharedClient].requestSerializer setValue:[ZGUsetInfo myUserInfo].userId forHTTPHeaderField:@"X-uid"];
//    }
//
//    if ([ZGUsetInfo myUserInfo].token) {
//        [[MyNetApiClient sharedClient].requestSerializer setValue:[ZGUsetInfo myUserInfo].token forHTTPHeaderField:@"X-token"];
//    }
//    [[MyNetApiClient sharedClient].requestSerializer setValue:@"iphone" forHTTPHeaderField:@"User-Agent"];
//
//    [[MyNetApiClient sharedClient].requestSerializer setValue:[[WFCCNetworkService sharedInstance] getClientId] forHTTPHeaderField:@"X-cid"];
//
    
    NSString *requestUrl = url;
    if (![requestUrl hasPrefix:@"http"]) {
        requestUrl = [MyNetApiClient httpUrlWithUrlStr:url isPort:YES];
    }
    
//#ifdef DEBUG
//    NSLog(@"reqeust HttpType: %ld \n URL: %@,\n %@",(long)type, url, data);
//    NSString * number = [MyUserDefaults objectForKey:BUSINESS_NUMBER]?:MERCHANT_ID;
//    [[MyNetApiClient sharedClient].requestSerializer setValue:number forHTTPHeaderField:@"X-Merchant"];
//#else
//    [[MyNetApiClient sharedClient].requestSerializer setValue:MERCHANT_ID forHTTPHeaderField:@"X-Merchant"];
//#endif
    
     __weak typeof(self) weakSelf = self;
    switch (type) {
        case HttpType_POST:{
            
            [[MyNetApiClient sharedClient] POST:requestUrl parameters:data headers:nil progress:^(NSProgress * _Nonnull uploadProgress) {
                
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                
                __strong typeof(weakSelf) self = weakSelf; if(!self) return ;
                
                [hud hideAnimated:YES];
                successCallback(task,responseObject,view ,finshBlock);
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                failureCallBack(task, error,view, finshBlock);

            }];
        }
            break;
        case HttpType_GET:{
            [[MyNetApiClient sharedClient] GET:requestUrl parameters:data headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                [hud hideAnimated:YES];
                successCallback(task,responseObject,view ,finshBlock);
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                [hud hideAnimated:YES];
              
                __strong typeof(weakSelf) self = weakSelf; if(!self) return ;
                
//                if ([self checkSwitchUrl:error]) {
//                    [self searchUrlreqeustType:type Url:url wholeUrl:requestUrl msg:msg parameters:data superView:view finshBlock:finshBlock];
//                }else{
                    failureCallBack(task, error,view, finshBlock);
//                }
            }];
        }
            break;
        case HttpType_DELETE:{
            [[MyNetApiClient sharedClient] DELETE:requestUrl parameters:data headers:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                [hud hideAnimated:YES];
                successCallback(task,responseObject,nil ,finshBlock);
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                [hud hideAnimated:YES];

                __strong typeof(weakSelf) self = weakSelf; if(!self) return ;
                
//                if ([self checkSwitchUrl:error]) {
//                    [self searchUrlreqeustType:type Url:url wholeUrl:requestUrl msg:msg parameters:data superView:view finshBlock:finshBlock];
//                }else{
                    failureCallBack(task, error,view, finshBlock);
//                }
            }];
        }
            break;
        case HttpType_PUT:{
            [[MyNetApiClient sharedClient] PUT:requestUrl parameters:data headers:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                [hud hideAnimated:YES];
                successCallback(task,responseObject,nil ,finshBlock);
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                [hud hideAnimated:YES];
                
                __strong typeof(weakSelf) self = weakSelf; if(!self) return ;
                
//                if ([self checkSwitchUrl:error]) {
//                    [self searchUrlreqeustType:type Url:url wholeUrl:requestUrl msg:msg parameters:data superView:view finshBlock:finshBlock];
//                }else{
                    failureCallBack(task, error,view, finshBlock);
//                }

            }];
        }
            break;
            
        default:
            break;
    }
}


void successCallback (NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject, UIView * view, FinshBlock finshBlock) {
    NSDictionary *dict = responseObject;
#ifdef DEBUG
    NSLog(@"responst from URL: %@, %@", task.response.URL, dict.modelDescription);
#endif
    int code = [dict[@"code"] intValue];
    if(code == 0000) {
        id tmpObj = dict[@"data"];
        if ([tmpObj isKindOfClass:[NSNull class]]) {
            finshBlock(nil, nil);
        }else{
            finshBlock(tmpObj, nil);
        }
    } else {
//        [ShareMeans showErrorMsg:view type:code msg:dict[@"message"]];
        NSError * e = [NSError errorWithDomain:NSURLErrorDomain code:code userInfo:@{@"msg":dict[@"message"]}];
        finshBlock(nil,  e);
    }
}

void failureCallBack(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error,UIView * view, FinshBlock finshBlock) {
#ifdef DEBUG
    NSLog(@"err from URL: %@, %@,  %li", task.response.URL, error.description,(long)error.code);
#endif
    NSHTTPURLResponse * rs = (NSHTTPURLResponse*)task.response;
//    [ShareMeans showErrorMsg:[AppDelegate APP].window type:(int)rs.statusCode msg:error.localizedFailureReason];
    finshBlock(nil,error);
}

#pragma mark ======================== url ========================


/// 判断Url是否需要重新查找
/// @param error error
+ (BOOL)checkSwitchUrl:(NSError *)error {
    
    /*
     -1009网络出错 -1001服务器不可访问
     */
    if (![MyNetApiClient sharedClient].roteUrlBool) {
        return NO;
    }
    
    if (error.code == -1001) {
        return YES;
    }
    
    return NO;
}

//+(NSString*)httpUrlWithUrlStr:(NSString*)urlstr isPort:(BOOL)isPort{
//    if (isPort) {
//        NSString * url = [NSString stringWithFormat:@"http://%@:%d%@", ZChatServiceUrl, ZG_APP_SERVER_PORT,urlstr];
////        NSString * url = [NSString stringWithFormat:@"https://%@%@", ZChatServiceUrl,urlstr];
//        return url;
//    }
//    return [NSString stringWithFormat:@"http://%@%@", ZChatServiceUrl,urlstr];
//
//
//}


#pragma mark ======================== tcp => http  ========================
//+(void)psotWithUrl:(NSString*)url body:(id)body superView:(UIView*)view  finshBlock:(FinshBlock)finshBlock{
//    MBProgressHUD *hud;
//    if (view) {
//        hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
//        [hud showAnimated:YES];
//    }
//
//    NSURL * nsurl = [NSURL URLWithString:[MyNetApiClient httpUrlWithUrlStr:url isPort:NO]];
//    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:nsurl];
//    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
//    [request setValue:[ZGUsetInfo myUserInfo].aes_cid forHTTPHeaderField:@"cid"];
//    [request setValue:[ZGUsetInfo myUserInfo].aes_uid forHTTPHeaderField:@"uid"];
//    request.HTTPMethod = @"POST";
//#ifdef DEBUG
//    NSLog(@"myHttp from URL: %@, %@", nsurl,body);
//    NSLog(@"uid = %@",[ZGUsetInfo myUserInfo].aes_uid);
//    NSLog(@"cid = %@",[ZGUsetInfo myUserInfo].aes_cid);
//#endif
//    if (body) {
//        request.HTTPBody = body;
//    }
//    NSURLSession * session = [NSURLSession sharedSession];
//    NSURLSessionDataTask * dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//
//        dispatch_async(dispatch_get_main_queue(), ^{
//            [hud hideAnimated:YES];
//            if (error) {
//                finshBlock(nil,error);
//            }else{
//                NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
//#ifdef DEBUG
//                NSLog(@"myHttp response URL: %@, %@", nsurl,dic.modelDescription);
//#endif
//                if (dic) {
//                    NSNumber * code = dic[@"code"];
//                    if (code.intValue == 0) {
//                        id tmpObj = dic[@"result"];
//                        finshBlock(tmpObj,nil);
//                    }
//                }else{
//                    finshBlock(nil,[NSError new]);
//                }
//            }
//        });
//    }];
//    [dataTask resume];
//}

//+(void)httpSendMsgWithType:(int)type data:(id)dic target:(NSString*)targetid mediaType:(int)mediaType remoteMediaUrl:(NSString *)remoteMediaUrl finshBlock:(FinshBlock)finshBlock{
//    NSDictionary *dic2 = @{
//        @"sender" : [ZGUsetInfo myUserInfo].userId,
//        @"conv": @{
//                @"type": @0,
//                @"target":targetid,
//                @"line": @0,
//        },
//        @"payload":@{
//                @"type":@(type),
//                @"content":dic,
//                @"remoteMediaUrl":remoteMediaUrl,
//                @"mediaType":@(mediaType),
//        },
//    };
//
//    NSData *data = [NSJSONSerialization dataWithJSONObject:dic2 options:NSJSONWritingPrettyPrinted error:nil];
//    NSString * jsonStr = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
//
//    NSString * aes_token = [ZGUsetInfo myUserInfo].decTokeon;
//    NSString * json_dec = SeanEncryptWithScrAES(jsonStr,aes_token);
//    NSDictionary * dic3 = @{@"data":json_dec};
//
//    NSData *data2 = [NSJSONSerialization dataWithJSONObject:dic3 options:NSJSONWritingPrettyPrinted error:nil];
//
//    [MyNetApiClient psotWithUrl:MASS_URL body:data2 superView:nil finshBlock:^(NSDictionary *obj, NSError *error) {
//        if (error == nil) {
//            finshBlock(nil,nil);
//        }
//    }];
//}

#pragma mark - 查找其它可用的URL地址

//+ (void)searchUrlreqeustType:(HttpType)type Url:(NSString*)url wholeUrl:(NSString *)wholeUrl msg:(NSString*)msg parameters:(id)data superView:(UIView*)view  finshBlock:(FinshBlock)finshBlock {
//
//    NSArray *urlArray = [MyNetApiClient sharedClient].urlArray;
//
//    dispatch_queue_t concurrentQueue = dispatch_queue_create("searchUrl_manager", DISPATCH_QUEUE_CONCURRENT);
//    dispatch_group_t group_t = dispatch_group_create();
//
//    NSMutableArray *canRespondArray = [[NSMutableArray alloc] init];
//
//
//    __block id sucResponseObject = nil;
//    __block  NSError * respondError  = nil;
//
//    for (NSString *pre in urlArray) {
//
//        dispatch_group_enter(group_t);
//
//        dispatch_group_async(group_t, concurrentQueue, ^{
//
//
//            NSString * requestUrl = [NSString stringWithFormat:@"http://%@%@", pre,url];;
//
//            if ([ZGUsetInfo myUserInfo].userId) {
//                [[MyNetApiClient sharedClient].requestSerializer setValue:[ZGUsetInfo myUserInfo].userId forHTTPHeaderField:@"X-uid"];
//            }
//
//            if ([ZGUsetInfo myUserInfo].token) {
//                [[MyNetApiClient sharedClient].requestSerializer setValue:[ZGUsetInfo myUserInfo].token forHTTPHeaderField:@"X-token"];
//            }
//            [[MyNetApiClient sharedClient].requestSerializer setValue:@"iphone" forHTTPHeaderField:@"User-Agent"];
//
//            [[MyNetApiClient sharedClient].requestSerializer setValue:[[WFCCNetworkService sharedInstance] getClientId] forHTTPHeaderField:@"X-cid"];
//            [MyNetApiClient sharedClient].requestSerializer.timeoutInterval = 10;
//
//
//#ifdef DEBUG
//            NSString * number1 = [MyUserDefaults objectForKey:BUSINESS_NUMBER]?:MERCHANT_ID;
//            [[MyNetApiClient sharedClient].requestSerializer setValue:number1 forHTTPHeaderField:@"X-Merchant"];
//#else
//            [[MyNetApiClient sharedClient].requestSerializer setValue:MERCHANT_ID forHTTPHeaderField:@"X-Merchant"];
//#endif
//
//
//            __weak typeof(self) weakSelf = self;
//            switch (type) {
//                case HttpType_POST:{
//
//
//                    [[MyNetApiClient sharedClient] POST:requestUrl parameters:data progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//
//                        dispatch_group_leave(group_t);
//                        sucResponseObject = responseObject;
//                        [canRespondArray addObject:pre];
//
//                    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//
//                        dispatch_group_leave(group_t);
//                        respondError = error;
//
//                        __strong typeof(weakSelf) self = weakSelf;
//                        if(!self)return ;
//                    }];
//
//
//                }
//                    break;
//                case HttpType_GET:{
//                    [[MyNetApiClient sharedClient] GET:requestUrl parameters:data progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//
//                        dispatch_group_leave(group_t);
//                        sucResponseObject = responseObject;
//                        [canRespondArray addObject:pre];
//
//                    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//
//                        dispatch_group_leave(group_t);
//                        respondError = error;
//
//                        __strong typeof(weakSelf) self = weakSelf;
//                        if(!self)return ;
//                    }];
//                }
//                    break;
//                case HttpType_DELETE:{
//                    [[MyNetApiClient sharedClient] DELETE:requestUrl parameters:data success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//
//                        dispatch_group_leave(group_t);
//                        sucResponseObject = responseObject;
//                        [canRespondArray addObject:pre];
//
//                    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//                        dispatch_group_leave(group_t);
//                        respondError = error;
//
//                        __strong typeof(weakSelf) self = weakSelf;
//                        if(!self)return ;
//
//                    }];
//                }
//                    break;
//                case HttpType_PUT:{
//                    [[MyNetApiClient sharedClient] PUT:requestUrl parameters:data success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//
//                        dispatch_group_leave(group_t);
//                        sucResponseObject = responseObject;
//                        [canRespondArray addObject:pre];
//
//                    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//                        dispatch_group_leave(group_t);
//                        respondError = error;
//
//                        __strong typeof(weakSelf) self = weakSelf;
//                        if(!self)return ;
//
//                    }];
//                }
//                    break;
//
//                default:
//                    break;
//            }
//        });
//
//
//        dispatch_group_notify(group_t, dispatch_get_main_queue(), ^{
//
//
//            if (canRespondArray.count > 0) {
//
//                NSString *url = canRespondArray.firstObject;
//
//                if (url) {
//                    [[NSUserDefaults standardUserDefaults] setObject:url forKey:@"kAutoRoteServiceUrl"];
//                    [[NSUserDefaults standardUserDefaults] synchronize];
//                }
//            }
//
//            if (finshBlock) {
//
//                if (sucResponseObject) {
//                    successCallback(nil,sucResponseObject,nil ,finshBlock);
//                }else{
//                    failureCallBack(nil, respondError,view, finshBlock);
//
//                }
//            }
//
//        });
//
//    }
//
//}

@end

