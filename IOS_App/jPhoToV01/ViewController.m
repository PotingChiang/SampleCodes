//
//  ViewController.m
//  jPhoToV01
//
//  Created by Po-Ting Chiang on 2/7/2014.
//  Copyright (c) 2014 Po-Ting Chiang. All rights reserved.
//

#import "ViewController.h"
#import "AlbumPickerViewController.h"
#import "MusicPickerViewController.h"
#import "AppSettingsViewController.h"


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *AllScreenPlay;
@property (weak, nonatomic) IBOutlet UITextField *Date;
@property (weak, nonatomic) IBOutlet UIButton *AutoPlayButton;
@property (weak, nonatomic) IBOutlet UIButton *AutoStopButton;
@property (weak, nonatomic) IBOutlet UIImageView *PhotoViewer;
@property (weak, nonatomic) IBOutlet UIStepper *StepSpeed;
@property (weak, nonatomic) IBOutlet UILabel *PhotoName;
@property (weak, nonatomic) IBOutlet UITextView *SpeedHint;
@property (weak, nonatomic) IBOutlet UILabel *RealTime;
@property (weak, nonatomic) IBOutlet UISlider *SliderBar;
@property (weak, nonatomic) IBOutlet UIImageView *CopyRighticon;
@property (weak, nonatomic) IBOutlet UILabel *CopyRightText;
@property (weak, nonatomic) IBOutlet UILabel *volumeLabel;
@property (weak, nonatomic) IBOutlet UISlider *vloumeSlider;



- (IBAction)SilderValueChanged:(UISlider *)sender;
- (IBAction)MusicPlayer:(UISegmentedControl *)sender;
- (IBAction)StepSpeedChanged:(UIStepper *)sender;
- (IBAction)AutoPlay:(UIButton *)sender;
- (IBAction)AutoStop:(UIButton *)sender;
- (IBAction)PhotoViewer:(UISlider *)sender;

@end

@implementation ViewController
{

    
    IBOutlet UILabel *label;
    NSTimer *timer;
    
    NSString *photoFile_1;
    NSString *photoFile_2;
    NSString *photoFile_3;
    NSString *albumTitle;
    NSString *albumYear;
    NSArray *photoImage;
    NSString* musicType;
    NSString* musicTitle;
    

    
    
}


-(IBAction)cancelWithMusicPicker:(UIStoryboardSegue*) segue
{
    
    
}

-(IBAction)doneWithMusicPicker:(UIStoryboardSegue*) segue
{
    MusicPickerViewController *musicPicker = segue.sourceViewController;
    //musicType = musicPicker.selectedMusicType;
    musicTitle = musicPicker.selectedRowTitle;
    
    NSString *soundFilePath = [[NSBundle mainBundle]pathForResource:musicTitle ofType:@"mp3"];
    NSURL *fileUrl = [[NSURL alloc] initFileURLWithPath:soundFilePath];
    self.avPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:fileUrl error:nil];
    self.avPlayer.numberOfLoops = 10;
}
-(IBAction) cancelWithAlbumPicker:(UIStoryboardSegue *) segue
{
    
    
}
-(IBAction) doneWithAlbumPicker:(UIStoryboardSegue *) segue
{
    
    AlbumPickerViewController *albumPicker = segue.sourceViewController;
    albumYear = albumPicker.selectedYear;
    albumTitle = albumPicker.selectedRowTitle;
    if ([albumTitle isEqualToString: @"4Friends"])
    {
        photoFile_1 = [NSString stringWithFormat:@"%@_1.jpg", albumTitle];
        photoFile_2 = [NSString stringWithFormat:@"%@_2.jpg", albumTitle];
        photoFile_3 = [NSString stringWithFormat:@"%@_3.jpg", albumTitle];
    }
    
    else if ([albumTitle isEqualToString: @"BaseBallGame"])
    {
        photoFile_1 = [NSString stringWithFormat:@"%@_1.jpg", albumTitle];
        photoFile_2 = [NSString stringWithFormat:@"%@_2.jpg", albumTitle];
        photoFile_3 = [NSString stringWithFormat:@"%@_3.jpg", albumTitle];
    }
    else if ([albumTitle isEqualToString: @"BreakTime"])
    {
        photoFile_1 = [NSString stringWithFormat:@"%@_1.jpg", albumTitle];
        photoFile_2 = [NSString stringWithFormat:@"%@_2.jpg", albumTitle];
        photoFile_3 = [NSString stringWithFormat:@"%@_3.jpg", albumTitle];
    }
    else if ([albumTitle isEqualToString: @"Calgary"])
    {
        photoFile_1 = [NSString stringWithFormat:@"%@_1.jpg", albumTitle];
        photoFile_2 = [NSString stringWithFormat:@"%@_2.jpg", albumTitle];
        photoFile_3 = [NSString stringWithFormat:@"%@_3.jpg", albumTitle];
    }
    else if ([albumTitle isEqualToString: @"Memory"])
    {
        photoFile_1 = [NSString stringWithFormat:@"%@_1.jpg", albumTitle];
        photoFile_2 = [NSString stringWithFormat:@"%@_2.jpg", albumTitle];
        photoFile_3 = [NSString stringWithFormat:@"%@_3.jpg", albumTitle];
    }
    else if ([albumTitle isEqualToString: @"Xmas"])
    {
        photoFile_1 = [NSString stringWithFormat:@"%@_1.jpg", albumTitle];
        photoFile_2 = [NSString stringWithFormat:@"%@_2.jpg", albumTitle];
        photoFile_3 = [NSString stringWithFormat:@"%@_3.jpg", albumTitle];
    }
    else
    {
        albumTitle = @"No Album Selected";
        photoFile_1 = @"white-apple-logo-wallpaper.jpg";
        photoFile_2 = @"white-apple-logo-wallpaper.jpg";
        photoFile_3 = @"white-apple-logo-wallpaper.jpg";
    }
    
    photoImage = @[
                   [UIImage imageNamed:photoFile_1],
                   [UIImage imageNamed:photoFile_2],
                   [UIImage imageNamed:photoFile_3]
                   ];
    
    
    self.AllScreenPlay.animationImages = photoImage;
    
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
	// Do any additional setup after loading the view, typically from a nib.
    
//    MPVolumeView* volumeView = [[MPVolumeView alloc] initWithFrame:CGRectMake(212, 476, 88, 30)];
//    MPVolumeView* volumeView = [[MPVolumeView alloc] init];
//    [volumeView setFrame:CGRectMake(212, 300, 88, 30)];
//    [self.view addSubview:volumeView];

//    NSString *photoXmas = @"Xmas";
//    NSString *photoBreakTime = @"BreakTime";

//    if (albumTitle == nil)
//    {
//        albumTitle = @"4Friends";
//    }
//        for (NSInteger i = 0; i < 3; i++)
//        {
//            photoFile = [NSString stringWithFormat:@"%@_%d",photo4Friends, i];
//            photoImage = @[[NSArray arrayWithContentsOfFile:photoFile]];
//
//
//
    
    
//        }
    // = [self.albumManager photosInAlbum:@"2013"];
    
    albumTitle = @"j-PhoTo";
    photoFile_1 = @"white-apple-logo-wallpaper.jpg";
    photoFile_2 = @"white-apple-logo-wallpaper.jpg";
    photoFile_3 = @"white-apple-logo-wallpaper.jpg";
    
    timer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(UpdateTimer) userInfo:Nil repeats:YES];
    
    
//    NSString *title = @"HELLO";
//    NSString *message = @"Please Choose an Item :";
//    UIAlertView *alertHaha  = [[UIAlertView alloc] initWithTitle:title message:message delegate:self cancelButtonTitle:@"Leave" otherButtonTitles:@"Play j-PhoTo", nil];
//    
//    [alertHaha show];

}

-(void) UpdateTimer {
    
    NSDateFormatter *Formatter = [[NSDateFormatter alloc] init];
    [Formatter setDateFormat:@"hh:mm:ss"];
    label.text = [Formatter stringFromDate:[NSDate date]];
    
}

- (IBAction)SilderValueChanged:(UISlider *)sender
{
    self.avPlayer.volume = sender.value;
    
}

- (IBAction)MusicPlayer:(UISegmentedControl *)sender
{
    if (sender.selectedSegmentIndex == 0)
    {
        [self.avPlayer stop];
        
        self.volumeLabel.hidden = true;
        self.vloumeSlider.hidden = true;
        self.CopyRightText.hidden = false;
        self.CopyRighticon.hidden = false;
    }
    else if (sender.selectedSegmentIndex == 1)
    {
        [self.avPlayer play];
        [self.avPlayer numberOfLoops];
        
        self.volumeLabel.hidden = false;
        self.vloumeSlider.hidden = false;
        self.CopyRighticon.hidden = true;
        self.CopyRightText.hidden = true;
        
//        UIView *volumeHolder = [[UIView alloc] initWithFrame:CGRectMake(30, 200, 260, 20)];
//        
//        [volumeHolder setBackgroundColor:[UIColor clearColor]];
//        
//        [self.view addSubview:volumeHolder];
//        
//        MPVolumeView *myvolumeView = [[MPVolumeView alloc] initWithFrame:volumeHolder.bounds];
//        
//        [volumeHolder addSubview:myvolumeView];
    }
}

- (IBAction)StepSpeedChanged:(UIStepper *)sender {
    
    self.AllScreenPlay.animationDuration = self.StepSpeed.maximumValue - self.StepSpeed.value;
    if (!self.AllScreenPlay.isAnimating) {
        
        [self.AllScreenPlay startAnimating];
    }
}

- (IBAction)AutoPlay:(UIButton *)sender {
    
    self.AutoPlayButton.enabled = false;
    self.AutoStopButton.enabled = true;
    self.StepSpeed.hidden = false;
    self.SpeedHint.hidden = false;
    self.Date.hidden = true;
    self.PhotoName.hidden = true;
    self.RealTime.hidden = true;
    self.SliderBar.hidden = true;
//    self.CopyRighticon.hidden = true;
//    self.CopyRightText.hidden = true;
    
    
    self.AllScreenPlay.animationDuration = 12;
    [self.AllScreenPlay startAnimating];

}

- (IBAction)AutoStop:(UIButton *)sender {
    
    self.AutoPlayButton.enabled = true;
    self.AutoStopButton.enabled = false;
    self.StepSpeed.hidden = true;
    self.SpeedHint.hidden = true;
    self.Date.hidden = false;
    self.PhotoName.hidden = false;
    self.RealTime.hidden = false;
    self.SliderBar.hidden = false;
//    self.CopyRighticon.hidden = false;
//    self.CopyRightText.hidden = false;
    
    [self.AllScreenPlay stopAnimating];
}

- (IBAction)PhotoViewer:(UISlider *)sender
{
    NSString *viewerText = [NSString stringWithFormat:@"%.0f", sender.value];
    NSInteger viewerChoice = [viewerText integerValue];
    
    switch (viewerChoice)
    {
            
//        case 0:
//            self.PhotoViewer.image = [UIImage imageNamed:@"white-apple-logo-wallpaper.jpg"];
//            self.PhotoName.text = @"j-PhoTo";
//            self.Date.text = @"";
//            break;
        case 1:
            self.PhotoViewer.image = [UIImage imageNamed:photoFile_1];
            self.PhotoName.text = albumTitle;
            self.Date.text = albumYear;
            break;
        case 2:
            self.PhotoViewer.image = [UIImage imageNamed:photoFile_2];
            self.PhotoName.text = albumTitle;
            self.Date.text = albumYear;
            break;
        case 3:
            self.PhotoViewer.image = [UIImage imageNamed:photoFile_3];
            self.PhotoName.text = albumTitle;
            self.Date.text = albumYear;
            break;
            //        case 4:
            //            self.PhotoViewer.image = [UIImage imageNamed:@"BubbleTea 2013-12-25.jpg"];
            //            self.PhotoName.text = @"BubbleTea";
            //            self.Date.text = @"2013-12-25";
            //            break;
            //        case 5:
            //            self.PhotoViewer.image = [UIImage imageNamed:@"HomeViewLRT 2013-08-22.jpg"];
            //            self.PhotoName.text = @"HomeViewLRT";
            //            self.Date.text = @"2013-08-22";
            //            break;
            //        case 6:
            //            self.PhotoViewer.image = [UIImage imageNamed:@"HomeViewLRTFront 2013-08-22.jpg"];
            //            self.PhotoName.text = @"HomeViewLRTFront";
            //            self.Date.text = @"2013-08-22";
            //            break;
            //        case 7:
            //            self.PhotoViewer.image = [UIImage imageNamed:@"HomeViewPark.jpg 2013-07-12.jpg"];
            //            self.PhotoName.text = @"HomeViewPark";
            //            self.Date.text = @"2013-07-12";
            //            break;
            //        case 8:
            //            self.PhotoViewer.image = [UIImage imageNamed:@"TaiwanLeBl'ed'OrHoneyBeer 2013 04-21.jpg"];
            //            self.PhotoName.text = @"TaiwanLeBl'ed'OrHoneyBeer";
            //            self.Date.text = @"2013 04-21";
            //            break;
            //        case 9:
            //            self.PhotoViewer.image = [UIImage imageNamed:@"TaiwanLeBl'ed'OrSpanishRice 2013 04-21.jpg"];
            //            self.PhotoName.text = @"TaiwanLeBl'ed'OrSpanishRice";
            //            self.Date.text = @"2013 04-21";
            //            break;
            //        case 10:
            //            self.PhotoViewer.image = [UIImage imageNamed:@"TaiwanLeBl'ed'OrMixed 2013 04-21.jpg"];
            //            self.PhotoName.text = @"TaiwanLeBl'ed'OrMixed";
            //            self.Date.text = @"2013 04-21";
            //            break;
            
        default:
            NSLog(@"Unsupported Image %ld", (long)viewerChoice);
            break;
    }
    
}


//-(void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
//{
//    NSString *buttonTitle = [alertView buttonTitleAtIndex:buttonIndex];
//    //BOOL bContinue = false;
//    NSString *messageAgain = @"Leave";
//
//    UIAlertView *continueAlert = [[UIAlertView alloc] initWithTitle:@"Come On" message:@"Let's have Fun with j-PhoTo!!!" delegate:self cancelButtonTitle:messageAgain otherButtonTitles:@"SURE", nil];
//
//
//        if ( [buttonTitle isEqualToString:@"Leave"] ) {
//
//
//            [continueAlert show];
//
//
//        }
//
//}

//- (void)didReceiveMemoryWarning
//{
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//
//}

@end
