//
//  BIDCustomViewController.h
//  jPhoToV01
//
//  Created by Po-Ting Chiang on 2014-03-14.
//  Copyright (c) 2014 Po-Ting Chiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BIDCustomViewController : UIViewController
<UIPickerViewDelegate, UIPickerViewDataSource>

@property (strong, nonatomic) IBOutlet UIPickerView *BingoPicker;
@property (strong, nonatomic) IBOutlet UILabel *WinLabel;
@property (strong, nonatomic) NSArray *imageArray;
@property (strong, nonatomic) IBOutlet UIButton *button;

-(void) UpdateTimer;
-(IBAction)spin;
- (IBAction)spin:(UIButton *)sender;




@end
