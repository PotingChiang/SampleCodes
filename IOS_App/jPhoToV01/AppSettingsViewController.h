//
//  AppSettingsViewController.h
//  jPhoToV01
//
//  Created by Po-Ting Chiang on 2014-04-20.
//  Copyright (c) 2014 Po-Ting Chiang. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kUsernameKey @"username"
#define kBirthdayKey @"birthday"
#define kFavoProKey  @"favoPro"
#define kEmailKey    @"email"
#define kCellPhoneKey @"cellphone"
#define kStreetKey @"street"
#define kCityKey @"city"
#define kCountry @"country"
#define kAutoBackground @"autoBG"

@interface AppSettingsViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *birthdayLabel;
@property (weak, nonatomic) IBOutlet UILabel *favoProLabel;
@property (weak, nonatomic) IBOutlet UILabel *emailLabel;
@property (weak, nonatomic) IBOutlet UILabel *cellPhoneLabel;
@property (weak, nonatomic) IBOutlet UILabel *streetLabel;
@property (weak, nonatomic) IBOutlet UILabel *cityLabel;
@property (weak, nonatomic) IBOutlet UILabel *countryLabel;
@property (weak, nonatomic) IBOutlet UILabel *autoBGLabel;

@property (weak, nonatomic) IBOutlet UIImageView *bgImage;

- (void)refreshFields;

@end
