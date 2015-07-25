//
//  CommunityListViewController.m
//  jPhoToV01
//
//  Created by Po-Ting Chiang on 2014-04-20.
//  Copyright (c) 2014 Po-Ting Chiang. All rights reserved.
//

#import "CommunityListViewController.h"
#import "CommunityWebViewController.h"

@interface CommunityListViewController ()
@property (weak, nonatomic) IBOutlet UITableView *communityTableView;

@end

@implementation CommunityListViewController

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
    
    NSString *communityPlist = [[NSBundle mainBundle] pathForResource:@"SocialCommunity" ofType:@"plist"];
    
    self.communityArray = [NSArray arrayWithContentsOfFile:communityPlist];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark TableViewDataSource Methods
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
    
}
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.communityArray count];
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *communityCell = [tableView dequeueReusableCellWithIdentifier:@"CommunityCell"];
    NSInteger currentRow = indexPath.row;
    NSDictionary *community = self.communityArray[currentRow];
    communityCell.textLabel.text = community[@"Community"];
    
    if ([communityCell.textLabel.text isEqualToString:@"Facebook"])
    {
        communityCell.imageView.image = [UIImage imageNamed:@"Facebook.png"];
    }
    else if ([communityCell.textLabel.text isEqualToString:@"Twitter"])
    {
        communityCell.imageView.image = [UIImage imageNamed:@"Twitter.png"];
    }
    else if ([communityCell.textLabel.text isEqualToString:@"Youtube"])
    {
        communityCell.imageView.image = [UIImage imageNamed:@"Youtube.png"];
    }
    else if ([communityCell.textLabel.text isEqualToString:@"Instagram"])
    {
        communityCell.imageView.image = [UIImage imageNamed:@"Instagram.png"];
    }
    else if ([communityCell.textLabel.text isEqualToString:@"LinkedIn"])
    {
        communityCell.imageView.image = [UIImage imageNamed:@"LinkedIn.png"];
    }
    else if ([communityCell.textLabel.text isEqualToString:@"flickr"])
    {
        communityCell.imageView.image = [UIImage imageNamed:@"flickr.png"];
    }
    else if ([communityCell.textLabel.text isEqualToString:@"Pinterest"])
    {
        communityCell.imageView.image = [UIImage imageNamed:@"Pinterest.png"];
    }
    else if ([communityCell.textLabel.text isEqualToString:@"Google+"])
    {
        communityCell.imageView.image = [UIImage imageNamed:@"google.png"];
    }
    else if ([communityCell.textLabel.text isEqualToString:@"GITHub"])
    {
        communityCell.imageView.image = [UIImage imageNamed:@"GITHub.png"];
    }
    
    
    return communityCell;
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    CommunityWebViewController *cWebVC = [segue destinationViewController];
    NSIndexPath *indexPath = [self.communityTableView indexPathForSelectedRow];
    NSInteger currentRow = indexPath.row;
    NSDictionary *communityDictionary = self.communityArray[currentRow];
    cWebVC.communityTitle = communityDictionary[@"Community"];
    cWebVC.linkURL = communityDictionary[@"Link"];
    
}


@end
