//
//  Pizzarias.m
//  ZaHunter
//
//  Created by William Lundy on 10/14/15.
//  Copyright © 2015 mobile makers. All rights reserved.
//

#import "Pizzarias.h"
#import <CoreLocation/CoreLocation.h>

@implementation Pizzarias

- (instancetype)initWithName:(NSString *)pizzariaName andWithAddress:(NSString *)pizzariaAddress pizzariaCoordinate:(CLLocationCoordinate2D *)pizzariaCoordinate
{
    self = [super init];
    
    if (self)
    {
        self.pizzariaName = pizzariaName;
        self.pizzariaAddress = pizzariaAddress;
        self.pizzariaCoordinate = pizzariaCoordinate;
        
    }
    
    return self;
    
}

- (NSString *)description
{
    
    return [NSString stringWithFormat:@"%@:%@:%@", self.pizzariaName, self.pizzariaAddress, self.pizzariaCoordinate];
    
}
@end
