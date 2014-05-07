//
//  NewTradeItemTableViewController.m
//  courseReg
//
//  Created by Mingsheng Xu on 14-5-1.
//  Copyright (c) 2014年 Mingsheng Xu. All rights reserved.
//

#import "NewTradeItemTableViewController.h"
#import "SelectCourseTableViewController.h"
#import "API.h"

@interface NewTradeItemTableViewController ()

@property (nonatomic, strong) NSArray* settingTitles;

@property (nonatomic, strong) NSArray* settingsElements;

@property (nonatomic, strong) NSArray* sectionHeader;

@property (nonatomic, strong) NSString* boldFontName;

@property (nonatomic, strong) UIColor* onColor;

@property (nonatomic, strong) UIColor* offColor;

@property (nonatomic, strong) UIColor* dividerColor;


@end

@implementation NewTradeItemTableViewController

@synthesize emailSegmentedControl;
@synthesize emailLabel;
@synthesize emailView;
@synthesize lable1;
@synthesize lable2;
@synthesize customView;

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
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.boldFontName = @"Avenir-Black";
    
    
    self.onColor = [UIColor colorWithRed:222.0/255 green:59.0/255 blue:47.0/255 alpha:1.0f];
    self.offColor = [UIColor colorWithRed:242.0/255 green:228.0/255 blue:227.0/255 alpha:1.0];
    self.dividerColor = [UIColor whiteColor];
    
   
    
    self.navigationController.title = @"Settings";
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, 568) style:UITableViewStyleGrouped];
    self.tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.backgroundView = nil;
    
    
    
    self.tableView.backgroundColor = [UIColor colorWithRed:231.0/255 green:235.0/255 blue:238.0/255 alpha:1.0f];
    self.tableView.separatorColor = [UIColor clearColor];

    self.sectionHeader = [NSArray arrayWithObjects:@"I Have", @"To Exchange", @"Setting", @"Note",  nil];
    

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
    return 4;
}
 */
 - (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
     if (section==0) {
         return 40;
     }
 return 30;
 }
/*
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 1;
}
*/

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView* headerView;
    UILabel* label;
    if (section==0) {
       headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 30)];
         label = [[UILabel alloc] initWithFrame:CGRectMake(20, 10, 200, 20)];
    }else{
     headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 30)];
     label = [[UILabel alloc] initWithFrame:CGRectMake(20, -5, 200, 30)];
    }
     headerView.backgroundColor = [UIColor clearColor];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont fontWithName:self.boldFontName size:20.0f];
    label.textColor = self.onColor;
    
    label.text = self.sectionHeader[section];;
    
    [headerView addSubview:label];
    
    return headerView;
}


-(UISegmentedControl*)createSegmentedControlWithItems:(NSArray*)items{
    
    UISegmentedControl* segmentedControl = [[UISegmentedControl alloc] initWithItems:items];
    
    segmentedControl.frame = CGRectMake(150, 7, 150, 30);
    segmentedControl.selectedSegmentIndex = 0;
    
    return segmentedControl;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{   if( indexPath.section==3){
    return 250;
}else{
    
    return 40;
}
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
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
            lable1 = [[UILabel alloc] initWithFrame:CGRectMake(20,7, 280, 30)];
            lable1.font = [UIFont fontWithName:self.boldFontName size:17.0f];
           
            lable1.textColor = [UIColor colorWithWhite:0.5 alpha:1.0f];
            lable1.text=@"";
            [cell addSubview:lable1];
            break;
        }
        case 1:{
           // NSLog(@"%@ lable1",lable2.text);
            lable2 = [[UILabel alloc] initWithFrame:CGRectMake(20,7, 280, 30)];
            lable2.font = [UIFont fontWithName:self.boldFontName size:17.0f];
            
            lable2.textColor = [UIColor colorWithWhite:0.5 alpha:1.0f];
            lable2.text=@"";
            [cell addSubview:lable2];
            break;
        }
            
        case 2:
        {
        UILabel* Label = [[UILabel alloc] initWithFrame:CGRectMake(20,11, 144, 21)];
        Label.text = [@"show email" uppercaseString];
        Label.textColor = [UIColor colorWithWhite:0.5 alpha:1.0f];
        Label.font = [UIFont fontWithName:self.boldFontName size:17.0f];
        emailSegmentedControl = [self createSegmentedControlWithItems:[NSArray arrayWithObjects:@"YES", @"NO", nil]];
            cell.selectionStyle=UITableViewCellSelectionStyleNone;
        [cell addSubview:emailSegmentedControl];

        [cell addSubview:Label];
            break;
        }
        case 3:{
            customView=[[UITextView alloc]initWithFrame:CGRectMake(20, 11, 280, 200)];
            customView.text =@"";
          
            NSString* fontName = @"Optima-Italic";
            UIColor* mainColor = [UIColor colorWithRed:50.0/255 green:102.0/255 blue:147.0/255 alpha:1.0f];
            customView.textColor =  mainColor;
            customView.font =  [UIFont fontWithName:fontName size:14.0f];
            
            [cell addSubview:customView];
        }
            
    }

    return cell;
}

#pragma mark - Navigation
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch(indexPath.section)
    {
        case 0:{
           
            [self performSegueWithIdentifier:@"selectCourseNumber" sender:self];
            
            break;
        }
        case 1:{
            [self performSegueWithIdentifier:@"selectCourseNumber" sender:self];
            break;
        }
            
                   
    }

    }


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
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


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if([segue.identifier isEqualToString:@"selectCourseNumber"])
    {
        NSIndexPath *path = [self.tableView indexPathForSelectedRow];
       
        SelectCourseTableViewController *SelectCourseTableViewController = segue.destinationViewController;
        SelectCourseTableViewController.delegate=self;
        SelectCourseTableViewController.command = path;
        
    }

}
-(void) done1:(NSString *)save{
    [self.navigationController popViewControllerAnimated:YES];

    lable1.text=save;
}
-(void) done2:(NSString *)save{
    [self.navigationController popViewControllerAnimated:YES];
    
   
    lable2.text=save;
}


- (IBAction)cancel_Button:(UIBarButtonItem *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)done_Button:(UIBarButtonItem *)sender {
    if (lable1.text.length<=0 &&lable2.text.length<=0) {
        UIAlertView * alertView = [[UIAlertView alloc] initWithTitle: @"Error" message: @"Please put something" delegate: nil cancelButtonTitle: @"OK" otherButtonTitles: nil];
        [alertView show];
    }else{
    NSMutableDictionary* params =[NSMutableDictionary dictionaryWithObjectsAndKeys:
                                  @"AddTradeToList", @"command",
                                   [[API sharedInstance].user objectForKey:@"username"],@"username",
                                  lable1.text, @"have",
                                  lable2.text,@"exchange",
                                  [NSNumber numberWithInteger:emailSegmentedControl.selectedSegmentIndex], @"emailPrivacy",
                                  customView.text,@"note",
                                  [[API sharedInstance].user objectForKey:@"gender"],@"gender",
                                    nil];
    NSLog(@"%@",params);
    
    //make the call to the web API
    [[API sharedInstance] commandWithParams:params
                               onCompletion:^(NSDictionary *json) {
                                   //handle the response
                                   //result returned
                                  
                                   if ([json objectForKey:@"error"]==nil ) {
                                       [self.navigationController popViewControllerAnimated:YES];
                                       
                                   } else {
                                       //error
                                       UIAlertView * alertView = [[UIAlertView alloc] initWithTitle: @"My Error" message: [json objectForKey:@"error"] delegate: nil cancelButtonTitle: @"OK" otherButtonTitles: nil];
                                       [alertView show];
                                       
                                       
                                   }
                                   
                               }];
    
    }

    
}
@end
