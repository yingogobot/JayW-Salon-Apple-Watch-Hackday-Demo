//
//  BATCrimeTableViewCell.m
//  BatmanRaderApp
//
//  Created by Yin Xu on 7/1/15.
//  Copyright (c) 2015 YXApp. All rights reserved.
//

#import "BATCrimeTableViewCell.h"
#import "BATCrimeObject.h"
#import "BATVillainObject.h"


@implementation BATCrimeTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setupCellByCrime:(BATCrimeObject *)crime
{
    self.crime = crime;
    self.villainImageView.image = crime.villain.fullImage;
    self.villainNameLabel.text = crime.villain.name;
    self.crimeTitleLabel.text = crime.title;
    self.crimeReportTimeLabel.text = [NSString stringWithFormat:@"Reported %@", crime.reportTime];
}

@end
