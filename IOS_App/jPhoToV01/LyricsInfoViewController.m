//
//  LyricsInfoViewController.m
//  jPhoToV01
//
//  Created by Po-Ting Chiang on 2014-03-29.
//  Copyright (c) 2014 Po-Ting Chiang. All rights reserved.
//

#import "LyricsInfoViewController.h"

@interface LyricsInfoViewController ()
@property (strong, nonatomic) IBOutlet UINavigationItem *infoTitle;
@property (weak, nonatomic) IBOutlet UITextView *LyricsInfoTextView;


@end

@implementation LyricsInfoViewController

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
    
    self.infoTitle.title = self.musicName;
    self.LyricsInfoTextView.text = self.infoContent;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
