//
//  AlbumManager.m
//  jPhoToV01
//
//  Created by Po-Ting Chiang on 2014-03-15.
//  Copyright (c) 2014 Po-Ting Chiang. All rights reserved.
//

#import "AlbumManager.h"

@implementation AlbumManager
{
    NSDictionary *albumDictionary;
}


//{
//    NSString *albumName = [self albumName:row];
//    NSArray *photoArray = [self photosInAlbum:albumName];
//    return photoArray[row];
//}
-(NSInteger) numofPhotosWithRow:(NSInteger)row
{
    NSString * albumName = [self albumName:row];
    return [self numOfPhotos:albumName];
}
-(NSInteger) numOfPhotos:(NSString *)albumName
{
    NSArray *photosInAlbum = [albumDictionary objectForKey:albumName];
    return [photosInAlbum count];
}
-(NSArray *) photosInAlbum:(NSString *)albumName//try use indexed number directly
{
    NSArray *photos = [albumDictionary objectForKey:albumName];
    
    return photos;
}

-(NSInteger) numOfAlbums
{
    return [self.albumArray count];
}
-(NSString *) albumName:(NSInteger)row
{
    return self.albumArray[row];
}




-(AlbumManager *) init
{
    self = [super init];
    if (self)
    {
        NSString *photoList = [[NSBundle mainBundle] pathForResource:@"PhotoPickerData" ofType:@"plist"];
        albumDictionary = [NSDictionary dictionaryWithContentsOfFile:photoList];
        
        self.albumArray = [albumDictionary allKeys];
        
    }
    
    return self;

}


@end
