//
//  CLCanNotUserSwift.h
//  CLFreedom
//  这是一个特殊类(处理很多在swift不好处理和不会处理的swift代码转而使用oc代码来替代)
//  Created by chenlei on 16/3/7.
//  Copyright © 2016年 laosiji. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CLCanNotUserSwift : NSObject

//处理身份证validate中的不会写的swift代码
+ (BOOL)isNumValidateIdentityCardWithScan:(NSScanner *)scan;


@end
