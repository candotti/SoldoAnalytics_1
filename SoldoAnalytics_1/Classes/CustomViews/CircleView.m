//
//  CircleView.m
//  SoldoAnalytics
//
//  Created by daniele candotti on 02/01/16.
//  Copyright © 2016 Daniele Candotti. All rights reserved.
//

#import "CircleView.h"

@implementation CircleView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
    self.layer.cornerRadius = self.frame.size.width/2;
    self.layer.masksToBounds = YES;
}


@end
