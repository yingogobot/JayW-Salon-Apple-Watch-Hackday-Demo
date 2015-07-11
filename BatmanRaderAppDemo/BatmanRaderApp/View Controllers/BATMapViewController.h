//
//  BATMapViewController.h
//  BatmanRaderApp
//
//  Created by Yin Xu on 7/1/15.
//  Copyright (c) 2015 YXApp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface BATMapViewController : UIViewController <MKMapViewDelegate>

@property (nonatomic, weak) IBOutlet MKMapView *mapView;

@end
