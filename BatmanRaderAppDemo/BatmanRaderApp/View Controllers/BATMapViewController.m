//
//  BATMapViewController.m
//  BatmanRaderApp
//
//  Created by Yin Xu on 7/1/15.
//  Copyright (c) 2015 YXApp. All rights reserved.
//

#import "BATMapViewController.h"

#import "BATLocationHelper.h"
#import "BATCrimesDataSource.h"

#import "BATCrimeObject.h"

#import "BATMapAnnotation.h"

@interface BATMapViewController ()

@end

@implementation BATMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(locationUpdatedNotification:) name:@"kLocationManagerLocationUpdated" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(locationDenied:) name:@"kLocationManagerLocationDenied" object:nil];
    
    [[BATLocationHelper sharedInstance] startLocationUpdates];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - CLLocation Manager Delegate

- (void)locationUpdatedNotification: (NSNotification *)notification
{
    [self zoomToUserLocation:notification.object];
}

- (void)locationDenied: (NSNotification *)notification
{
    [[BATLocationHelper sharedInstance] stopLocationUpdates];
}

#pragma mark - MKMapView Delegate
- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    [self addCrimesAnnotationToMap];

    [[BATLocationHelper sharedInstance] stopLocationUpdates];
}


- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    if ([annotation isKindOfClass:[BATMapAnnotation class]])
    {
        BATMapAnnotation *mapAnnotation = annotation;
        MKAnnotationView *annotationView = [[MKAnnotationView alloc] initWithAnnotation:annotation
                                                                        reuseIdentifier:@"CustomAnnotation"];
        annotationView.canShowCallout = NO;
        annotationView.image = mapAnnotation.crime.crimeMapPinImage;
        annotationView.layer.anchorPoint = CGPointMake(0, 1);
        annotationView.transform = CGAffineTransformMakeScale(0.4, 0.4);
        return annotationView;
    }
    
    return nil;
}

#pragma mark - Helper Methods
- (void)zoomToUserLocation:(CLLocation *)location
{
    self.mapView.showsUserLocation = YES;
    [self.mapView setRegion:MKCoordinateRegionMake(location.coordinate, MKCoordinateSpanMake(0.7, 0.7)) animated:YES];
}

- (void)addCrimesAnnotationToMap
{
    CLLocation *userLocation = [BATLocationHelper sharedInstance].currentLocation;
    
    for (BATCrimeObject *crime in [BATCrimesDataSource sharedInstance].crimesObjectArray)
    {
        BATMapAnnotation *annotation = [[BATMapAnnotation alloc] initWithLocation:[[CLLocation alloc] initWithLatitude:userLocation.coordinate.latitude + crime.mapPinLatDelta longitude:userLocation.coordinate.longitude + crime.mapPinLngDelta]];
        annotation.crime = crime;
        [self.mapView addAnnotation:annotation];
    }
}

@end
