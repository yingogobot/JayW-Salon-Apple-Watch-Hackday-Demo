//
//  BATCrimesDataSource.m
//  BatmanRaderApp
//
//  Created by Yin Xu on 7/1/15.
//  Copyright (c) 2015 YXApp. All rights reserved.
//

#import "BATCrimesDataSource.h"
#import "BATCrimeObject.h"
#import "BATVillainObject.h"

@implementation BATCrimesDataSource

+ (instancetype)sharedInstance
{
    static BATCrimesDataSource *sharedInstance = nil;
    if (!sharedInstance)
    {
        sharedInstance = [[BATCrimesDataSource alloc] init];
        [sharedInstance initCrimesArray];
    }
    return sharedInstance;
}

- (void)initCrimesArray
{
    self.crimesObjectArray = [NSMutableArray new];
    self.crimesRawData = [NSMutableArray new];

    [self generateCrimeForvillainName:@"The Joker" villainFullImageName:@"joker" villainHeadImageName:@"joker_small" crimeTitle:@"Bank Robbery" reportTime:@"30 minutes ago" crimeDescription:@"Extremely Dangerous, with 12 hostages, and 25 armed mobs." neededGadgets:@"Bat Mobile. Sticky bomb gun. Bat hook lanucher." mapPinImageName:@"joker_pin"];
    [self generateCrimeForvillainName:@"Bane" villainFullImageName:@"bane" villainHeadImageName:@"bane_small" crimeTitle:@"Trading Center Robbery" reportTime:@"1 hour ago" crimeDescription:@"Extremely Dangerous, with 12 hostages, and 25 armed mobs." neededGadgets:@"Bat Pod. Sticky bomb gun. Medium Layer Gear."mapPinImageName:@"bane_pin"];
    [self generateCrimeForvillainName:@"Poison Ivy" villainFullImageName:@"ivy" villainHeadImageName:@"ivy_small" crimeTitle:@"Plants Attack" reportTime:@"15 minutes ago" crimeDescription:@"Poisoned Plants everywhere and do not touch any suspicous thing." neededGadgets:@"Bat Mobile. Anit-Virus Blood Serum. "mapPinImageName:@"ivy_pin"];
    [self generateCrimeForvillainName:@"Mr.Freeze" villainFullImageName:@"mr-freeze" villainHeadImageName:@"mr-freeze_small" crimeTitle:@"Diamonds Store Robbery" reportTime:@"8 minutes ago" crimeDescription:@"Ice Cold Crazy Villain, with 8 hostages, and fast freezing gun." neededGadgets:@"Bat Mobile. Grea Heating System."mapPinImageName:@"freeze_pin"];
    [self generateCrimeForvillainName:@"Penguin" villainFullImageName:@"penguin" villainHeadImageName:@"penguin_small" crimeTitle:@"Kidnapping" reportTime:@"39 minutes ago" crimeDescription:@"Extremely Dangerous, with 25 armed mercenaries." neededGadgets:@"Bat Mobile. Sticky bomb gun. Medium Layer Gear. Bat hook lanucher"mapPinImageName:@"penguin_pin"];
    [self generateCrimeForvillainName:@"Ras al Gul" villainFullImageName:@"ras-al-gul" villainHeadImageName:@"ras-al-gul_small" crimeTitle:@"Mercenary Riot" reportTime:@"1.5 hours ago" crimeDescription:@"Extremely Dangerous, with 17 ninjas." neededGadgets:@"Bat Mobile. Retinal Projection System."mapPinImageName:@"rasalgul_pin"];
    [self generateCrimeForvillainName:@"Riddler" villainFullImageName:@"riddler" villainHeadImageName:@"riddler_small" crimeTitle:@"Store Robbery" reportTime:@"4 hours ago" crimeDescription:@"Extremely Dangerous, with 12 hostages, and 25 armed mobs." neededGadgets:@"Bat Mobile. Sticky bomb gun. Bat hook lanucher"mapPinImageName:@"riddler_pin"];
}

- (void)generateCrimeForvillainName:(NSString *)villainName villainFullImageName:(NSString *)villainFullImageName villainHeadImageName:(NSString *)villainHeadImageName crimeTitle:(NSString *)title reportTime:(NSString *)reportTime crimeDescription:(NSString *)description neededGadgets:(NSString *)gadgets mapPinImageName:(NSString *)mapPinImageName
{
    BATVillainObject *villain = [[BATVillainObject alloc] init];
    villain.name = villainName;
    villain.fullImage = [UIImage imageNamed:villainFullImageName];
    villain.headImage = [UIImage imageNamed:villainHeadImageName];

    BATCrimeObject *cirme = [[BATCrimeObject alloc] init];
    cirme.title = title;
    cirme.reportTime = reportTime;
    cirme.villain = villain;
    cirme.crimeMapPinImage = [UIImage imageNamed:mapPinImageName];
    cirme.crimeDescription = description;
    cirme.neededGadgets = gadgets;

    float randomLatitudeDelta = arc4random()%10 + 1;
    int randomLatitudeFactor = arc4random()%2;
    
    switch (randomLatitudeFactor) {
        case 0:
            randomLatitudeDelta = randomLatitudeDelta * -1;
            break;
            
        default:
            break;
    }
    
    float randomLongitudeDelta = arc4random()%10 + 1;
    int randomLongitudeFactor = arc4random()%2;
    
    switch (randomLongitudeFactor) {
        case 0:
            randomLongitudeDelta = randomLongitudeDelta * -1;
            break;
            
        default:
            break;
    }
    
    cirme.mapPinLatDelta = randomLatitudeDelta/40;
    cirme.mapPinLngDelta = randomLongitudeDelta/40;

    [self.crimesObjectArray addObject:cirme];
    
    NSDictionary *rawData = @{@"villainName": villainName,
                              @"villainFullImageName" : villainFullImageName,
                              @"villainHeadImageName" : villainHeadImageName,
                              @"crimeTitle" : title,
                              @"crimeReportTime" : reportTime,
                              @"crimeDescription" : description,
                              @"neededGadgets" :  gadgets,
                              @"mapPinImageName" : mapPinImageName,
                              @"mapPinLatDelta" : @(cirme.mapPinLatDelta),
                              @"mapPinLngDelta" : @(cirme.mapPinLngDelta)};
    [self.crimesRawData addObject:rawData];
}

@end
