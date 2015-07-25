//
//  AlbumPickerViewController.h
//  jPhoToV01
//
//  Created by Po-Ting Chiang on 2014-03-15.
//  Copyright (c) 2014 Po-Ting Chiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AlbumPickerViewController : UIViewController
<UIPickerViewDataSource, UIPickerViewDelegate>

@property (strong, nonatomic) NSString *selectedRowTitle;
@property (strong, nonatomic) NSString *selectedYear;

-(void) UpdateTimer;

@end
