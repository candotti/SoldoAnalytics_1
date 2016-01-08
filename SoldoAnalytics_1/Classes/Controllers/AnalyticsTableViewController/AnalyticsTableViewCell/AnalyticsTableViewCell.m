//
//  AnalyticsTableViewCell.m
//  SoldoAnalytics
//
//  Created by daniele candotti on 01/01/16.
//  Copyright © 2016 Daniele Candotti. All rights reserved.
//

#import "AnalyticsTableViewCell.h"

@implementation AnalyticsTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    self.layer.borderWidth =(selected) ? 2:0;
    self.layer.cornerRadius= (selected ) ? 5.0f : 0.0f;
    
    if(selected){
        float originalValue= [self.progressView progress];
        
        [UIView animateWithDuration:0.2 animations:^{
            
            [self.progressView setProgress:0.0 animated:NO];
            
        }completion:^(BOOL finisced){
            
            [UIView animateWithDuration:0.6 animations:^{
                
                [self.progressView setProgress:originalValue animated:YES];
            }];
        }];

        
    }
}

@end
