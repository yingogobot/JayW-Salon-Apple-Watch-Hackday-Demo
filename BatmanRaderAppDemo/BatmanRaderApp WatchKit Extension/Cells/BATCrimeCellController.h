//
//  BATCrimeCellController.h
//  BatmanRaderApp
//
//  Created by Yin Xu on 7/6/15.
//  Copyright (c) 2015 YXApp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WatchKit/WatchKit.h>

@class BATCrimeObject;

@interface BATCrimeCellController : NSObject

@property (nonatomic, weak) IBOutlet WKInterfaceGroup *villainImageGroup;
@property (nonatomic, weak) IBOutlet WKInterfaceLabel *villainNameLabel;
@property (nonatomic, weak) IBOutlet WKInterfaceLabel *crimeNameLabel;
@property (nonatomic, weak) IBOutlet WKInterfaceLabel *crimeReportTimeLabel;

@property (nonatomic, strong) BATCrimeObject *crime;
- (void)setupCellComponentsByCrimeData:(NSDictionary *)crimeData;

@end
