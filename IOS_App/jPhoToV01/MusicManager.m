//
//  MusicManager.m
//  jPhoToV01
//
//  Created by Po-Ting Chiang on 2014-03-21.
//  Copyright (c) 2014 Po-Ting Chiang. All rights reserved.
//

#import "MusicManager.h"

@implementation MusicManager
{
    NSDictionary* musicDictionary;
    
}
-(NSInteger) numOfMusicWithRow:(NSInteger)row
{
    NSString* musicTypeName = [self MusicTypeName:row];
    
    return [self numOfMusic:musicTypeName];
}

-(NSInteger) numOfMusic:(NSString *)musicTypeName
{
    NSArray* musicInMusicType = [musicDictionary objectForKey:musicTypeName];
    
    return [musicInMusicType count];
    
}

-(NSArray*) musicInMusicType:(NSString *)musicTypeName
{
    NSArray *music = [musicDictionary objectForKey:musicTypeName];
    
    return music;
}

-(NSInteger) numOfMusicType
{
    
    return [self.musicArray count];
}

-(NSString*) MusicTypeName:(NSInteger)row
{
    return self.musicArray[row];
    
}

-(MusicManager*) init
{
    
    self = [super init];
    
    if (self)
    {
        NSString* musicList = [[NSBundle mainBundle] pathForResource:@ "MusicData"ofType:@"plist"];
        
        musicDictionary =[NSDictionary dictionaryWithContentsOfFile:musicList];
        
        self.musicArray = [musicDictionary allKeys];
    }
    
    return self;
    
}


@end
