//
//  AnalyticsTableViewController.h
//  SoldoAnalytics
//
//  Created by daniele candotti on 31/12/15.
//  Copyright © 2015 Daniele Candotti. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SoldoPieChart.h"
#import "AnalyticsCategory.h"
@interface AnalyticsTableViewController : UITableViewController <XYPieChartDataSource,XYPieChartDelegate>{
    
    __weak IBOutlet UIView *headerView;
  //    __weak  UIView * headerView;
    __weak IBOutlet SoldoPieChart * chartView;
}
@property NSMutableArray * dataMutableArray;
//@property (nonatomic,strong) IBOutlet UIView * headerView;
-(id)initWithSampleData;

@end
