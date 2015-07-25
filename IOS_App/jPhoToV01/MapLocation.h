//
//  MapLocation.h
//  jPhoToV01
//
//  Created by Po-Ting Chiang on 2014-04-23.
//  Copyright (c) 2014 Po-Ting Chiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MapLocation : NSObject
<MKAnnotation, NSCoding>

@property (strong, nonatomic) NSString *myStreet;
@property (strong, nonatomic) NSString *myCity;
@property (strong, nonatomic) NSString *myState;
@property (strong, nonatomic) NSString *myPostCode;
@property (nonatomic, readwrite) CLLocationCoordinate2D coordinate;

@end
