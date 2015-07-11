//
//  BATCrimeDetailViewController.m
//  BatmanRaderApp
//
//  Created by Yin Xu on 7/2/15.
//  Copyright (c) 2015 YXApp. All rights reserved.
//

#import "BATCrimeDetailViewController.h"
#import "BATLocationHelper.h"

#import "BATMapAnnotation.h"
#import "BATCrimeObject.h"
#import "BATVillainObject.h"

@interface BATCrimeDetailViewController ()

@end

@implementation BATCrimeDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupMapViewLocation];
    [self setupViews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupViews
{
    self.title = self.crime.title;

    self.villainImageView.image = self.crime.villain.fullImage;
    self.villainNameLabel.text = self.crime.villain.name;
    self.villainDescriptionLabel.text = self.crime.crimeDescription;
    self.gadgetsLabel.text = self.crime.neededGadgets;
}

- (void)setupMapViewLocation
{
    if (![BATLocationHelper sharedInstance].currentLocation) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(locationUpdatedNotification:) name:@"kLocationManagerLocationUpdated" object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(locationDenied:) name:@"kLocationManagerLocationDenied" object:nil];
        
        [[BATLocationHelper sharedInstance] startLocationUpdates];
    }
    else
    {
        [self zoomToUserLocation:[BATLocationHelper sharedInstance].currentLocation];
    }
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
    BATMapAnnotation *annotation = [[BATMapAnnotation alloc] initWithLocation:[[CLLocation alloc] initWithLatitude:userLocation.coordinate.latitude + self.crime.mapPinLatDelta longitude:userLocation.coordinate.longitude + self.crime.mapPinLngDelta]];
    annotation.crime = self.crime;
    [self.mapView addAnnotation:annotation];
}


@end
