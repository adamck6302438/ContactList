//
//  PhoneNumber.m
//  Contact List
//
//  Created by Frances ZiyiFan on 4/30/19.
//  Copyright © 2019 Ray Kang. All rights reserved.
//

#import "PhoneNumber.h"

@implementation PhoneNumber

- (instancetype) initWithType: (NSString *) t andNumber: (NSString *)n{
    self = [super init];
    if(self){
        _type = t;
        _number = n;
    }
    return self;
}

@end
