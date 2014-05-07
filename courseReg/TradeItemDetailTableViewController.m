//
//  TradeItemDetailTableViewController.m
//  courseReg
//
//  Created by Mingsheng Xu on 9/29/13.
//  Copyright (c) 2013 Mingsheng Xu. All rights reserved.
//

#import "TradeItemDetailTableViewController.h"
#import "API.h"

@interface TradeItemDetailTableViewController ()

@property (nonatomic, strong) NSArray* sectionHeader;

@property (nonatomic, strong) NSString* boldFontName;

@property (nonatomic, strong) UIColor* onColor;

@property (nonatomic, strong) UIColor* offColor;

@property (nonatomic, strong) UIColor* dividerColor;


@end

@implementation TradeItemDetailTableViewController

@synthesize noteTextView;
@synthesize tempDictionary;

@synthesize  lable2;
NSDictionary *njson;


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    
    NSString* command = @"showInfo";
    NSString *user = [tempDictionary objectForKey:@"username"];
    NSMutableDictionary* params =[NSMutableDictionary dictionaryWithObjectsAndKeys:
                                  command, @"command",
                                  user,@"username",
                                  nil];
    //make the call to the web API
    [[API sharedInstance] commandWithParams:params
                               onCompletion:^(NSDictionary *json) {
                                   if ([json objectForKey:@"error"]==nil ) {
                                       njson=[[json objectForKey:@"result"] objectAtIndex:0];
                                       //NSLog(@"json   %@",njson);
                                       //NSLog(@"%@ hello",[njson objectForKey:@"email"]);
                                       
                                       if ([[tempDictionary objectForKey:@"emailPrivacy"] intValue ]== 0) {
                                           lable2.text=[njson objectForKey:@"email"];
                                       }
                                   } else {
                                       //error
                                       UIAlertView * alertView = [[UIAlertView alloc] initWithTitle: @"My Error" message: [json objectForKey:@"error"] delegate: nil cancelButtonTitle: @"OK" otherButtonTitles: nil];
                                       [alertView show];
                                       
                                   }
                                   
                               }];
    
    
    NSLog(@"%@",self.info);

    [super viewDidLoad];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.boldFontName = @"Avenir-Black";
    self.onColor = [UIColor colorWithRed:222.0/255 green:59.0/255 blue:47.0/255 alpha:1.0f];
    self.offColor = [UIColor colorWithRed:242.0/255 green:228.0/255 blue:227.0/255 alpha:1.0];
    self.dividerColor = [UIColor whiteColor];

    
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, 568) style:UITableViewStyleGrouped];
    self.tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.backgroundView = nil;
    
    self.tableView.backgroundColor = [UIColor colorWithRed:231.0/255 green:235.0/255 blue:238.0/255 alpha:1.0f];
    self.tableView.separatorColor = [UIColor clearColor];
    self.sectionHeader = [NSArray arrayWithObjects:@"Have", @"To Exchange", @"Contact", @"Note",  nil];
    NSLog(@"%@",tempDictionary);
   

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table view data source
/*
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 0;
}
 */
 - (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
 if (section==0) {
 return 40;
 }
 return 30;
 }

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView* headerView;
    UILabel* label;
    if (section==0) {
        headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 30)];
        label = [[UILabel alloc] initWithFrame:CGRectMake(20, 10, 200, 20)];
        if ([[tempDictionary objectForKey:@"gender"] intValue]==0) {
            label.text = @"He have";
        }else {
        label.text = @"She have";
        }
    }else if (section==1){
        headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 30)];
        label = [[UILabel alloc] initWithFrame:CGRectMake(20, -5, 200, 30)];
        if ([[tempDictionary objectForKey:@"gender"] intValue]==0) {
            label.text = @"He want ";
        }else {
            label.text = @"She want";
        }
    }else{
        headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 30)];
        label = [[UILabel alloc] initWithFrame:CGRectMake(20, -5, 200, 30)];
        label.text = self.sectionHeader[section];
    }
    headerView.backgroundColor = [UIColor clearColor];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont fontWithName:self.boldFontName size:20.0f];
    label.textColor = self.onColor;
    
    
    
    [headerView addSubview:label];
    
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{   if( indexPath.section==3){
    return 250;
    }else{

        return 40;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *SimpleTableIdentifier = @"SimpleTableIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SimpleTableIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:SimpleTableIdentifier] ;
    }
    //NSLog(@"%ld",(long)indexPath.section);
    switch(indexPath.section)
    {
        case 0:{
            
            // NSLog(@"%@ lable1",lable1.text);
           UILabel *lable0 = [[UILabel alloc] initWithFrame:CGRectMake(20,7, 280, 30)];
            lable0.font = [UIFont fontWithName:self.boldFontName size:17.0f];
            
            lable0.textColor = [UIColor colorWithWhite:0.5 alpha:1.0f];
            lable0.text=[tempDictionary objectForKey:@"have"];
             cell.selectionStyle=UITableViewCellSelectionStyleNone;
            [cell addSubview:lable0];
            break;
        }
        case 1:{
            // NSLog(@"%@ lable1",lable2.text);
           UILabel *lable1 = [[UILabel alloc] initWithFrame:CGRectMake(20,7, 280, 30)];
            lable1.font = [UIFont fontWithName:self.boldFontName size:17.0f];
            
            lable1.textColor = [UIColor colorWithWhite:0.5 alpha:1.0f];
            lable1.text=[tempDictionary objectForKey:@"exchange"];
             cell.selectionStyle=UITableViewCellSelectionStyleNone;
            [cell addSubview:lable1];
            break;
        }
            
        case 2:
        {
            lable2 = [[UILabel alloc] initWithFrame:CGRectMake(20,7, 280, 30)];
                        cell.selectionStyle=UITableViewCellSelectionStyleNone;
            
            lable2.font = [UIFont fontWithName:self.boldFontName size:17.0f];
            
            lable2.textColor = [UIColor colorWithWhite:0.5 alpha:1.0f];
           
            [cell addSubview:lable2];
            break;
            
        }
        case 3:{
            cell.selectionStyle=UITableViewCellSelectionStyleNone;
            
            UILabel *lable3 = [[UILabel alloc] initWithFrame:CGRectMake(20,7, 280, 230)];
            lable3.font = [UIFont fontWithName:self.boldFontName size:17.0f];
            lable3.text =[tempDictionary objectForKey:@"note"];
            NSString* fontName = @"Optima-Italic";
            UIColor* mainColor = [UIColor colorWithRed:50.0/255 green:102.0/255 blue:147.0/255 alpha:1.0f];
            lable3.textColor =  mainColor;
            lable3.font =  [UIFont fontWithName:fontName size:14.0f];
            
          [cell addSubview:lable3];
            break;
        }
            
    }

    
    return cell;
}

// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return NO;
}


/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
