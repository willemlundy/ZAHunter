//
//  Pizzarias.h
//  ZaHunter
//
//  Created by William Lundy on 10/14/15.
//  Copyright © 2015 mobile makers. All rights reserved.
//

#import <Foundation/Foundation.h>
// @class CoreLocation;
#import <CoreLocation/CoreLocation.h>

@interface Pizzarias : NSObject

@property NSString *pizzariaName;
@property NSString *pizzariaAddress;
@property CLLocationCoordinate2D *pizzariaCoordinate;

- (instancetype)initWithName:(NSString *)pizzariaName andWithAddress:(NSString *)pizzariaAddress pizzariaCoordinate:(CLLocationCoordinate2D *)pizzariaCoordinate;

@end
