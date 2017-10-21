//
//  CLHero.h
//  LOLHero
//
//  Created by LongCh on 2017/10/10.
//  Copyright © 2017年 LongCh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CLHero : NSObject
@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *image;
@property (nonatomic,copy) NSString *desc;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)HeroWithDict:(NSDictionary *)dict;
@end
