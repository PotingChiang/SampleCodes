//
//  FunctionDescriptionViewController.m
//  jPhoToV01
//
//  Created by Po-Ting Chiang on 2014-03-24.
//  Copyright (c) 2014 Po-Ting Chiang. All rights reserved.
//

#import "FunctionDescriptionViewController.h"

@interface FunctionDescriptionViewController ()
@property (weak, nonatomic) IBOutlet UITextView *functionDescriptionTextView;
@property (strong, nonatomic) IBOutlet UINavigationItem *informationTitle;


@end

@implementation FunctionDescriptionViewController

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

    self.functionDescriptionTextView.text = self.functionDescription;
    self.informationTitle.title = self.appFunction;
    
    if ([self.informationTitle.title isEqualToString:@"j-Photo"])
    {
        self.FuncIcon.image = [UIImage imageNamed:@"apple_s.png"];
    }
    else if ([self.informationTitle.title isEqualToString:@"Album Picker"])
    {
        self.FuncIcon.image = [UIImage imageNamed:@"photo.png"];
    }
    else if ([self.informationTitle.title isEqualToString:@"Music Picker"])
    {
        
        self.FuncIcon.image = [UIImage imageNamed:@"music_s.png"];
    }
    else if ([self.informationTitle.title isEqualToString:@"Bingo Game"])
    {
        
        self.FuncIcon.image = [UIImage imageNamed:@"fun_s.png"];
    }
    else if ([self.informationTitle.title isEqualToString:@"Social Community"])
    {
        
        self.FuncIcon.image = [UIImage imageNamed:@"CommunityIcon.png"];
    }
    else if ([self.informationTitle.title isEqualToString:@"Notes Pad"])
    {
        
        self.FuncIcon.image = [UIImage imageNamed:@"NotpadIconAll.png"];
    }
    else if ([self.informationTitle.title isEqualToString:@"UserInfo & Settings"])
    {
        
        self.FuncIcon.image = [UIImage imageNamed:@"toolicon.png"];
    }
    else if ([self.informationTitle.title isEqualToString:@"App Info"])
    {
        
        self.FuncIcon.image = [UIImage imageNamed:@"InfoIcon.png"];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

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
