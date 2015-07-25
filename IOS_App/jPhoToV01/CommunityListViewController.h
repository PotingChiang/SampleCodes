//
//  CommunityListViewController.h
//  jPhoToV01
//
//  Created by Po-Ting Chiang on 2014-04-20.
//  Copyright (c) 2014 Po-Ting Chiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommunityListViewController : UIViewController
<UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSArray *communityArray;

@end
