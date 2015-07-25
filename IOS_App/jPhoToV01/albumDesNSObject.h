//
//  albumDesNSObject.h
//  jPhoToV01
//
//  Created by Po-Ting Chiang on 2014-04-11.
//  Copyright (c) 2014 Po-Ting Chiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface albumDesNSObject : NSObject
@property(nonatomic, assign) NSInteger ID;
@property(nonatomic,copy) NSString *Name;
@property(nonatomic, assign) NSInteger year;
@property(nonatomic, assign) NSInteger month;
@property(nonatomic, copy) NSString *location;
//@property(nonatomic, copy) NSString *modifiedDate;
@property(nonatomic, copy) NSString *Des;


@end
