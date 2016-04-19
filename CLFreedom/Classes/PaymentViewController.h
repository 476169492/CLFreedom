//
//  PaymentViewController.h
//  CLFreedom
//
//  Created by chenlei on 16/4/19.
//  Copyright © 2016年 laosiji. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <StoreKit/StoreKit.h>

@interface PaymentViewController : UIViewController<SKPaymentTransactionObserver,SKProductsRequestDelegate>

@property (strong, nonatomic) IBOutlet UITextField *productID;

@property (strong, nonatomic) IBOutlet UIButton *purchase;

- (IBAction)purchaseFunc:(id)sender;

@end

