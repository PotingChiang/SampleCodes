//
//  AlbumDesCell.m
//  jPhoToV01
//
//  Created by Po-Ting Chiang on 2014-04-11.
//  Copyright (c) 2014 Po-Ting Chiang. All rights reserved.
//

#import "AlbumDesCell.h"
#import "albumDesNSObject.h"

@interface AlbumDesCell()
@property (weak, nonatomic) IBOutlet UILabel *ID;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *year;
@property (weak, nonatomic) IBOutlet UILabel *month;
@property (weak, nonatomic) IBOutlet UILabel *location;
@property (weak, nonatomic) IBOutlet UILabel *Des;



@end

@implementation AlbumDesCell
-(void) configureWithAlbum:(albumDesNSObject *)album
{
    self.ID.text = [NSString stringWithFormat:@"%d", album.ID];
    self.name.text = album.Name;
    self.year.text = [NSString stringWithFormat:@"%d", album.year];
    self.month.text = [NSString stringWithFormat:@"%d", album.month];
    self.location.text = album.location;
    self.Des.text = album.Des;
}

@end
