//
//  Contact.m
//  Contact List
//
//  Created by Frances ZiyiFan on 4/30/19.
//  Copyright © 2019 Ray Kang. All rights reserved.
//

#import "Contact.h"

@implementation Contact

- (instancetype) initWithName: (NSString*)n andEmail: (NSString*)e {
    self = [super init];
    if(self){
        _name = n;
        _email = e;
        _phone = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void) addPhone: (PhoneNumber *)p{
    [_phone addObject:p];
}

@end
