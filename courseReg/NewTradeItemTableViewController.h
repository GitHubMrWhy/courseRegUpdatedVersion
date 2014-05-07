//
//  NewTradeItemTableViewController.h
//  courseReg
//
//  Created by Mingsheng Xu on 14-5-1.
//  Copyright (c) 2014年 Mingsheng Xu. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "SelectCourseTableViewController.h"

@interface NewTradeItemTableViewController : UITableViewController <SelectCourseTableViewControllerDelegate>
- (IBAction)done_Button:(id)sender;

- (IBAction)cancel_Button:(id)sender;

@property (weak, nonatomic)    NSString *haveString;
@property (weak, nonatomic)    NSString *exchangeString;

@property (strong, nonatomic) IBOutlet UILabel *emailLabel;
@property (strong, nonatomic) IBOutlet UISegmentedControl *emailSegmentedControl;

@property (strong, nonatomic) IBOutlet UIView *emailView;

@property (nonatomic,strong) UILabel* lable1;
@property (nonatomic,strong) UILabel* lable2;
@property (nonatomic,strong) UITextView* customView;
@end
