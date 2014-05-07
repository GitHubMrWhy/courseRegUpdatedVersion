//
//  LoginScreenViewController.h
//  courseReg
//
//  Created by Mingsheng Xu on 9/18/13.
//  Copyright (c) 2013 Mingsheng Xu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "API.h"




@interface LoginScreenViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *username_TextField;
@property (strong, nonatomic) IBOutlet UITextField *password_TextField;
@property (strong, nonatomic) IBOutlet UIButton *login_Button;
@property (strong, nonatomic) IBOutlet UIButton *reg_Button;

- (IBAction)login_Click:(UIButton *)sender;
- (IBAction)reg_Click:(UIButton *)sender;




@end
