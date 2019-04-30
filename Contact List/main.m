//
//  main.m
//  Contact List
//
//  Created by Frances ZiyiFan on 4/30/19.
//  Copyright © 2019 Ray Kang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "InputCollector.h"
#import "Contact.h"
#import "ContactList.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        InputCollector* inputCollector = [[InputCollector alloc] init];
        ContactList* contactList = [[ContactList alloc] init];
        while(true){
            NSString* operation = [inputCollector inputForPrompt:@"What would you like to do next?\nnew - Create a new contact\nlist - List all contacts\nquit - Exit"];
            if([operation isEqualToString:@"quit"]){
                break;
            }else if([operation isEqualToString:@"new"]){
                NSString* name = [inputCollector inputForPrompt:@"Name: "];
                NSString* email = [inputCollector inputForPrompt:@"Email: "];
                Contact* newContact = [[Contact alloc] valueWithName:name inPropertyWithKey:email];
                [contactList addContact:newContact];
            }else if([operation isEqualToString:@"list"]){
                int index = 0;
                for(Contact *contact in contactList){
                    NSLog(@"%d: %@", index, contact.name);
                    index++;
                }
            }
        }
    }
    return 0;
}
