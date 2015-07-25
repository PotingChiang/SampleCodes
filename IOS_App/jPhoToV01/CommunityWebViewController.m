//
//  CommunityWebViewController.m
//  jPhoToV01
//
//  Created by Po-Ting Chiang on 2014-04-20.
//  Copyright (c) 2014 Po-Ting Chiang. All rights reserved.
//

#import "CommunityWebViewController.h"

@interface CommunityWebViewController ()
@property (weak, nonatomic) IBOutlet UINavigationItem *communityNaviTitle;
@property (weak, nonatomic) IBOutlet UIWebView *linkWebView;

@end

@implementation CommunityWebViewController

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
    
    self.communityNaviTitle.title = self.communityTitle;
    NSURL *communityURL = [NSURL URLWithString:self.linkURL];
    NSURLRequest *communityURLRequest = [NSURLRequest requestWithURL:communityURL];
    [self.linkWebView loadRequest:communityURLRequest];
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
