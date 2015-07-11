//
//  BATCrimesListInterfaceController.h
//  BatmanRaderApp
//
//  Created by Yin Xu on 7/5/15.
//  Copyright (c) 2015 YXApp. All rights reserved.
//

#import <WatchKit/WatchKit.h>
#import <Foundation/Foundation.h>

@interface BATCrimesListInterfaceController : WKInterfaceController

@property (nonatomic, weak) IBOutlet WKInterfaceTable *tableView;

- (IBAction)addCrime:(id)sender;

@end
