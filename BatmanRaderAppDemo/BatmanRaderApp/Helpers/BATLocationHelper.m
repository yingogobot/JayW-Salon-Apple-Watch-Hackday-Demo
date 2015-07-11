//
//  BATLocationHelper.m
//  BatmanRaderApp
//
//  Created by Yin Xu on 7/1/15.
//  Copyright (c) 2015 YXApp. All rights reserved.
//

#import "BATLocationHelper.h"

@implementation BATLocationHelper

+ (instancetype)sharedInstance
{
    static BATLocationHelper *sharedInstance = nil;
    if (!sharedInstance)
    {
        sharedInstance = [[BATLocationHelper alloc] init];
        
    }
    return sharedInstance;
}

- (void)startLocationUpdates
{
    if (!self.locationManager) {
        self.locationManager = [[CLLocationManager alloc] init];
        self.locationManager.delegate = self;
        self.locationManager.distanceFilter = 100;
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    }
    
    [self.locationManager requestWhenInUseAuthorization];
    [self.locationManager startUpdatingLocation];
}

- (void)stopLocationUpdates
{
    [self.locationManager stopUpdatingLocation];
}

- (CLLocation *)lastSavedLocation
{
    if (![[NSUserDefaults standardUserDefaults] objectForKey:@"LocationManagerLat"])
        return nil;
        return [[CLLocation alloc] initWithLatitude:[[NSUserDefaults standardUserDefaults] doubleForKey:@"LocationManagerLat"]
                                      longitude:[[NSUserDefaults standardUserDefaults]
                                                 doubleForKey:@"LocationManagerLng"]];
}

- (void)setLastSavedLocation:(CLLocation *)location
{
    [[NSUserDefaults standardUserDefaults] setDouble:location.coordinate.latitude forKey:@"LocationManagerLat"];
    [[NSUserDefaults standardUserDefaults] setDouble:location.coordinate.longitude forKey:@"LocationManagerLng"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

#pragma mark - Location Manager Delegate
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    if(locations && locations.count > 0)
    {
        self.currentLocation = [locations objectAtIndex:locations.count - 1];
        self.lastSavedLocation = self.currentLocation;
        [[NSNotificationCenter defaultCenter] postNotificationName:@"kLocationManagerLocationUpdated" object:self.currentLocation];
    }
    else
        [[NSNotificationCenter defaultCenter] postNotificationName:@"kLocationManagerLocationFailed" object:nil];
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"kLocationManagerLocationDenied" object:nil];
}

@end
