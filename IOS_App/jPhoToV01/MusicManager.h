//
//  MusicManager.h
//  jPhoToV01
//
//  Created by Po-Ting Chiang on 2014-03-21.
//  Copyright (c) 2014 Po-Ting Chiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MusicManager : NSObject

@property (strong, nonatomic) NSArray *musicArray;

-(NSInteger) numOfMusicType;

-(NSString*) MusicTypeName: (NSInteger) row;

-(NSInteger) numOfMusic: (NSString*) musicTypeName;

-(NSArray*) musicInMusicType: (NSString*) musicTypeName;

-(NSInteger) numOfMusicWithRow: (NSInteger) row;

  
  
  
  
  
@end
