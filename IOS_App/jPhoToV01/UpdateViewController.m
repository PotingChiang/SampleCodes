//
//  UpdateViewController.m
//  jPhoToV01
//
//  Created by Po-Ting Chiang on 2014-04-25.
//  Copyright (c) 2014 Po-Ting Chiang. All rights reserved.
//

#import "UpdateViewController.h"

@interface UpdateViewController ()


@property (weak, nonatomic) IBOutlet UILabel *idLabel;
@property (weak, nonatomic) IBOutlet UITextField *NameTextField;
@property (weak, nonatomic) IBOutlet UITextField *YearTextField;
@property (weak, nonatomic) IBOutlet UITextField *MonthTextField;
@property (weak, nonatomic) IBOutlet UITextField *LocationTextField;
@property (weak, nonatomic) IBOutlet UITextField *DesTextField;

- (IBAction)NameDismissKeyboard:(UITextField *)sender;
- (IBAction)YearDismissKeyboard:(UITextField *)sender;
- (IBAction)MonthDismissKeyboard:(UITextField *)sender;
- (IBAction)LocationDismissKeyboard:(UITextField *)sender;
- (IBAction)DesDismissKeyboard:(UITextField *)sender;

- (IBAction)dismissAllFieldsKeyboard:(id)sender;


@end

@implementation UpdateViewController

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
    self.idLabel.text = [NSString stringWithFormat:@"%d", self.currentAlbum.ID];
    self.NameTextField.text = self.currentAlbum.Name;
    self.YearTextField.text = [NSString stringWithFormat:@"%d", self.currentAlbum.year];
    self.MonthTextField.text = [NSString stringWithFormat:@"%d", self.currentAlbum.month];
    self.LocationTextField.text = self.currentAlbum.location;
    self.DesTextField.text = self.currentAlbum.Des;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if (sender == self.navigationItem.leftBarButtonItem)
    {
        NSLog(@"Cancel button tapped");
    }
    else if (sender == self.navigationItem.rightBarButtonItem)
    {
        NSLog(@"Save button tapped");
        self.currentAlbum = [[albumDesNSObject alloc]init];
        self.currentAlbum.ID = [self.idLabel.text integerValue];
        self.currentAlbum.Name = self.NameTextField.text;
        self.currentAlbum.year = [self.YearTextField.text integerValue];
        self.currentAlbum.month = [self.MonthTextField.text integerValue];
        self.currentAlbum.location = self.LocationTextField.text;
        self.currentAlbum.Des = self.DesTextField.text;
    }
    
}

- (IBAction)NameDismissKeyboard:(UITextField *)sender
{
    [self resignFirstResponder];
    
}

- (IBAction)YearDismissKeyboard:(UITextField *)sender
{
    [self resignFirstResponder];
}

- (IBAction)MonthDismissKeyboard:(UITextField *)sender
{
    [self resignFirstResponder];
}

- (IBAction)LocationDismissKeyboard:(UITextField *)sender
{
    [self resignFirstResponder];
}

- (IBAction)DesDismissKeyboard:(UITextField *)sender
{
    [self resignFirstResponder];
}

- (IBAction)dismissAllFieldsKeyboard:(id)sender {
    
    [self.NameTextField resignFirstResponder];
    [self.YearTextField resignFirstResponder];
    [self.MonthTextField resignFirstResponder];
    [self.LocationTextField resignFirstResponder];
    [self.DesTextField resignFirstResponder];
    
}



@end
