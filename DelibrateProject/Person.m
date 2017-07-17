//
//  Person.m
//  DelibrateProject
//
//  Created by 林喜 on 6/20/17.
//  Copyright © 2017 HRBEduYun. All rights reserved.
//

#import "Person.h"

@implementation Person


- (void)test {
NSMutableString *string = [NSMutableString stringWithFormat:@"abc"];    self.stronUserName = string;
    self.copUserId = string;
   
    NSLog(@"origin string: %p, %p", string, &string);
    
    NSLog(@"strong string: %p, %p", _stronUserName, &_stronUserName);
    NSLog(@"copy string: %p, %p", _copUserId, &_copUserId);
    [string appendFormat:@"23"];
    
}

@end
