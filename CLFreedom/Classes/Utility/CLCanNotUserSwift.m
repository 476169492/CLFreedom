//
//  CLCanNotUserSwift.m
//  CLFreedom
//
//  Created by chenlei on 16/3/7.
//  Copyright © 2016年 laosiji. All rights reserved.
//

#import "CLCanNotUserSwift.h"

@implementation CLCanNotUserSwift

+ (BOOL)isNumValidateIdentityCardWithScan:(NSScanner *)scan
{
    int val;
    BOOL isNum = [scan scanInt:&val] && [scan isAtEnd];
    return isNum;
}
@end
