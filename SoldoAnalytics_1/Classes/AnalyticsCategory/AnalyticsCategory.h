//
//  AnalyticsCategory.h
//  SoldoAnalytics
//
//  Created by daniele candotti on 02/01/16.
//  Copyright © 2016 Daniele Candotti. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface AnalyticsCategory : NSObject

@property NSString * categoryName;
@property float percentage;
@property NSString* total; 
@property UIColor * color;

+(AnalyticsCategory*)parseFromPlistDictionary:(NSDictionary*)dict;

@end
