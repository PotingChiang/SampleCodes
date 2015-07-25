//
//  AppFunctionViewController.h
//  jPhoToV01
//
//  Created by Po-Ting Chiang on 2014-03-24.
//  Copyright (c) 2014 Po-Ting Chiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppFunctionViewController : UIViewController
<UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSArray *functionArray;

@end
