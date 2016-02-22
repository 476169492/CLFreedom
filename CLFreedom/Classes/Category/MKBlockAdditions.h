//
//  MKBlockAdditions.h
//  ThumbLoan
//
//  Created by ios on 15/2/15.
//  Copyright (c) 2015年 zendai. All rights reserved.
//

typedef void (^VoidBlock)();

typedef void (^DismissBlock)(int buttonIndex);
typedef void (^CancelBlock)();
typedef void (^PhotoPickedBlock)(UIImage *chosenImage);

#define kPhotoActionSheetTag 10000
