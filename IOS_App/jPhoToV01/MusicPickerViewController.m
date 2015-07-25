//
//  MusicPickerViewController.m
//  jPhoToV01
//
//  Created by Po-Ting Chiang on 2014-03-18.
//  Copyright (c) 2014 Po-Ting Chiang. All rights reserved.
//

#import "MusicPickerViewController.h"
#import "MusicManager.h"

@interface MusicPickerViewController ()

@property (strong, nonatomic) MusicManager* musicManager;
@property (weak, nonatomic) IBOutlet UILabel *realTimer;




@end

@implementation MusicPickerViewController
{
    NSTimer* timer;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.musicManager = [[MusicManager alloc] init];
    
    timer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(UpdateTimer) userInfo:nil repeats:YES];
}

-(void) UpdateTimer
{
    NSDateFormatter* Formatter = [[NSDateFormatter alloc] init];
    [Formatter setDateFormat:@"hh:mm:ss"];
    self.realTimer.text = [Formatter stringFromDate:[NSDate date]];
}

-(void) pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (component == 0)
    {
        [pickerView reloadComponent:1];
    }
    
    NSInteger selectedRow = [pickerView selectedRowInComponent:0];
    
    NSString* musicTypeName = [self.musicManager MusicTypeName:selectedRow];
    
    NSArray* musicArray = [self.musicManager musicInMusicType:musicTypeName];
    
    self.selectedMusicType = musicTypeName;
    
    self.selectedRowTitle = musicArray[row];
    
}

#pragma mark - 
#pragma mark PickerDelegate Method

-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSString *rowTitle = nil;
    if (component == 0) {
        rowTitle = [self.musicManager MusicTypeName:row];
    }
    
    else if (component == 1)
    {
        NSInteger selectedRow = [pickerView selectedRowInComponent:0];
        NSString* musicTypeName = [self.musicManager MusicTypeName:selectedRow];
        NSArray* musicArray = [self.musicManager musicInMusicType:musicTypeName];
        rowTitle = musicArray[row];
    }
    
    return rowTitle;
}

#pragma mark PickerDataResource Method

-(NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    NSInteger rowInComponent = 0;
    
    if (component == 0)
    {
        rowInComponent = [self.musicManager numOfMusicType];
    }
    else if (component == 1)
    {
        NSInteger selectedRow = [pickerView selectedRowInComponent:0];
        
        rowInComponent = [self.musicManager numOfMusicWithRow:selectedRow];
    }
    
    return rowInComponent;
    
}
-(NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}


//- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
//{
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    if (self) {
//        // Custom initialization
//    }
//    return self;
//}

//- (void)didReceiveMemoryWarning
//{
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
