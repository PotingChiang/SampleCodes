//
//  SettingsViewController.h
//  jPhoToV01
//
//  Created by Po-Ting Chiang on 2014-04-25.
//  Copyright (c) 2014 Po-Ting Chiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingsViewController : UIViewController

@property CGFloat brush;
@property CGFloat opacity;

@property (weak, nonatomic) IBOutlet UISlider *brushControl;
@property (weak, nonatomic) IBOutlet UISlider *opacityControl;

@property (weak, nonatomic) IBOutlet UIImageView *brushPreview;
@property (weak, nonatomic) IBOutlet UIImageView *opacityPreview;

@property (weak, nonatomic) IBOutlet UILabel *brushValueLabel;
@property (weak, nonatomic) IBOutlet UILabel *opacityValueLabel;

- (IBAction)sliderChanged:(UISlider *)sender;


@end
