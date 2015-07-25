//
//  AlbumDesTableViewController.m
//  jPhoToV01
//
//  Created by Po-Ting Chiang on 2014-04-11.
//  Copyright (c) 2014 Po-Ting Chiang. All rights reserved.
//

#import "AlbumDesTableViewController.h"
#import "albumDesNSObject.h"
#import "albumDesMGR.h"
#import "AlbumDesCell.h"
#import "NewAlbumDesViewController.h"
#import "UpdateViewController.h"

@interface AlbumDesTableViewController ()

@property (strong, nonatomic) IBOutlet UITableView *albumDesTableView;

@property (strong, nonatomic) NSIndexPath * selectedIndexPath;

@end

@implementation AlbumDesTableViewController

- (IBAction) doneWithAlbumDes:(UIStoryboardSegue *) segue
{
    NewAlbumDesViewController *newAlbumDesVC = segue.sourceViewController;
    if(newAlbumDesVC.currentAlbum != nil)
    {
        albumDesMGR *albumLocalMGR = [albumDesMGR sharedInstance];
        [albumLocalMGR addAlbum:newAlbumDesVC.currentAlbum];
        [self.tableView reloadData];
        
    }
    
}

- (IBAction) doneWithUpdateAlbums:(UIStoryboardSegue *) segue
{
    UpdateViewController *updateAlbumDesVC = segue.sourceViewController;
    if (updateAlbumDesVC.currentAlbum != nil)
    {
        albumDesMGR *albumLocalMGR = [albumDesMGR sharedInstance];
        [albumLocalMGR updateAlbum:updateAlbumDesVC.currentAlbum];
        [self.tableView reloadData];
    }
    
}

-(void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    self.buttonTitle = [alertView buttonTitleAtIndex:buttonIndex];
    
    if ([self.buttonTitle isEqualToString:@"Sure"])
    {
        NSLog(@"IF");
        // Delete the row from the data source
        albumDesMGR *albumDesLocalMGR = [albumDesMGR sharedInstance];
        NSArray *albumArray = [albumDesLocalMGR albums];
        albumDesNSObject *selectedAlbum = albumArray[self.selectedIndexPath.row];
        [albumDesLocalMGR deleteAlbum:selectedAlbum];
        [self.tableView reloadData];
    }
    else
    {
        NSLog(@"ELSE");
    }
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    

}



#pragma mark - Table view data source

//can delete numbeofsection method if only one section -> it is default

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    albumDesMGR *albumDesLocalMGR = [albumDesMGR sharedInstance];
    NSArray *albumArray = [albumDesLocalMGR albums];
    
    return [albumArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"AlbumDesCell";
    AlbumDesCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    albumDesMGR *albumDesLocalMGR = [albumDesMGR sharedInstance];
    NSArray *albumArray = [albumDesLocalMGR albums];
    albumDesNSObject *album = albumArray[indexPath.row];
    
    [cell configureWithAlbum:album];
    
    return cell;
}


// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        NSString *title = @"Are You Sure to Delete the Item ?";
        UIAlertView *deleteAlert  = [[UIAlertView alloc] initWithTitle:title message:nil delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Sure", nil];
        
        self.selectedIndexPath = indexPath;

        
        [deleteAlert show];
        
        

        
        
        
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
    
    
}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    UpdateViewController *updateVC = [segue destinationViewController];
    NSIndexPath *indexPath = [self.albumDesTableView indexPathForSelectedRow];
    NSInteger currentRow = indexPath.row;
    albumDesMGR *albumDesArray = [[albumDesMGR alloc]init];
    albumDesNSObject *desObject = albumDesArray.albums[currentRow];
    updateVC.currentAlbum = desObject;
    
//    NSIndexPath *indexPath = [self.functionTableView indexPathForSelectedRow];
//    NSInteger currentRow = indexPath.row;
//    NSDictionary *functionDictionary = self.functionArray[currentRow];
//    fdVC.functionDescription = functionDictionary[@"Description"];
//    fdVC.appFunction = functionDictionary[@"Function"];
}


@end
