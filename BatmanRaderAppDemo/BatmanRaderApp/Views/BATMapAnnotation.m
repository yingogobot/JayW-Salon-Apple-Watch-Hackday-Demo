//
//  BATMapAnnotation.m
//  BatmanRaderApp
//
//  Created by Yin Xu on 7/2/15.
//  Copyright (c) 2015 YXApp. All rights reserved.
//

#import "BATMapAnnotation.h"
@interface BATMapAnnotation()

@property (nonatomic) CLLocationDegrees latitude;
@property (nonatomic) CLLocationDegrees longitude;

@end

@implementation BATMapAnnotation

@synthesize latitude = _latitude;
@synthesize longitude = _longitude;

- (id)initWithLocation:(CLLocation *)location
{
    if (self = [super init]) {
        self.latitude = location.coordinate.latitude;
        self.longitude = location.coordinate.longitude;
    }
    return self;
}

- (id)initWithLatitude:(CLLocationDegrees)latitude
          andLongitude:(CLLocationDegrees)longitude {
    if (self = [super init]) {
        self.latitude = latitude;
        self.longitude = longitude;
    }
    return self;
}

- (CLLocationCoordinate2D)coordinate {
    CLLocationCoordinate2D coordinate;
    coordinate.latitude = self.latitude;
    coordinate.longitude = self.longitude;
    return coordinate;
}

- (void)setCoordinate:(CLLocationCoordinate2D)newCoordinate {
    self.latitude = newCoordinate.latitude;
    self.longitude = newCoordinate.longitude;
}

@end
