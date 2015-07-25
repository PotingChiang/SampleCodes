//
//  MusicIndexSearchTableViewController.m
//  jPhoToV01
//
//  Created by Po-Ting Chiang on 2014-03-28.
//  Copyright (c) 2014 Po-Ting Chiang. All rights reserved.
//

#import "MusicIndexSearchTableViewController.h"
#import "LyricsInfoViewController.h"


@interface MusicIndexSearchTableViewController ()
@property (weak, nonatomic) IBOutlet UITableView *musicList;

@end

@implementation MusicIndexSearchTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *musicLyricsInfoPlist = [[NSBundle mainBundle] pathForResource:@"MusicLyric" ofType:@"plist"];
    self.musicInfoArray = [NSArray arrayWithContentsOfFile:musicLyricsInfoPlist];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [self.musicInfoArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MusicLyricsInfo"];
    NSInteger currentRow = indexPath.row;
    NSDictionary *musicDictionary = self.musicInfoArray[currentRow];
    cell.textLabel.text = musicDictionary[@"MusicName"];
    
    return cell;
}



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    LyricsInfoViewController *infoVC = [segue destinationViewController];
    NSIndexPath *indexPath = [self.musicList indexPathForSelectedRow];
    NSInteger currentRow = indexPath.row;
    NSDictionary *musicDictionary = self.musicInfoArray[currentRow];
    infoVC.musicName = musicDictionary[@"MusicName"];
    infoVC.infoContent = musicDictionary[@"Detail"];
}


@end
