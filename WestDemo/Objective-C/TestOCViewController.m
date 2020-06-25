//
//  TestOCViewController.m
//  WestDemo
//
//  Created by seven on 2020/6/17.
//  Copyright © 2020 west. All rights reserved.
//

#import "TestOCViewController.h"
#import "Exten.h"
#import "MyNetApiClient.h"
@interface TestOCViewController ()

@end

@implementation TestOCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 300, 50)];
    [self.view addSubview:label];
    label.attributedText = [Exten attributedBaseString:@"1231231231241244" keyString:@"1"];
    [self data];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)data {
    [MyNetApiClient requestPOSTUrl:@"http://hope.wuqiongda8888.com/source/sources" parameters:@{@"categoryName":@"baobaoxuetangshi"} msg:@"" superView:nil finshBlock:^(NSDictionary *obj, NSError *error) {
        NSLog(@"%@",obj);
    }];
    
    
    [MyNetApiClient requestPOSTUrl:@"http://hope.wuqiongda8888.com/source/sourceDetails" parameters:@{@"sourceId":@"1"} msg:@"" superView:nil finshBlock:^(NSDictionary *obj, NSError *error) {
        NSLog(@"%@",obj);
    }];
    
    
    [MyNetApiClient requestPOSTUrl:@"http://hope.wuqiongda8888.com/changeUrl" parameters:@{@"selQuality":@"",@"type":@"vod",@"playUrl":@"https://www.iqiyi.com/v_19rrifwgj1.html?vfm=m_312_shsp#curid=161417700_5481800145aa4226a84312b2463fee47"} msg:@"" superView:nil finshBlock:^(NSDictionary *obj, NSError *error) {
        NSLog(@"%@",obj);
    }];
//
    [MyNetApiClient requestPOSTUrl:@"http://hope.wuqiongda8888.com/source/search" parameters:@{@"sourceName":@"1"} msg:@"" superView:nil finshBlock:^(NSDictionary *obj, NSError *error) {
        NSLog(@"%@",obj);
    }];
    
}

@end
