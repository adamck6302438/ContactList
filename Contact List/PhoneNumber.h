//
//  PhoneNumber.h
//  Contact List
//
//  Created by Frances ZiyiFan on 4/30/19.
//  Copyright © 2019 Ray Kang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PhoneNumber : NSObject

@property (nonatomic, strong) NSString* type;
@property (nonatomic, strong) NSString* number;

- (instancetype) initWithType: (NSString *) t andNumber: (NSString *)n;

@end

NS_ASSUME_NONNULL_END
