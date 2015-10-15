//
//  MKPizzaria.h
//  ZaHunter
//
//  Created by William Lundy on 10/14/15.
//  Copyright © 2015 mobile makers. All rights reserved.
//

#import <MapKit/MapKit.h>

@interface MKPizzaria : MKMapItem

@property CLLocation *pizzariaLocation;

- (instancetype)initWithMKMapItem:(MKMapItem *)mapItem;


- (double)returnDistanceFromLocation:(CLLocation *)currentLocation;

@end
