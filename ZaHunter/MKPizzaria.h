//
//  MKPizzaria.h
//  ZaHunter
//
//  Created by William Lundy on 10/14/15.
//  Copyright © 2015 mobile makers. All rights reserved.
//

#import <MapKit/MapKit.h>

@interface MKPizzaria : MKMapItem

//@property CLLocationDistance *locationDistance;

- (instancetype)initWithMKMapItem:(MKMapItem *)mapItem;

- (double)returnDistanceFromLocation:(MKMapItem *)currentLocation;

@end
