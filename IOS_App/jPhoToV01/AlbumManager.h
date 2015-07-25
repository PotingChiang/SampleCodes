//
//  AlbumManager.h
//  jPhoToV01
//
//  Created by Po-Ting Chiang on 2014-03-15.
//  Copyright (c) 2014 Po-Ting Chiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AlbumManager : NSObject

@property (strong, nonatomic) NSArray *albumArray;

-(NSInteger) numOfAlbums;

-(NSString *) albumName:(NSInteger) row;

-(NSInteger) numOfPhotos:(NSString *) albumName;

-(NSArray *) photosInAlbum:(NSString *) albumName;

-(NSInteger) numofPhotosWithRow:(NSInteger) row;

//-(NSString *) photosInAlbumWithRow:(NSInteger) row;


@end
