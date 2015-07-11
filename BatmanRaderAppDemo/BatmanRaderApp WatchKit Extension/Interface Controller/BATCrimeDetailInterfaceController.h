//
//  BATCrimeDetailInterfaceController.h
//  BatmanRaderApp
//
//  Created by Yin Xu on 7/7/15.
//  Copyright (c) 2015 YXApp. All rights reserved.
//

#import <WatchKit/WatchKit.h>
#import <Foundation/Foundation.h>

@interface BATCrimeDetailInterfaceController : WKInterfaceController

@property (nonatomic, weak) IBOutlet WKInterfaceMap *mapView;
@property (nonatomic, weak) IBOutlet WKInterfaceImage *villainFullImage;
@property (nonatomic, weak) IBOutlet WKInterfaceLabel *villainNameLabel;
@property (nonatomic, weak) IBOutlet WKInterfaceLabel *crimeDescriptionLabel;

@end
