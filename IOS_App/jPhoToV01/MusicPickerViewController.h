//
//  MusicPickerViewController.h
//  jPhoToV01
//
//  Created by Po-Ting Chiang on 2014-03-18.
//  Copyright (c) 2014 Po-Ting Chiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MusicPickerViewController : UIViewController
<UIPickerViewDataSource, UIPickerViewDelegate>

@property (strong, nonatomic) NSString* selectedRowTitle;
@property (strong, nonatomic) NSString* selectedMusicType;

-(void) UpdateTimer;
@end
