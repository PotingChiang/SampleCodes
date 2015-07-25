//
//  AlbumDesCell.h
//  jPhoToV01
//
//  Created by Po-Ting Chiang on 2014-04-11.
//  Copyright (c) 2014 Po-Ting Chiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "albumDesNSObject.h"

@interface AlbumDesCell : UITableViewCell

-(void) configureWithAlbum:(albumDesNSObject *) album;

@end
