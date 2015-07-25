//
//  AlbumPickerViewController.m
//  jPhoToV01
//
//  Created by Po-Ting Chiang on 2014-03-15.
//  Copyright (c) 2014 Po-Ting Chiang. All rights reserved.
//

#import "AlbumPickerViewController.h"
#import "AlbumManager.h"

@interface AlbumPickerViewController ()
@property (strong, nonatomic) AlbumManager *albumManager;
@property (strong, nonatomic) IBOutlet UILabel *realTimer;


@end

@implementation AlbumPickerViewController
{
    NSTimer *timer;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.albumManager = [[AlbumManager alloc] init];
    
    timer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(UpdateTimer) userInfo:Nil repeats:YES];
}

- (void) UpdateTimer
{
    NSDateFormatter *Formatter = [[NSDateFormatter alloc] init];
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
    NSString *albumName = [self.albumManager albumName:selectedRow];
    NSArray *photoArray = [self.albumManager photosInAlbum:albumName];
    
    self.selectedYear = albumName;
    self.selectedRowTitle = photoArray[row];
}

#pragma mark -
#pragma mark PickerDelegate Method
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSString *rowTitle = Nil;
    if (component == 0)
    {
        rowTitle = [self.albumManager albumName:row];
    }
    else if (component == 1)
    {
        NSInteger selectedRow = [pickerView selectedRowInComponent:0];
        NSString *albumName = [self.albumManager albumName:selectedRow];
        NSArray *photoArray = [self.albumManager photosInAlbum:albumName];
        rowTitle = photoArray[row];
        
    }
    
    
    return rowTitle;
}



#pragma mark PickerDataSource Method
-(NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    NSInteger rowInComponent = 0;
    if (component == 0)
    {
        rowInComponent = [self.albumManager numOfAlbums];
    }
    else if (component == 1)
    {
        NSInteger selectedRow = [pickerView selectedRowInComponent:0];
        rowInComponent = [self.albumManager numofPhotosWithRow:selectedRow];
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



@end
