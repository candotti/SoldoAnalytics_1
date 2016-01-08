//
//  RootViewController.m
//  SoldoAnalytics_1
//
//  Created by daniele candotti on 03/01/16.
//  Copyright © 2016 Daniele Candotti. All rights reserved.
//

#import "RootViewController.h"
#import "AnalyticsTableViewController.h"
@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)pushToAnalyticsViewController:(id)sender{
    
    AnalyticsTableViewController * analyticsTableViewController= [[AnalyticsTableViewController alloc] initWithSampleData];
    [self.navigationController pushViewController:analyticsTableViewController animated:YES];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
