//
//  MapLocation.m
//  jPhoToV01
//
//  Created by Po-Ting Chiang on 2014-04-23.
//  Copyright (c) 2014 Po-Ting Chiang. All rights reserved.
//

#import "MapLocation.h"

@implementation MapLocation

#pragma mark - NSCoder Protocol Methods

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.myStreet forKey:@"Street"];
    [aCoder encodeObject:self.myCity forKey:@"City"];
    [aCoder encodeObject:self.myState forKey:@"State"];
    [aCoder encodeObject:self.myPostCode forKey:@"PostCode"];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        [self setMyStreet:[aDecoder decodeObjectForKey:@"Street"]];
        [self setMyCity:[aDecoder decodeObjectForKey:@"City"]];
        [self setMyState:[aDecoder decodeObjectForKey:@"State"]];
        [self setMyPostCode:[aDecoder decodeObjectForKey:@"PostCode"]];
    }
    return self;
}

#pragma mark - MKAnnotation Protocol Methods

- (NSString *)title
{
    return NSLocalizedString(@"Hi, I am Here!", @"Hi, I am Here!");
}

- (NSString *)subtitle
{
    NSMutableString *result = [NSMutableString string];
    if (self.myStreet)
        [result appendString:self.myStreet];
    if (self.myStreet && (self.myCity || self.myState || self.myPostCode))
        [result appendString:@", "];
    if (self.myCity)
        [result appendString:self.myCity];
    if (self.myCity && self.myState)
        [result appendString:@", "];
    if (self.myState)
        [result appendString:self.myState];
    if (self.myPostCode)
        [result appendFormat:@"  %@", self.myPostCode];
    
    return result;
}

@end
