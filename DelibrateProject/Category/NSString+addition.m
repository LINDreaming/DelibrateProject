//
//  NSString+addition.m
//  DelibrateProject
//
//  Created by 林喜 on 7/14/17.
//  Copyright © 2017 HRBEduYun. All rights reserved.
//

#import "NSString+addition.h"

@implementation NSString (addition)
+ (NSString *)stringWithTimeInterval:(NSTimeInterval)interval{
    NSInteger min = interval/60;
    NSInteger sec = (NSInteger)interval%60;
    
    NSString *minStr =min<10? [NSString stringWithFormat:@"0%ld",(long)min]:[NSString stringWithFormat:@"%ld",(long)min];
    NSString *secStr = sec <10 ?[NSString stringWithFormat:@"0%ld",(long)sec]:[NSString stringWithFormat:@"%ld",(long)sec];
    return [NSString stringWithFormat:@"%@:%@",minStr,secStr];
    
}

@end
