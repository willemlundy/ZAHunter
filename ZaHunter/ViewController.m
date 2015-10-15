//
//  ViewController.m
//  ZaHunter
//
//  Created by Matt Burrill on 10/14/15.
//  Copyright © 2015 mobile makers. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "MKPizzaria.h"

@interface ViewController () <CLLocationManagerDelegate, UITableViewDataSource, UITableViewDelegate>

@property (nonatomic) CLLocationManager *locationManager;

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.pizzariaArray = [NSMutableArray new];
    
    self.locationManager = [CLLocationManager new];
    
    [self.locationManager requestWhenInUseAuthorization];
    
    self.locationManager.delegate = self;
    
    [self.locationManager startUpdatingLocation];

}

- (void)findZa:(CLLocation *)location
{
    
    NSLog(@"findZa called with location: %@", location);
    
    // Create the search request
    MKLocalSearchRequest *request = [MKLocalSearchRequest new];
    request.naturalLanguageQuery = @"Pizza";
    request.region = MKCoordinateRegionMake(location.coordinate, MKCoordinateSpanMake(1, 1));
    
    // Create the Search with the request
    MKLocalSearch *search = [[MKLocalSearch alloc] initWithRequest:request];
    [search startWithCompletionHandler:^(MKLocalSearchResponse * _Nullable response, NSError * _Nullable error) {
        NSArray *mapItems = response.mapItems;
        for (MKMapItem *item in mapItems)
        {
            // Create a pizzaria object for each map item
            MKPizzaria *pizzeria = [[MKPizzaria alloc] initWithMKMapItem:item];
            
            NSLog(@"Created MKPizzria :%@", pizzeria);
            
            // Add it to the pizzariaArray
            [self.pizzariaArray addObject:pizzeria];
            
            
            dispatch_async(dispatch_get_main_queue(), ^{
    
                [self.mapView reloadInputViews];
                [self.tableView reloadData];
                
            });
            
            
        }

        
        
        //MKMapItem *mapItem = mapItems.firstObject;
        NSLog(@"The Pizza Array looks like: %@", self.pizzariaArray);
    }];
    
    
}

#pragma mark - CLLocationManagerDelegate methods

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    CLLocation *location = [locations firstObject];
    if (location.verticalAccuracy < 1000 && location.horizontalAccuracy < 1000) {
        [self findZa:location];
        [self.locationManager stopUpdatingLocation];
    }
    
}


#pragma mark - UITableViewDelegate mehods
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PizzaCell"];
    
    MKPizzaria *cellPizzaria = self.pizzariaArray[indexPath.row];
    
    cell.textLabel.text = cellPizzaria.name;
    //cell.detailTextLabel.text = [NSString stringWithFormat:@"%g", [cellPizzaria returnDistanceFromLocation:[MKMapItem mapItemForCurrentLocation]]];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"Count is:%lu", (unsigned long)self.pizzariaArray.count);
    return self.pizzariaArray.count;
}

@end
