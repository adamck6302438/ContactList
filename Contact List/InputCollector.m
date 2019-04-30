//
//  InputCollector.m
//  Contact List
//
//  Created by Frances ZiyiFan on 4/30/19.
//  Copyright © 2019 Ray Kang. All rights reserved.
//

#import "InputCollector.h"

@implementation InputCollector

-(NSString *)inputForPrompt:(NSString *)promptString{
    char inputChar[255];
    fgets(inputChar, 255, stdin);
    NSString* userInput = [NSString stringWithUTF8String:inputChar];
    //userInput = [userInput stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]];
    return userInput;
}

@end
