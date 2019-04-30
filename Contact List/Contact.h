//
//  Contact.h
//  Contact List
//
//  Created by Frances ZiyiFan on 4/30/19.
//  Copyright © 2019 Ray Kang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PhoneNumber.h"

NS_ASSUME_NONNULL_BEGIN

@interface Contact : NSObject

@property (nonatomic, strong) NSString* name;
@property (nonatomic, strong) NSString* email;
@property (nonatomic, strong) NSMutableArray* phone;

- (instancetype) initWithName: (NSString*)n andEmail: (NSString*)e;
- (void) addPhone: (PhoneNumber *)p;

@end

NS_ASSUME_NONNULL_END
