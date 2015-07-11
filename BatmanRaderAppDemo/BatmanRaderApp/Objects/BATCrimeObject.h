//
//  BATCrimeObject.h
//  BatmanRaderApp
//
//  Created by Yin Xu on 7/1/15.
//  Copyright (c) 2015 YXApp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <UIKit/UIKit.h>

@class BATVillainObject;
@interface BATCrimeObject : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *reportTime;
@property (nonatomic, strong) NSString *crimeDescription;
@property (nonatomic, strong) NSString *neededGadgets;
@property (nonatomic, strong) BATVillainObject *villain;
@property (nonatomic, assign) BOOL isDanger;
@property (nonatomic, strong) UIImage *crimeMapPinImage;
@property (nonatomic, assign) float mapPinLatDelta;
@property (nonatomic, assign) float mapPinLngDelta;

@end
