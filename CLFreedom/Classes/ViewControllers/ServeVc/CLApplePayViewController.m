//
//  CLApplePayViewController.m
//  CLFreedom
//  apple Pay
//  Created by chenlei on 16/3/7.
//  Copyright © 2016年 laosiji. All rights reserved.
//

#import "CLApplePayViewController.h"
#import <PassKit/PassKit.h>

@interface CLApplePayViewController ()<PKPaymentAuthorizationViewControllerDelegate>

@property (retain,nonatomic) PKPaymentAuthorizationViewController *paymentPane;
@end

@implementation CLApplePayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = BACKGROUND_COLOR;
    
    
    if([PKPaymentAuthorizationViewController canMakePayments]) {
        
        PKPaymentRequest *request = [[PKPaymentRequest alloc] init];
        request.countryCode = @"CN";
        request.currencyCode = @"CNY";
        request.supportedNetworks = @[PKPaymentNetworkMasterCard, PKPaymentNetworkVisa,PKPaymentNetworkChinaUnionPay];
        request.merchantCapabilities =  PKMerchantCapability3DS | PKMerchantCapabilityEMV | PKMerchantCapabilityCredit ;
        request.merchantIdentifier = @"merchant.com.freedom.paydemo";
        
        
        PKPaymentSummaryItem *widget1 = [PKPaymentSummaryItem summaryItemWithLabel:@"铅笔" amount:[NSDecimalNumber decimalNumberWithString:@"0.01"]];
        
        PKPaymentSummaryItem *widget2 = [PKPaymentSummaryItem summaryItemWithLabel:@"钢笔" amount:[NSDecimalNumber decimalNumberWithString:@"0.02"]];
        
        PKPaymentSummaryItem *total = [PKPaymentSummaryItem summaryItemWithLabel:@"总付" amount:[NSDecimalNumber decimalNumberWithString:@"0.03"]];
        
        request.paymentSummaryItems = @[widget1, widget2, total];

        
        
        self.paymentPane = [[PKPaymentAuthorizationViewController alloc] initWithPaymentRequest:request];
        self.paymentPane.delegate = self;
        [self presentViewController:self.paymentPane animated:TRUE completion:nil];
    }
    else
    {
        [APPTools showHudWithTextAutoCalculateShowTime:@"该设备不支持Apple Pay"];
    }

}

//认证成功
- (void)paymentAuthorizationViewController:(PKPaymentAuthorizationViewController *)controller didAuthorizePayment:(PKPayment *)payment completion:(void (^)(PKPaymentAuthorizationStatus))completion
{
    if (payment)  //这里默认成功
    {
        completion(PKPaymentAuthorizationStatusSuccess);
        [APPTools showHudWithTextAutoCalculateShowTime:@"支付成功"];
    }
}

//认证完成
- (void)paymentAuthorizationViewControllerDidFinish:(PKPaymentAuthorizationViewController *)controller
{
    [self.paymentPane dismissViewControllerAnimated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
