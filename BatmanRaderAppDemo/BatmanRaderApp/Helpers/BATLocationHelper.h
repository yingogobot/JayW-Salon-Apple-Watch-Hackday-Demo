//
//  BATLocationHelper.h
//  BatmanRaderApp
//
//  Created by Yin Xu on 7/1/15.
//  Copyright (c) 2015 YXApp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface BATLocationHelper : NSObject <CLLocationManagerDelegate>

@property (nonatomic, strong) CLLocationManager *locationManager;
@property (nonatomic, strong) CLLocation *currentLocation;
@property (nonatomic, strong) CLLocation *lastSavedLocation;

+ (instancetype)sharedInstance;
- (void)startLocationUpdates;
- (void)stopLocationUpdates;

@end
