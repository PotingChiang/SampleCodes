//
//  AppSettingsViewController.m
//  jPhoToV01
//
//  Created by Po-Ting Chiang on 2014-04-20.
//  Copyright (c) 2014 Po-Ting Chiang. All rights reserved.
//

#import "AppSettingsViewController.h"

@interface AppSettingsViewController ()

@end

@implementation AppSettingsViewController

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
    
}

- (void)refreshFields
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.userNameLabel.text = [defaults objectForKey:kUsernameKey];
    self.birthdayLabel.text = [defaults objectForKey:kBirthdayKey];
    self.favoProLabel.text = [defaults objectForKey:kFavoProKey];
    self.emailLabel.text = [defaults objectForKey:kEmailKey];
    self.cellPhoneLabel.text = [defaults objectForKey:kCellPhoneKey];
    self.streetLabel.text = [defaults objectForKey:kStreetKey];
    self.cityLabel.text = [defaults objectForKey:kCityKey];
    self.countryLabel.text = [defaults objectForKey:kCountry];
    self.autoBGLabel.text = [defaults boolForKey:kAutoBackground] ? @"ON" : @"OFF";
    
    if ([self.autoBGLabel.text isEqualToString:@"ON"])
    {
        NSArray *bgImageArray =
        @[[UIImage imageNamed:@"BG01.jpg"],
          [UIImage imageNamed:@"BG02.png"],
          [UIImage imageNamed:@"BG03.png"],
//          [UIImage imageNamed:@"BG04.png"],
          [UIImage imageNamed:@"BG05.png"]
          
          ];
        
        self.bgImage.animationImages = bgImageArray;
        self.bgImage.animationDuration = 6.0;
        
        [self.bgImage startAnimating];
    }
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self refreshFields];
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
