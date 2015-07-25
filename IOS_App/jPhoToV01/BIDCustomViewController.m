//
//  BIDCustomViewController.m
//  jPhoToV01
//
//  Created by Po-Ting Chiang on 2014-03-14.
//  Copyright (c) 2014 Po-Ting Chiang. All rights reserved.
//

#import "BIDCustomViewController.h"
#import <AudioToolbox/AudioToolbox.h>

@interface BIDCustomViewController ()
{
    
    IBOutlet UILabel *label;
    NSTimer *timer;
}


@end

@implementation BIDCustomViewController
{
    SystemSoundID winSoundID;
    SystemSoundID crunchSoundID;
    
}


-(void) UpdateTimer {
    
    NSDateFormatter *Formatter = [[NSDateFormatter alloc] init];
    [Formatter setDateFormat:@"hh:mm:ss"];
    label.text = [Formatter stringFromDate:[NSDate date]];
    
}

-(void)showButton
{
    self.button.hidden = false;
}

-(void)playWithSound
{
    if (winSoundID == 0)
    {
        NSURL *soundURL = [[NSBundle mainBundle] URLForResource:@"win" withExtension:@"wav"];
        AudioServicesCreateSystemSoundID((__bridge CFURLRef)(soundURL), &winSoundID);
    }
    
    AudioServicesPlaySystemSound(winSoundID);
    self.WinLabel.text = @"WINNING";
    [self performSelector:@selector(showButton) withObject:nil afterDelay:1.5];
}

-(IBAction)spin
{
    [self playWithSound];
    BOOL win = false;//NO
    NSInteger numInRow = 1;
    NSInteger lastVal = -1;
    for (NSInteger i = 0; i < 3; i++)
    {
        NSInteger newValue = random() % [self.imageArray count];
        if (newValue == lastVal)
        {
            numInRow++;
        }
        else
        {
            numInRow = 1;
            
        }
        
        lastVal = newValue;
        
        [self.BingoPicker selectRow:newValue inComponent:i animated:YES];//animated:True
        [self.BingoPicker reloadComponent:i];
        
        if (numInRow >= 3)
        {
            win = true;//YES
        }
    }
    
    if (crunchSoundID == 0)
    {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"crunch" ofType:@"wav"];
        NSURL *soundRUL = [NSURL fileURLWithPath:path];
        AudioServicesCreateSystemSoundID((__bridge CFURLRef)soundRUL, &crunchSoundID);
    }
    
    AudioServicesPlaySystemSound(crunchSoundID);
    
    
    if (win)
    {
        [self performSelector:@selector(playWithSound) withObject:nil afterDelay:.5];
    }
    else
    {
        [self performSelector:@selector(showButton) withObject:nil afterDelay:.5];
    }
    
    self.button.hidden = true;
    self.WinLabel.text = @"J's BingO";
    
    
}

- (IBAction)spin:(UIButton *)sender
{
//    BOOL win = NO;//False
//    NSInteger numInRow = 1;
//    NSInteger lastVal = -1;
//    for (int i = 0; i < 3; i++)
//    {
//        NSInteger newValue = random() % [self.imageArray count];
//        if (newValue == lastVal)
//        {
//            numInRow++;
//        }
//        else
//        {
//            numInRow = 1;
//            
//        }
//        
//        lastVal = newValue;
//        
//        [self.BingoPicker selectRow:newValue inComponent:i animated:YES];//animated:True
//        [self.BingoPicker reloadComponent:i];
//        
//        if (numInRow >= 3)
//        {
//            win = true;//YES
//        }
//    }
//    
//    if (win)
//    {
//        self.WinLabel.text = @"WIN";
//    }
//    else
//    {
//        self.WinLabel.text = @"J's BingO";
//    }
//
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.imageArray = @[[UIImage imageNamed:@"seven"], [UIImage imageNamed:@"bar"], [UIImage imageNamed:@"apple"], [UIImage imageNamed:@"cherry"], [UIImage imageNamed:@"crown"], [UIImage imageNamed:@"lemon"]];
    
    timer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(UpdateTimer) userInfo:Nil repeats:YES];
    
    //srandom(time(NULL));//??
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark PickerDataSource Methods
-(NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    
    return 3;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [self.imageArray count];
    
}


#pragma mark PickerDelegate Methods
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    UIImage * image = self.imageArray[row];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    
    return imageView;
}



@end
