//
//  CourseListTableViewController.h
//  courseReg
//
//  Created by Mingsheng Xu on 9/28/13.
//  Copyright (c) 2013 Mingsheng Xu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CourseListTableViewController : UITableViewController


@property (strong, nonatomic) NSMutableArray *courseListData;
@property(strong,nonatomic)NSDictionary *courseListJson;

- (IBAction)addCourseItem_Press:(UIBarButtonItem *)sender;


@end
