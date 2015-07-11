//
//  BATCrimeDetailInterfaceController.m
//  BatmanRaderApp
//
//  Created by Yin Xu on 7/7/15.
//  Copyright (c) 2015 YXApp. All rights reserved.
//

#import "BATCrimeDetailInterfaceController.h"
#import "BATCrimeObject.h"
#import "BATVillainObject.h"

@interface BATCrimeDetailInterfaceController ()

@property (nonatomic, strong) BATCrimeObject *crime;
@property (nonatomic, strong) BATVillainObject *villain;

@end

@implementation BATCrimeDetailInterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    NSDictionary *crimeData = context;
    [self processData:crimeData];
    [self setupMapView];
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

- (void)processData:(NSDictionary *)crimeData
{
    self.crime = [[BATCrimeObject alloc] init];
    self.crime.villain = [[BATVillainObject alloc] init];
    
    if ([crimeData objectForKey:@"villainName"]) {
        self.crime.villain.name = [crimeData objectForKey:@"villainName"];
    }
    
    if ([crimeData objectForKey:@"villainFullImageName"]) {
        self.crime.villain.fullImage = [UIImage imageNamed:[crimeData objectForKey:@"villainFullImageName"]];
    }
    
    if ([crimeData objectForKey:@"villainHeadImageName"]) {
        self.crime.villain.headImage = [UIImage imageNamed:[crimeData objectForKey:@"villainHeadImageName"]];
    }
    
    if ([crimeData objectForKey:@"crimeTitle"]) {
        self.crime.title = [crimeData objectForKey:@"crimeTitle"];
    }
    
    if ([crimeData objectForKey:@"crimeReportTime"]) {
        self.crime.reportTime = [crimeData objectForKey:@"crimeReportTime"];
    }
    
    if ([crimeData objectForKey:@"crimeDescription"]) {
        self.crime.crimeDescription = [crimeData objectForKey:@"crimeDescription"];
    }
    
    if ([crimeData objectForKey:@"neededGadgets"]) {
        self.crime.neededGadgets = [crimeData objectForKey:@"neededGadgets"];
    }
    
    if ([crimeData objectForKey:@"mapPinImageName"]) {
        self.crime.crimeMapPinImage = [crimeData objectForKey:@"mapPinImageName"];
    }
    
    if ([crimeData objectForKey:@"mapPinLatDelta"]) {
        self.crime.mapPinLatDelta = [[crimeData objectForKey:@"mapPinLatDelta"] floatValue];
    }
    
    if ([crimeData objectForKey:@"mapPinLngDelta"]) {
        self.crime.mapPinLngDelta = [[crimeData objectForKey:@"mapPinLngDelta"] floatValue];
    }
    
    [self setTitle:self.crime.title];
    [self.villainFullImage setImage:self.crime.villain.fullImage];
    [self.villainNameLabel setText:self.crime.villain.name];
    [self.crimeDescriptionLabel setText:self.crime.crimeDescription];
}

- (void)setupMapView
{
    [WKInterfaceController openParentApplication:@{@"BATWatchAppRequestType": @"GetCurrentLocation"}
                                           reply:^(NSDictionary *replyInfo, NSError *error)
     {
         if (error) {
             return ;
         }
         
         if (replyInfo && [replyInfo objectForKey:@"currentLocationLat"] &&
             [replyInfo objectForKey:@"currentLocationLng"])
         {
             CLLocation *currentLocation = [[CLLocation alloc] initWithLatitude:[[replyInfo objectForKey:@"currentLocationLat"] floatValue] longitude:[[replyInfo objectForKey:@"currentLocationLng"] floatValue]];
             CLLocation *villianLocation = [[CLLocation alloc] initWithLatitude:(currentLocation.coordinate.latitude + self.crime.mapPinLatDelta) longitude:(currentLocation.coordinate.longitude + self.crime.mapPinLngDelta)];
             [self.mapView setRegion:MKCoordinateRegionMake(currentLocation.coordinate, MKCoordinateSpanMake(0.8, 0.8))];
             [self.mapView addAnnotation:currentLocation.coordinate withImageNamed:@"bat_pin" centerOffset:CGPointZero];
             [self.mapView addAnnotation:villianLocation.coordinate withPinColor:WKInterfaceMapPinColorRed];
         };
     }];
}

@end



