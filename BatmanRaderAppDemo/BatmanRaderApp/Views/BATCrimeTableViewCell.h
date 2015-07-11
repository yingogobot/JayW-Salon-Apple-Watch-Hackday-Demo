//
//  BATCrimeTableViewCell.h
//  BatmanRaderApp
//
//  Created by Yin Xu on 7/1/15.
//  Copyright (c) 2015 YXApp. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BATCrimeObject;
@interface BATCrimeTableViewCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UIImageView *villainImageView;
@property (nonatomic, weak) IBOutlet UILabel *villainNameLabel;
@property (nonatomic, weak) IBOutlet UILabel *crimeTitleLabel;
@property (nonatomic, weak) IBOutlet UILabel *crimeReportTimeLabel;


@property (nonatomic, strong) BATCrimeObject *crime;

- (void)setupCellByCrime:(BATCrimeObject *)crime;

@end
