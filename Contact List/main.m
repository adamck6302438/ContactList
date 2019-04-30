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
#import "PhoneNumber.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSMutableArray* log = [[NSMutableArray alloc] init];
        ContactList* contactList = [[ContactList alloc] init];
        InputCollector* inputCollector = [[InputCollector alloc] init];
        while(true){
            NSString* operation = [inputCollector inputForPrompt:@"What would you like to do next?\nnew - Create a new contact\nlist - List all contacts\nquit - Exit\nshow - show detail of a contact\nfind - find a contact\nhistory - show the last 3 commands"];
            if([operation isEqualToString:@"quit"]){
                break;
            }else if([operation isEqualToString:@"new"]){
                [log addObject:operation];
                NSString* email = [inputCollector inputForPrompt:@"Email: "];
                BOOL existed = NO;
                for(Contact *contact in contactList.contactList){
                    if([email isEqualToString: contact.email]){
                        NSLog(@"Contact already existed.");
                        existed = YES;
                    }
                }
                if(existed){
                    continue;
                }else{
                    NSString* name = [inputCollector inputForPrompt:@"Name: "];
                    Contact* newContact = [[Contact alloc] initWithName:name andEmail:email];
                    NSString* addPhone = [inputCollector inputForPrompt:@"Add phone number(s)? Type yes to start adding."];
                    if([addPhone isEqualToString:@"yes"]){
                        while (true) {
                            NSString* phoneType = [inputCollector inputForPrompt:@"Phone Type: "];
                            NSString* phoneNumber = [inputCollector inputForPrompt:@"Phone Number: "];
                            PhoneNumber* newPhone = [[PhoneNumber alloc] initWithType:phoneType andNumber:phoneNumber];
                            [newContact addPhone: newPhone];
                            NSString* more = [inputCollector inputForPrompt:@"Keep adding(no to stop)?"];
                            if([more isEqualToString:@"no"]){
                                break;
                            }
                            else{
                                continue;
                            }
                        }
                    }
                    [contactList addContact:newContact];
                }
            }else if([operation isEqualToString:@"list"]){
                [log addObject:operation];
                int index = 0;
                for(Contact *contact in contactList.contactList){
                    NSLog(@"%d: %@", index, contact.name);
                    index++;
                }
            }else if([operation isEqualToString:@"show"]){
                [log addObject:operation];
                NSString* indexString = [inputCollector inputForPrompt:@"Index: "];
                NSInteger index = [indexString integerValue];
                if(index < 0 || index > contactList.contactList.count-1){
                    NSLog(@"Not found");
                }else{
                    Contact* search = [contactList.contactList objectAtIndex:index];
                    NSLog(@"%ld: Name: %@\nEmail: %@", index, search.name, search.email);
                }
            }else if([operation isEqualToString:@"find"]){
                [log addObject:operation];
                NSString* search = [inputCollector inputForPrompt:@"Search term: "];
                for(Contact *contact in contactList.contactList){
                    if([search isEqualToString:contact.name] || [contact.email containsString:search]){
                        NSLog(@"Name: %@\nEmail: %@", contact.name, contact.email);
                    }else{
                        NSLog(@"Not found");
                    }
                }
            }else if([operation isEqualToString:@"history"]){
                [log addObject:operation];
                for(int i= 3; i>0; i--){
                    NSLog(@"%@\n", [log objectAtIndex:log.count-i]);
                }
            }
        }
    }
    return 0;
}
