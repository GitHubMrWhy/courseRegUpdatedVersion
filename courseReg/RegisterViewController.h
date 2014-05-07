//
//  RegisterViewController.h
//  courseReg
//
//  Created by Mingsheng Xu on 9/19/13.
//  Copyright (c) 2013 Mingsheng Xu. All rights reserved.
//

#import <UIKit/UIKit.h>


@class RegisterViewController;



@interface RegisterViewController : UIViewController<UITextFieldDelegate,UIScrollViewDelegate,UIPickerViewDataSource,UIPickerViewDelegate>
{
   
     NSArray *yearArray;
    NSArray *collegeArray;
}
@property (strong, nonatomic) IBOutlet UITextField *username_TextField;
@property (strong, nonatomic) IBOutlet UITextField *password_TextField;
@property (strong, nonatomic) IBOutlet UITextField *email_TextField;
@property (strong, nonatomic) IBOutlet UITextField *year_TextField;
@property (strong, nonatomic) IBOutlet UITextField *college_TextField;
@property (strong, nonatomic) IBOutlet UITextField *realName_TextField;



@property (strong, nonatomic) IBOutlet UIPickerView *college_PickerView;
@property (strong, nonatomic) IBOutlet UIPickerView *year_PickerView;

@property (strong, nonatomic) IBOutlet UISegmentedControl *gender_SegmentedControl;


@property (nonatomic, weak)  IBOutlet UIImageView* profileImageView;


@property (nonatomic, weak) IBOutlet UIView* overlayView;

@property (nonatomic, strong) IBOutlet UIScrollView* scrollView;



@property (nonatomic, weak) IBOutlet UIView* bioContainer;

@property (nonatomic, weak) IBOutlet UIView* functionContainer;

@property (strong, nonatomic) IBOutlet UIButton *signup_Button;



- (IBAction)cancel_Button:(UIBarButtonItem *)sender;
- (IBAction)signup_Button:(UIButton *)sender;
@end
