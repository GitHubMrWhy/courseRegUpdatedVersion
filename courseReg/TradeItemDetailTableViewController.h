//
//  TradeItemDetailTableViewController.h
//  courseReg
//
//  Created by Mingsheng Xu on 9/29/13.
//  Copyright (c) 2013 Mingsheng Xu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TradeItemDetailTableViewController : UITableViewController


@property(strong,nonatomic) NSDictionary *tempDictionary;
@property(strong,nonatomic) NSDictionary *info;

@property (strong, nonatomic) IBOutlet UITextView *noteTextView;

@property (nonatomic, strong) UILabel *lable2;;
@end
