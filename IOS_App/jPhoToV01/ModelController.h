//
//  ModelController.h
//  DrawPad
//
//  Created by Po-Ting Chiang on 2014-04-24.
//  Copyright (c) 2014 Po-Ting Chiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DataViewController;

@interface ModelController : NSObject <UIPageViewControllerDataSource>

- (DataViewController *)viewControllerAtIndex:(NSUInteger)index storyboard:(UIStoryboard *)storyboard;
- (NSUInteger)indexOfViewController:(DataViewController *)viewController;

@end
