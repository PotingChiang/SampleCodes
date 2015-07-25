//
//  DataViewController.h
//  DrawPad
//
//  Created by Po-Ting Chiang on 2014-04-24.
//  Copyright (c) 2014 Po-Ting Chiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <EventKitUI/EventKitUI.h>

@interface DataViewController : UIViewController
<EKEventEditViewDelegate>
{
    
    CGPoint lastPoint;
    CGFloat red;
    CGFloat green;
    CGFloat blue;
    CGFloat brush;
    CGFloat opacity;
    BOOL mouseSwiped;
}

@property (strong, nonatomic) IBOutlet UILabel *dataLabel;
@property (strong, nonatomic) id dataObject;

@property (weak, nonatomic) IBOutlet UIImageView *mainImage;
@property (weak, nonatomic) IBOutlet UIImageView *tempDrawImage;


- (IBAction)pencilPressed:(UIButton *)sender;
- (IBAction)eraserPressed:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *reset;
@property (weak, nonatomic) IBOutlet UIButton *settings;
@property (weak, nonatomic) IBOutlet UIButton *save;
@property (weak, nonatomic) IBOutlet UIButton *colorBlack;
@property (weak, nonatomic) IBOutlet UIButton *colorGrey;
@property (weak, nonatomic) IBOutlet UIButton *colorRed;
@property (weak, nonatomic) IBOutlet UIButton *colorBlue;
@property (weak, nonatomic) IBOutlet UIButton *colorGreen;
@property (weak, nonatomic) IBOutlet UIButton *colorLightGreen;
@property (weak, nonatomic) IBOutlet UIButton *colorLightBlue;
@property (weak, nonatomic) IBOutlet UIButton *brown;
@property (weak, nonatomic) IBOutlet UIButton *colorLightOrange;
@property (weak, nonatomic) IBOutlet UIButton *colorYelloe;
@property (weak, nonatomic) IBOutlet UIButton *eraser;
@property (weak, nonatomic) IBOutlet UIButton *addEvent;




- (IBAction)reset:(UIButton *)sender;
- (IBAction)save:(UIButton *)sender;
- (IBAction)settings:(UIButton *)sender;


@end
