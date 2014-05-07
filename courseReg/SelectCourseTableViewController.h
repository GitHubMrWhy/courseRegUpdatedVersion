//
//  SelectCourseTableViewController.h
//  courseReg
//
//  Created by Mingsheng Xu on 14-5-2.
//  Copyright (c) 2014年 Mingsheng Xu. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SelectCourseTableViewController;
@protocol SelectCourseTableViewControllerDelegate

-(void) done1:(NSString*) save;
-(void) done2:(NSString*) save;
@end


@interface SelectCourseTableViewController : UITableViewController<UITextFieldDelegate,UIScrollViewDelegate,UIPickerViewDataSource,UIPickerViewDelegate>
{
 
    NSArray *subjectArray;
    NSArray *subjectSubArray;
    }

@property (nonatomic, assign) id <SelectCourseTableViewControllerDelegate> delegate;

- (IBAction)done_Button:(id)sender;

- (IBAction)cancel_Button:(id)sender;

@property (weak, nonatomic)          NSIndexPath *command;

@property (strong, nonatomic) IBOutlet UITextField *subjectTextField;

@property (strong, nonatomic) IBOutlet UITextField *numberTextField;
@property (strong, nonatomic) IBOutlet UITextField *crnTextField;
@property (strong, nonatomic) IBOutlet UIPickerView *subject_PickerView;

@end
