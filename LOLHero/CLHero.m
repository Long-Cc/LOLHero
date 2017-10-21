//
//  CLHero.m
//  LOLHero
//
//  Created by LongCh on 2017/10/10.
//  Copyright © 2017年 LongCh. All rights reserved.
//

#import "CLHero.h"

@implementation CLHero

- (instancetype)initWithDict:(NSDictionary *)dict{
    if(self = [super init]){
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+ (instancetype)HeroWithDict:(NSDictionary *)dict{
    return [[self alloc] initWithDict:dict];
}
@end
