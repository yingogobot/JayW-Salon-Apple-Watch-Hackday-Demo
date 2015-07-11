//
//  BATMapAnnotation.h
//  BatmanRaderApp
//
//  Created by Yin Xu on 7/2/15.
//  Copyright (c) 2015 YXApp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@class BATCrimeObject;

@interface BATMapAnnotation : NSObject <MKAnnotation>
{
    CLLocationDegrees _latitude;
    CLLocationDegrees _longitude;
}

@property (nonatomic, strong) BATCrimeObject *crime;

- (id)initWithLocation:(CLLocation *)location;
- (id)initWithLatitude:(CLLocationDegrees)latitude
          andLongitude:(CLLocationDegrees)longitude;
- (void)setCoordinate:(CLLocationCoordinate2D)newCoordinate;

@end
