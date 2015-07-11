//
//  BATCrimeCellController.m
//  BatmanRaderApp
//
//  Created by Yin Xu on 7/6/15.
//  Copyright (c) 2015 YXApp. All rights reserved.
//

#import "BATCrimeCellController.h"
#import "BATCrimeObject.h"
#import "BATVillainObject.h"

@implementation BATCrimeCellController

- (void)setupCellComponentsByCrimeData:(NSDictionary *)crimeData
{
    //Get the Crime Data, and set the value to it's associated UI element
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
    
    if ([crimeData objectForKey:@"mapPinImageName"]) {
        self.crime.crimeMapPinImage = [crimeData objectForKey:@"mapPinImageName"];
    }
    
    if ([crimeData objectForKey:@"mapPinLatDelta"]) {
        self.crime.mapPinLatDelta = [[crimeData objectForKey:@"mapPinLatDelta"] floatValue];
    }
    
    if ([crimeData objectForKey:@"mapPinLngDelta"]) {
        self.crime.mapPinLngDelta = [[crimeData objectForKey:@"mapPinLngDelta"] floatValue];
    }
    
    [self.villainImageGroup setBackgroundImage:self.crime.villain.headImage];
    [self.villainNameLabel setText:self.crime.villain.name];
    [self.crimeNameLabel setText:self.crime.title];
    [self.crimeReportTimeLabel setText:self.crime.reportTime];
}

@end
