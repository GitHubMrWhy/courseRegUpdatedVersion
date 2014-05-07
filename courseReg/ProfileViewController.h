//
//  ProfileViewController.h
//  courseReg
//
//  Created by Mingsheng Xu on 14-4-30.
//  Copyright (c) 2014年 Mingsheng Xu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProfileViewController : UIViewController<UIImagePickerControllerDelegate, UIActionSheetDelegate,UITextFieldDelegate>

{
    UIScrollView* scrollView;
    UITapGestureRecognizer *singleFingerOne;
    UITapGestureRecognizer *dismissKeyboard;
}
- (IBAction)updateBio:(UITextField *)sender;

@property (nonatomic, weak) IBOutlet UIImageView* profileBgImageView;

@property (nonatomic, weak)  IBOutlet UIImageView* profileImageView;
@property (nonatomic, weak) IBOutlet UILabel* realNameLabel;

@property (nonatomic, weak) IBOutlet UILabel* usernameLabel;

@property (nonatomic, weak) IBOutlet UIView* overlayView;

@property (nonatomic, strong) IBOutlet UIScrollView* scrollView;

@property (strong, nonatomic) IBOutlet UITextField *bioTextField;


@property (nonatomic, weak) IBOutlet UILabel* collegeLable;

@property (nonatomic, weak) IBOutlet UILabel* yearLable;

@property (nonatomic, weak) IBOutlet UIView* bioContainer;

@property (nonatomic, weak) IBOutlet UIView* functionContainer;

@property (strong, nonatomic) IBOutlet UIButton *logout_Button;
- (IBAction)logoutButton_press:(UIButton *)sender;


@end
