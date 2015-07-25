//
//  DataViewController.m
//  DrawPad
//
//  Created by Po-Ting Chiang on 2014-04-24.
//  Copyright (c) 2014 Po-Ting Chiang. All rights reserved.
//

#import "DataViewController.h"
#import "SettingsViewController.h"
#import <EventKitUI/EventKitUI.h>

@interface DataViewController ()
- (IBAction)AddEvent:(UIButton *)sender;

@end

@implementation DataViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
//    SettingsViewController *settingsVC = [[SettingsViewController alloc] init];
    
    red = 0.0/255.0;
    green = 0.0/255.0;
    blue = 0.0/255.0;
    brush = 1.5;
    opacity = 1.0;
//    brush = settingsVC.brush;
//    opacity = settingsVC.opacity;
}

- (IBAction)doneWithSettings:(UIStoryboardSegue *) segue
{
    SettingsViewController *settingsVC = segue.sourceViewController;
    brush = settingsVC.brush;
    opacity = settingsVC.opacity;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    mouseSwiped = NO;
    UITouch *touch = [touches anyObject];
    lastPoint = [touch locationInView:self.view];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    
    mouseSwiped = YES;
    UITouch *touch = [touches anyObject];
    CGPoint currentPoint = [touch locationInView:self.view];
    
    UIGraphicsBeginImageContext(self.view.frame.size);
    [self.tempDrawImage.image drawInRect:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    CGContextMoveToPoint(UIGraphicsGetCurrentContext(), lastPoint.x, lastPoint.y);
    CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), currentPoint.x, currentPoint.y);
    CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
    CGContextSetLineWidth(UIGraphicsGetCurrentContext(), brush );
    CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), red, green, blue, 1.0);
    CGContextSetBlendMode(UIGraphicsGetCurrentContext(),kCGBlendModeNormal);
    
    CGContextStrokePath(UIGraphicsGetCurrentContext());
    self.tempDrawImage.image = UIGraphicsGetImageFromCurrentImageContext();
    [self.tempDrawImage setAlpha:opacity];
    UIGraphicsEndImageContext();
    
    lastPoint = currentPoint;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
    if(!mouseSwiped) {
        UIGraphicsBeginImageContext(self.view.frame.size);
        [self.tempDrawImage.image drawInRect:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
        CGContextSetLineWidth(UIGraphicsGetCurrentContext(), brush);
        CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), red, green, blue, opacity);
        CGContextMoveToPoint(UIGraphicsGetCurrentContext(), lastPoint.x, lastPoint.y);
        CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), lastPoint.x, lastPoint.y);
        CGContextStrokePath(UIGraphicsGetCurrentContext());
        CGContextFlush(UIGraphicsGetCurrentContext());
        self.tempDrawImage.image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    }
    
    UIGraphicsBeginImageContext(self.mainImage.frame.size);
    [self.mainImage.image drawInRect:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) blendMode:kCGBlendModeNormal alpha:1.0];
    [self.tempDrawImage.image drawInRect:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) blendMode:kCGBlendModeNormal alpha:opacity];
    self.mainImage.image = UIGraphicsGetImageFromCurrentImageContext();
    self.tempDrawImage.image = nil;
    UIGraphicsEndImageContext();
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.dataLabel.text = [self.dataObject description];
}

- (IBAction)pencilPressed:(UIButton *)sender {
    
    UIButton * PressedButton = (UIButton*)sender;
    
    switch(PressedButton.tag)
    {
        case 0:
            red = 0.0/255.0;
            green = 0.0/255.0;
            blue = 0.0/255.0;
            break;
        case 1:
            red = 105.0/255.0;
            green = 105.0/255.0;
            blue = 105.0/255.0;
            break;
        case 2:
            red = 255.0/255.0;
            green = 0.0/255.0;
            blue = 0.0/255.0;
            break;
        case 3:
            red = 0.0/255.0;
            green = 0.0/255.0;
            blue = 255.0/255.0;
            break;
        case 4:
            red = 102.0/255.0;
            green = 204.0/255.0;
            blue = 0.0/255.0;
            break;
        case 5:
            red = 102.0/255.0;
            green = 255.0/255.0;
            blue = 0.0/255.0;
            break;
        case 6:
            red = 51.0/255.0;
            green = 204.0/255.0;
            blue = 255.0/255.0;
            break;
        case 7:
            red = 160.0/255.0;
            green = 82.0/255.0;
            blue = 45.0/255.0;
            break;
        case 8:
            red = 255.0/255.0;
            green = 102.0/255.0;
            blue = 0.0/255.0;
            break;
        case 9:
            red = 255.0/255.0;
            green = 255.0/255.0;
            blue = 0.0/255.0;
            break;
    }
}

- (IBAction)eraserPressed:(UIButton *)sender {
    
    red = 249.0/255.0;
    green = 234.0/255.0;
    blue = 188.0/255.0;
    opacity = 1.0;
    
}
- (IBAction)reset:(UIButton *)sender {
    
    self.mainImage.image = nil;
}

- (IBAction)save:(UIButton *)sender {
    
    self.reset.hidden = true;
    self.dataLabel.hidden = true;
    self.save.hidden = true;
    self.settings.hidden = true;
    self.addEvent.hidden = true;
    self.colorBlack.hidden = true;
    self.colorGrey.hidden = true;
    self.colorRed.hidden = true;
    self.colorBlue.hidden = true;
    self.colorGreen.hidden = true;
    self.colorLightGreen.hidden = true;
    self.colorLightBlue.hidden = true;
    self.brown.hidden = true;
    self.colorLightOrange.hidden = true;
    self.colorYelloe.hidden = true;
    self.eraser.hidden = true;

    UIGraphicsBeginImageContext(self.view.bounds.size);
    [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image=UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    UIImageWriteToSavedPhotosAlbum(image, self, nil, nil);
    
    UIAlertView *alertView=[[UIAlertView alloc]initWithTitle:@"" message:@"Save OK" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alertView show];
    
    self.reset.hidden = false;
    self.dataLabel.hidden = false;
    self.save.hidden = false;
    self.settings.hidden = false;
    self.addEvent.hidden = false;
    self.colorBlack.hidden = false;
    self.colorGrey.hidden = false;
    self.colorRed.hidden = false;
    self.colorBlue.hidden = false;
    self.colorGreen.hidden = false;
    self.colorLightGreen.hidden = false;
    self.colorLightBlue.hidden = false;
    self.brown.hidden = false;
    self.colorLightOrange.hidden = false;
    self.colorYelloe.hidden = false;
    self.eraser.hidden = false;
    
}

- (IBAction)settings:(UIButton *)sender {
}
- (IBAction)AddEvent:(UIButton *)sender {
    
    EKEventStore *eventStore = [[EKEventStore alloc] init];
    EKEventEditViewController *editController = [[EKEventEditViewController alloc]  init];
    editController.eventStore = eventStore;
    
    editController.editViewDelegate = self;
    
    [self presentViewController:editController animated:YES completion:NULL];
    
    if ([eventStore respondsToSelector:@selector(requestAccessToEntityType:completion:)])
    {
        [eventStore requestAccessToEntityType:EKEntityTypeEvent completion:^(BOOL granted, NSError *error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                if (error)
                {
                    // display error message here
                }
                else if (!granted)
                {
                    // display access denied error message here
                }
                else
                {
                    // access granted
                    // do the important stuff here
                }
            });
        }];
    }
    else
    {
        // do the important stuff here
    }
}

- (void) eventEditViewController:(EKEventEditViewController *)controller didCompleteWithAction:(EKEventEditViewAction)action
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}
@end
