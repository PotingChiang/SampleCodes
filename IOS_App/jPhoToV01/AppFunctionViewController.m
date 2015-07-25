//
//  AppFunctionViewController.m
//  jPhoToV01
//
//  Created by Po-Ting Chiang on 2014-03-24.
//  Copyright (c) 2014 Po-Ting Chiang. All rights reserved.
//

#import "AppFunctionViewController.h"
#import "FunctionDescriptionViewController.h"

@interface AppFunctionViewController ()
@property (weak, nonatomic) IBOutlet UITableView *functionTableView;

@end

@implementation AppFunctionViewController

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
    
    NSString *appFunctionPlist = [[NSBundle mainBundle] pathForResource:@"AppFunction" ofType:@"plist"];
    self.functionArray = [NSArray arrayWithContentsOfFile:appFunctionPlist];
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
    return [self.functionArray count];
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *functionCell = [tableView dequeueReusableCellWithIdentifier:@"FunctionCell"];
    NSInteger currentRow = indexPath.row;
    NSDictionary *functionDictionary = self.functionArray[currentRow];
    functionCell.textLabel.text = functionDictionary[@"Function"];
    
    if ([functionCell.textLabel.text isEqualToString:@"j-Photo"])
    {
        functionCell.imageView.image = [UIImage imageNamed:@"apple_s.png"];
    }
    else if ([functionCell.textLabel.text isEqualToString:@"Album Picker"])
    {
        functionCell.imageView.image = [UIImage imageNamed:@"photo.png"];
    }
    else if ([functionCell.textLabel.text isEqualToString:@"Music Picker"])
    {
        
        functionCell.imageView.image = [UIImage imageNamed:@"music_s.png"];
    }
    else if ([functionCell.textLabel.text isEqualToString:@"Bingo Game"])
    {
        
        functionCell.imageView.image = [UIImage imageNamed:@"fun_s.png"];
    }
    else if ([functionCell.textLabel.text isEqualToString:@"Social Community"])
    {
        
        functionCell.imageView.image = [UIImage imageNamed:@"CommunityIcon.png"];
    }
    else if ([functionCell.textLabel.text isEqualToString:@"Notes Pad"])
    {
        
        functionCell.imageView.image = [UIImage imageNamed:@"NotpadIconFrame.png"];
    }
    else if ([functionCell.textLabel.text isEqualToString:@"UserInfo & Settings"])
    {
        
        functionCell.imageView.image = [UIImage imageNamed:@"toolicon.png"];
    }
    else if ([functionCell.textLabel.text isEqualToString:@"App Info"])
    {
        
        functionCell.imageView.image = [UIImage imageNamed:@"InfoIcon.png"];
    }
    
    
    return functionCell;
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    FunctionDescriptionViewController *fdVC = [segue destinationViewController];
    NSIndexPath *indexPath = [self.functionTableView indexPathForSelectedRow];
    NSInteger currentRow = indexPath.row;
    NSDictionary *functionDictionary = self.functionArray[currentRow];
    fdVC.functionDescription = functionDictionary[@"Description"];
    fdVC.appFunction = functionDictionary[@"Function"];    
    
}


@end
