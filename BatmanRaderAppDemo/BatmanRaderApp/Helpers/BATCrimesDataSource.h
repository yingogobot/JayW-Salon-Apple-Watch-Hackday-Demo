//
//  BATCrimesDataSource.h
//  BatmanRaderApp
//
//  Created by Yin Xu on 7/1/15.
//  Copyright (c) 2015 YXApp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BATCrimesDataSource : NSObject

@property (nonatomic, strong) NSMutableArray *crimesRawData;
@property (nonatomic, strong) NSMutableArray *crimesObjectArray;

+ (instancetype)sharedInstance;

@end
