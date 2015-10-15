//
//  MKPizzaria.m
//  ZaHunter
//
//  Created by William Lundy on 10/14/15.
//  Copyright © 2015 mobile makers. All rights reserved.
//

#import "MKPizzaria.h"
#import <CoreLocation/CoreLocation.h>

@interface MKPizzaria ()



@end

@implementation MKPizzaria

- (instancetype)initWithMKMapItem:(MKMapItem *)mapItem
{
    self = [super initWithPlacemark:mapItem.placemark];
    
    if (self)
    {
        self.name = mapItem.name;
        self.phoneNumber = mapItem.phoneNumber;
        //self.locationDistance =
    }
    
    return self;
    
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@:%@", self.name, self.phoneNumber];

}
//
//- (double)returnDistanceFromLocation:(MKMapItem *)currentLocation
//{
//    
//    return [self :currentLocation];
//    
//}

@end
