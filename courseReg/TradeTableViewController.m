//
//  TradeTableViewController.m
//  courseReg
//
//  Created by Mingsheng Xu on 9/22/13.
//  Copyright (c) 2013 Mingsheng Xu. All rights reserved.
//

#import "TradeTableViewController.h"
#import "API.h"
#import "TradeItemDetailTableViewController.h"
#import "TradeItemTableViewCell.h"
@interface TradeTableViewController ()

@property (nonatomic, strong) UIRefreshControl *refreshControl;

@end

@implementation TradeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Refresh
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    refreshControl = [[UIRefreshControl alloc] init];
    refreshControl.attributedTitle = [[NSAttributedString alloc] initWithString:@"Pull to refresh"];
    [refreshControl addTarget:self
                       action:@selector(refreshTableView:)
             forControlEvents:UIControlEventValueChanged];
    self.refreshControl = refreshControl;
    [self.tableView addSubview:refreshControl];
}

- (void)viewWillAppear:(BOOL)animated {
    [self showTradeList];
}

- (void)showTradeList {
    self.array = [NSMutableArray array];
    self.searchresult = [NSMutableArray array];
    
    NSString* command = @"showTradeList";
    NSMutableDictionary* params =[NSMutableDictionary dictionaryWithObjectsAndKeys:
                                  command, @"command",
                                  nil];
    
    //make the call to the web API
    [[API sharedInstance] commandWithParams:params
                               onCompletion:^(NSDictionary *json) {
                                   //NSLog(@"res is %@", res);
                                   //NSLog(@"json is %@", json);
                                   if ([json objectForKey:@"error"]==nil ) {
                                       self.nsjson=json;
                                       self.array = [self.nsjson objectForKey:@"result"];
                                       self.searchresult = [[NSArray alloc] initWithArray:self.array copyItems:NO];
                                       //success
                                   } else {
                                       //error
                                       UIAlertView * alertView = [[UIAlertView alloc] initWithTitle: @"My Error" message: [json objectForKey:@"error"] delegate: nil cancelButtonTitle: @"OK" otherButtonTitles: nil];
                                       [alertView show];
                                   }
                                   if (self.refreshControl.isRefreshing) {
                                       [self.refreshControl endRefreshing];
                                       self.refreshControl.attributedTitle = [[NSAttributedString alloc]initWithString:@"Pull to refresh"];
                                   }
                                   [self.tableView reloadData];
                               }];
    
}

- (void)refreshTableView:(UIRefreshControl *)controller
{
    if (controller.refreshing) {
        controller.attributedTitle = [[NSAttributedString alloc]initWithString:@"Loading..."];
        [self showTradeList];
    }
    
}

#pragma mark - Table view data source

- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope
{
    NSPredicate *resultPredicate = [NSPredicate predicateWithFormat:@"self.have contains[c] %@", searchText];
    self.searchresult = [self.array filteredArrayUsingPredicate:resultPredicate];
}

-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    NSLog(@"imcalled");
    [self filterContentForSearchText:searchString
                               scope:[[self.searchDisplayController.searchBar scopeButtonTitles]
                                      objectAtIndex:[self.searchDisplayController.searchBar
                                                     selectedScopeButtonIndex]]];
    
    return YES;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    if(tableView == self.searchDisplayController.searchResultsTableView){
        NSLog(@"!!!!%lu",[self.searchresult count]);
        return [self.searchresult count];
    }
    
    return [self.array count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TradeItemTableViewCell *cell = (TradeItemTableViewCell *)[self.tableView dequeueReusableCellWithIdentifier:@"TradeItemTableViewCell"];
    
    NSDictionary *tempDictionary = nil;
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        tempDictionary = [self.searchresult objectAtIndex:indexPath.row];
    } else {
        tempDictionary = [self.array objectAtIndex:indexPath.row];
    }
    
    NSString* fontName = @"Optima-Italic";
    NSString* boldFontName = @"Optima-ExtraBlack";
    
    UIColor* mainColor = [UIColor colorWithRed:50.0/255 green:102.0/255 blue:147.0/255 alpha:1.0f];
    cell.exchangeLabel.textColor =  mainColor;
    cell.exchangeLabel.font =  [UIFont fontWithName:fontName size:14.0f];
    
    cell.haveLabel.textColor =  mainColor;
    cell.haveLabel.font =  [UIFont fontWithName:fontName size:14.0f];
    
    if([[tempDictionary objectForKey:@"have"] isEqualToString:@""]){
        cell.haveLabel.text =[NSString stringWithFormat:@"%@ have nothing",[tempDictionary objectForKey:@"username"]];
    }else{
        cell.haveLabel.text =[NSString stringWithFormat:@"%@ have %@",[tempDictionary objectForKey:@"username"],[tempDictionary objectForKey:@"have"]];
        
    }
    if([[tempDictionary objectForKey:@"exchange" ] isEqualToString:@""]){
        cell.exchangeLabel.text =[NSString stringWithFormat:@" to trade nothing"];
    }else{
        cell.exchangeLabel.text =[NSString stringWithFormat:@" to trade %@",[tempDictionary objectForKey:@"exchange"]];
    }
    NSString *photoURL1 = @"http://www.mingshengxu.com/promos/img/";
    NSString *photoURL = [NSString stringWithFormat:@"%@%@_profile.jpg",photoURL1,[tempDictionary objectForKey:@"username"]];
    
    [cell.profileImageView setImageWithURL:[NSURL URLWithString:photoURL] ];
    cell.accessoryType =   UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

- (IBAction)addTradeItem_Press:(UIBarButtonItem *)sender {
    
    [self performSegueWithIdentifier:@"TradeListToAddItem" sender:self];
}

#pragma mark - Navigation
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(id)sender
{
    [self performSegueWithIdentifier:@"TradeListToTradeItemDetail" sender:self];
}

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"TradeListToTradeItemDetail"])
    {
        TradeItemDetailTableViewController *transferViewController = segue.destinationViewController;
        transferViewController.tempDictionary =[[self.nsjson objectForKey:@"result"] objectAtIndex:[self.tableView indexPathForSelectedRow].row];
        
    }
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if([segue.identifier isEqualToString:@"TradeListToAddItem"])
    {
        TradeItemDetailTableViewController *transferViewController = segue.destinationViewController;
    }
    
}


@end
