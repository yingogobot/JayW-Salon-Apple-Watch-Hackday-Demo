//
//  BATCrimeDetailViewController.h
//  BatmanRaderApp
//
//  Created by Yin Xu on 7/2/15.
//  Copyright (c) 2015 YXApp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
@class BATCrimeObject;

@interface BATCrimeDetailViewController : UIViewController <MKMapViewDelegate>

@property (nonatomic, weak) IBOutlet UIImageView *villainImageView;
@property (nonatomic, weak) IBOutlet UILabel *villainNameLabel;
@property (nonatomic, weak) IBOutlet UILabel *villainDescriptionLabel;
@property (nonatomic, weak) IBOutlet UILabel *gadgetsLabel;
@property (nonatomic, weak) IBOutlet UIImageView *partnerOneImageView;
@property (nonatomic, weak) IBOutlet UIImageView *partnerTwoImageView;
@property (nonatomic, weak) IBOutlet MKMapView *mapView;


@property (nonatomic, strong) BATCrimeObject *crime;

@end
