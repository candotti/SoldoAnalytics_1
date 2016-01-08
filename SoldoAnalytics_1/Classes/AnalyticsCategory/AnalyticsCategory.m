//
//  AnalyticsCategory.m
//  SoldoAnalytics
//
//  Created by daniele candotti on 02/01/16.
//  Copyright © 2016 Daniele Candotti. All rights reserved.
//

#import "AnalyticsCategory.h"

@implementation AnalyticsCategory

+(AnalyticsCategory*)parseFromPlistDictionary:(NSDictionary *)dict{
    
    AnalyticsCategory * analyticsCategory = [AnalyticsCategory new];
    
    analyticsCategory.categoryName = [dict valueForKey:@"name"];
    analyticsCategory.percentage   = [[dict valueForKey:@"percentage"] floatValue];
    analyticsCategory.total        = [dict valueForKey:@"value"];
    analyticsCategory.color        = [self getColorFromPlistObject:[dict objectForKey:@"color"]];
    
    return analyticsCategory;
    
}
+(UIColor*)getColorFromPlistObject:(NSObject*)object{
    
    return [UIColor colorWithRed:[[object valueForKey:@"red"] floatValue]/255.0
                           green:[[object valueForKey:@"green"] floatValue]/255.0
                            blue:[[object valueForKey:@"blue"] floatValue]/255.0
                           alpha:1.0];
    
}
@end
