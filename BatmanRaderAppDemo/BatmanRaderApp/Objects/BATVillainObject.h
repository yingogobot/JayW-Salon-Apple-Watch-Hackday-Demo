//
//  BATvillainObject.h
//  BatmanRaderApp
//
//  Created by Yin Xu on 7/1/15.
//  Copyright (c) 2015 YXApp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface BATVillainObject : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) UIImage *fullImage;
@property (nonatomic, strong) UIImage *headImage;
@property (nonatomic, assign) BOOL isCaught;

@end
