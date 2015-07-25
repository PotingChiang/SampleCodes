//
//  FunctionDescriptionViewController.h
//  jPhoToV01
//
//  Created by Po-Ting Chiang on 2014-03-24.
//  Copyright (c) 2014 Po-Ting Chiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FunctionDescriptionViewController : UIViewController

@property (strong, nonatomic) NSString *functionDescription;
@property (strong, nonatomic) NSString *appFunction;
@property (weak, nonatomic) IBOutlet UIImageView *FuncIcon;

@end
