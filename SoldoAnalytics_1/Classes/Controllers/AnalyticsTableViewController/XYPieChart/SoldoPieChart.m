//
//  SoldoPieChart.m
//  ExamplePieChart
//
//  Created by daniele candotti on 29/12/15.
//  Copyright © 2015 candotti.info. All rights reserved.
//

#import "SoldoPieChart.h"

@implementation SoldoPieChart

-(void)addCustomLayout{
    
    [self setAnimationSpeed:3.0];
    [self setLabelFont:[UIFont fontWithName:@"DBLCDTempBlack" size:24]];
    [self setLabelRadius:self.frame.size.width/2-20];
    [self setShowPercentage:NO];
    [self setPieBackgroundColor:[UIColor colorWithWhite:0.95 alpha:1]];
    [self setPieCenter:CGPointMake(self.frame.size.width/2,
                                   self.frame.size.height/2)];
    [self setLabelShadowColor:[UIColor blackColor]];
    [self setShowLabel:NO];
}



-(void)drawRect:(CGRect)rect{
    
#if TARGET_INTERFACE_BUILDER
    CGRect borderRect = CGRectMake(self.center.x-self.internalRadius/2,self.center.y-self.internalRadius/2,self.internalRadius,self.internalRadius);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [UIColor redColor].CGColor);
    CGContextSetLineWidth(context, 0.0);
    CGContextFillEllipseInRect (context, borderRect);
    CGContextStrokeEllipseInRect(context, borderRect);
    CGContextFillPath(context);
#endif
}
@end
