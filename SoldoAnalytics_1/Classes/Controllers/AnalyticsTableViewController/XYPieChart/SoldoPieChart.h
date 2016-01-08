//
//  SoldoPieChart.h
//  ExamplePieChart
//
//  Created by daniele candotti on 29/12/15.
//  Copyright © 2015 candotti.info. All rights reserved.
//

#import "XYPieChart.h"
IB_DESIGNABLE
@interface SoldoPieChart : XYPieChart

@property IBInspectable NSInteger externalRadius ;
@property IBInspectable NSInteger internalRadius ;

-(void)addCustomLayout;
@end
