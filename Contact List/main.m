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
        ContactList* contactList = [[ContactList alloc] init];
        while(true){
            InputCollector* inputCollector = [[InputCollector alloc] init];

            NSString* operation = [inputCollector inputForPrompt:@"What would you like to do next?\nnew - Create a new contact\nlist - List all contacts\nquit - Exit\nshow - show detail of a contact\nfind - find a contact"];
            if([operation isEqualToString:@"quit"]){
                break;
            }else if([operation isEqualToString:@"new"]){
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
                    [contactList addContact:newContact];
                }
            }else if([operation isEqualToString:@"list"]){
                int index = 0;
                for(Contact *contact in contactList.contactList){
                    NSLog(@"%d: %@", index, contact.name);
                    index++;
                }
            }else if([operation isEqualToString:@"show"]){
                NSString* indexString = [inputCollector inputForPrompt:@"Index: "];
                NSInteger index = [indexString integerValue];
                if(index < 0 || index > contactList.contactList.count-1){
                    NSLog(@"Not found");
                }else{
                    Contact* search = [contactList.contactList objectAtIndex:index];
                    NSLog(@"%d: Name: %@\nEmail: %@", index, search.name, search.email);
                }
            }else if([operation isEqualToString:@"find"]){
                NSString* search = [inputCollector inputForPrompt:@"Search term: "];
                for(Contact *contact in contactList.contactList){
                    if([search isEqualToString:contact.name] || [contact.email containsString:search]){
                        NSLog(@"Name: %@\nEmail: %@", contact.name, contact.email);
                    }else{
                        NSLog(@"Not found");
                    }
                }
            }
        }
    }
    return 0;
}
