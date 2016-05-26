//
//  CLNetWorkCenter.m
//  CLFreedom
//
//  Created by chenlei on 16/2/16.
//  Copyright © 2016年 laosiji. All rights reserved.
//

#import "CLNetWorkCenter.h"

@implementation CLNetWorkCenter

+ (CLNetWorkCenter *)sharedNetWorkCenter
{
    static dispatch_once_t once;
    static CLNetWorkCenter *sharedNetWorkCenter;
    dispatch_once(&once, ^{
        sharedNetWorkCenter = [[self alloc] init];
    });
    return sharedNetWorkCenter;
}

//- (void)getMenuDetailsWithName:(NSString *)name
//                        completion:(void(^)(NSError *error,NSDictionary *resultDic))handler
//{
//    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    
//    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
//    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
//    [manager.requestSerializer setValue:UMeng_APP_KEY forHTTPHeaderField:@"apikey"];
//    
//    [manager GET:@"http://apis.baidu.com/tngou/cook" parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
//        
//    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        
//        NSData *doubi = responseObject;
//        NSString *shabi =  [[NSString alloc]initWithData:doubi encoding:NSUTF8StringEncoding];
//        
//        TLLog(@"%@",shabi)
//        
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        
//        
//        
//        
//    }];
//}




@end
