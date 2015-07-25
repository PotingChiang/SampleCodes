//
//  MusicIndexSearchTableViewController.h
//  jPhoToV01
//
//  Created by Po-Ting Chiang on 2014-03-28.
//  Copyright (c) 2014 Po-Ting Chiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MusicIndexSearchTableViewController : UITableViewController
<UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSArray *musicInfoArray;

@end
