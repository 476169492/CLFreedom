//
//  RechargeVC.h
//  CLFreedom
//
//  Created by chenlei on 16/4/19.
//  Copyright © 2016年 laosiji. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <StoreKit/StoreKit.h>

enum{
    MyIAP1 = 1,
    IAP0p20=20,
    IAP1p100,
    IAP4p600,
    IAP9p1000,
    IAP24p6000,
}buyCoinsTag;

//代理
@interface RechargeVC : UIViewController <SKPaymentTransactionObserver,SKProductsRequestDelegate>
{
    int buyType;
}

- (void)requestProUpgradeProductData;

- (void)RequestProductData;

- (void)buy:(int)type;

- (void)paymentQueue:(SKPaymentQueue *)queue updatedTransactions:(NSArray *)transactions;

- (void)PurchasedTransaction: (SKPaymentTransaction *)transaction;

- (void)completeTransaction: (SKPaymentTransaction *)transaction;

- (void)failedTransaction: (SKPaymentTransaction *)transaction;

- (void)paymentQueueRestoreCompletedTransactionsFinished: (SKPaymentTransaction *)transaction;

- (void)paymentQueue:(SKPaymentQueue *) paymentQueue restoreCompletedTransactionsFailedWithError:(NSError *)error;

- (void)restoreTransaction: (SKPaymentTransaction *)transaction;

-(void)provideContent:(NSString *)product;

-(void)recordTransaction:(NSString *)product;

@end

