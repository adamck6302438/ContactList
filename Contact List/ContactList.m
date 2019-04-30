//
//  ContactList.m
//  Contact List
//
//  Created by Frances ZiyiFan on 4/30/19.
//  Copyright © 2019 Ray Kang. All rights reserved.
//

#import "ContactList.h"


@implementation ContactList

-(instancetype)init{
    self = [super init];
    if(self){
        self.contactList = [[NSMutableArray alloc] init];
    }
    return self;
}

-(void)addContact:(Contact *)newContact{
    [self.contactList addObject:newContact];
}

@end
