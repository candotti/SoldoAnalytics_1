//
//  AnalyticsTableViewController.m
//  SoldoAnalytics
//
//  Created by daniele candotti on 31/12/15.
//  Copyright © 2015 Daniele Candotti. All rights reserved.
//

#import "AnalyticsTableViewController.h"
#import "AnalyticsTableViewCell.h"
@interface AnalyticsTableViewController ()

@end

@implementation AnalyticsTableViewController


-(id)initWithSampleData{
    
    self = [super init];
    if(self)
        [self populateArray];
    
    return self;
}
-(void)populateArray{

    _dataMutableArray = [NSMutableArray new];

    for(NSDictionary * dict in [self getDataFromPlist])
        [_dataMutableArray addObject:[AnalyticsCategory parseFromPlistDictionary:dict]];
    
}
-(NSArray*)getDataFromPlist{
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"dataSample" ofType:@"plist"];
    NSAssert(path, @"could not find dataSample.plist");
    return [[NSArray alloc] initWithContentsOfFile:path];
}
- (void)viewDidLoad {
    
    [super viewDidLoad];
    chartView.delegate = self;
    chartView.dataSource = self;
    [chartView addCustomLayout];

}
-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
     [chartView reloadData];

}
- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - UITableView datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [_dataMutableArray count];
}

- (AnalyticsTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    AnalyticsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" ];
   
    return  [self tableView:tableView setCell:cell forRowAtIndexPath:indexPath];
}

-(AnalyticsTableViewCell*) tableView:(UITableView *)tableView setCell:(AnalyticsTableViewCell*)cell forRowAtIndexPath:(NSIndexPath*)indexPath{
    
    AnalyticsCategory * analyticsCategory = [_dataMutableArray objectAtIndex:indexPath.row];
    
    if(!cell)
        cell= [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([AnalyticsTableViewCell class])
                                             owner:self options:nil] objectAtIndex:0];
    
    cell.totalLabel.text = analyticsCategory.total;
    cell.percentageLabel.text = [NSString stringWithFormat:@"%.f%%",analyticsCategory.percentage];
    cell.categoryNameLabel.text = analyticsCategory.categoryName;
    cell.thumbImageView.image = [UIImage imageNamed:analyticsCategory.categoryName];
    [cell.progressView setProgressTintColor:analyticsCategory.color];
    [UIView animateWithDuration:0.6 animations:^{
        [cell.progressView setProgress:((float)analyticsCategory.percentage /100.0) animated:YES];
    }];
    cell.layer.borderColor =analyticsCategory.color.CGColor;

    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return ( [tableView indexPathForSelectedRow] == indexPath)? 144:44;
}
#pragma mark - UITableView Delegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [chartView setSliceSelectedAtIndex:indexPath.row];
    [self completeUpdates];
    
}
-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [chartView setSliceDeselectedAtIndex:indexPath.row];
    [self completeUpdates];
}


#pragma mark - XYPieChart Datasource
-(UIColor *)pieChart:(XYPieChart *)pieChart colorForSliceAtIndex:(NSUInteger)index{
    
    return  [(AnalyticsCategory*)[_dataMutableArray objectAtIndex:index] color];
}

-(CGFloat)pieChart:(XYPieChart *)pieChart valueForSliceAtIndex:(NSUInteger)index{
    
 
    return  [(AnalyticsCategory*)[_dataMutableArray objectAtIndex:index] percentage];
}

-(NSUInteger)numberOfSlicesInPieChart:(XYPieChart *)pieChart{
    
    return  [_dataMutableArray count];
}

#pragma mark - XYPieChart Delegate

-(void)pieChart:(XYPieChart *)pieChart didSelectSliceAtIndex:(NSUInteger)index{
    
    NSIndexPath * selectedIndexPath=[self.tableView indexPathForSelectedRow];
    BOOL  sliceIsAlreadySelected = FALSE;
    if(selectedIndexPath){
        
        [self.tableView deselectRowAtIndexPath:selectedIndexPath
                                      animated:YES];
        [chartView setSliceDeselectedAtIndex:selectedIndexPath.row];

        sliceIsAlreadySelected = (selectedIndexPath.row == index);  // Bug in XYPieChart delegate
           
    }
    if(!sliceIsAlreadySelected)
        [self.tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:index inSection:0]
                                    animated:NO
                              scrollPosition:UITableViewScrollPositionNone];
    [self completeUpdates];
}

-(void)pieChart:(XYPieChart *)pieChart didDeselectSliceAtIndex:(NSUInteger)index{
    
    NSIndexPath * indexPath = [self.tableView indexPathForSelectedRow];
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self completeUpdates];
}

-(void)completeUpdates{
    
    [self.tableView beginUpdates];
    [self.tableView endUpdates];
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
