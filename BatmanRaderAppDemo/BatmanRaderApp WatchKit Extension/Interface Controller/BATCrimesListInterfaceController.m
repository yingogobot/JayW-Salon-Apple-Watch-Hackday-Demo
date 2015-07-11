//
//  BATCrimesListInterfaceController.m
//  BatmanRaderApp
//
//  Created by Yin Xu on 7/5/15.
//  Copyright (c) 2015 YXApp. All rights reserved.
//

#import "BATCrimesListInterfaceController.h"
#import "BATCrimeCellController.h"
#import "BATCrimeObject.h"
#import "BATVillainObject.h"

@interface BATCrimesListInterfaceController ()

@property (nonatomic, strong) NSMutableArray *dataSource;

@end

@implementation BATCrimesListInterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    
    [WKInterfaceController openParentApplication:@{@"BATWatchAppRequestType": @"CrimesData"}
                                           reply:^(NSDictionary *replyInfo, NSError *error)
     {
         //Receive Data From Parent App and use it to setup the table view and cell
         if (error) {
             return ;
         }
         
         if (replyInfo && [replyInfo objectForKey:@"data"] &&
             [[replyInfo objectForKey:@"data"] isKindOfClass:[NSArray class]])
         {
             self.dataSource = [[replyInfo objectForKey:@"data"] mutableCopy];
             
             //Setup the number of Cells should be displayed, based on the count of the Data Source
             [self.tableView setNumberOfRows:[self.dataSource count] withRowType:@"BATCrimeCellController"];
             
             //Setup Each Cell Based on Loop though all the cells in table view
             for (int i = 0; i < [self.dataSource count]; i++) {
                 BATCrimeCellController *row = [self.tableView rowControllerAtIndex:i];
                 [row setupCellComponentsByCrimeData:self.dataSource[i]];
             }
         }
     }];
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

-(void)table:(WKInterfaceTable *)table didSelectRowAtIndex:(NSInteger)rowIndex
{
    [self pushControllerWithName:@"BATCrimeDetailInterfaceController" context:self.dataSource[rowIndex]];
}

- (IBAction)addCrime:(id)sender
{
    NSDictionary *newData = @{@"villainName": @"Yin Xu",
                              @"villainFullImageName" : @"avatar.jpg",
                              @"villainHeadImageName" : @"avatar.jpg",
                              @"crimeTitle" : @"JW Salon Hack",
                              @"crimeReportTime" : @"1 minutes ago",
                              @"crimeDescription" : @"A group of smart Geeks, very dangerous",
                              @"neededGadgets" :  @"Money, Money, and Money",
                              @"mapPinImageName" : @"joker_pin",
                              @"mapPinLatDelta" : @(0.00001),
                              @"mapPinLngDelta" : @(0.00001)};
    [self.dataSource insertObject:newData atIndex:0];
    [self.tableView insertRowsAtIndexes:[NSIndexSet indexSetWithIndex:0] withRowType:@"BATCrimeCellController"];
    BATCrimeCellController *row = [self.tableView rowControllerAtIndex:0];
    [row setupCellComponentsByCrimeData:newData];
}

@end



