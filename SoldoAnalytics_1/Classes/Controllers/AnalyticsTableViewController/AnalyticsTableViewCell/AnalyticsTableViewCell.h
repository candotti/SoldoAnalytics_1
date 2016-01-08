//
//  AnalyticsTableViewCell.h
//  SoldoAnalytics
//
//  Created by daniele candotti on 01/01/16.
//  Copyright © 2016 Daniele Candotti. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AnalyticsTableViewCell : UITableViewCell
@property (weak) IBOutlet UIProgressView * progressView;
@property (weak) IBOutlet UILabel * percentageLabel;
@property (weak) IBOutlet UILabel * categoryNameLabel;
@property (weak) IBOutlet UILabel * totalLabel;
@property (weak) IBOutlet UIImageView * thumbImageView;
@end
