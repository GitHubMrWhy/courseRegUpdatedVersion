//
//  LoginScreenViewController.m
//  courseReg
//
//  Created by Mingsheng Xu on 9/18/13.
//  Copyright (c) 2013 Mingsheng Xu. All rights reserved.
//

#import "LoginScreenViewController.h"
#import "API.h"

@interface LoginScreenViewController ()

@end

@implementation LoginScreenViewController
@synthesize username_TextField;
@synthesize password_TextField;
@synthesize login_Button;
@synthesize reg_Button;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //focus on the username field / show keyboard
   
    [username_TextField becomeFirstResponder];
	// Do any additional setup after loading the view.
    UIColor* mainColor = [UIColor colorWithRed:47.0/255 green:168.0/255 blue:228.0/255 alpha:1.0f];
    UIColor* darkColor = [UIColor colorWithRed:10.0/255 green:78.0/255 blue:108.0/255 alpha:1.0f];
    
    NSString* fontName = @"Optima-Italic";
    NSString* boldFontName = @"Optima-ExtraBlack";
    
    self.view.backgroundColor = mainColor;
    
    self.username_TextField.backgroundColor = [UIColor whiteColor];
    self.username_TextField.layer.cornerRadius = 3.0f;
    self.username_TextField.placeholder = @"Username";
    self.username_TextField.leftViewMode = UITextFieldViewModeAlways;
    UIView* leftView1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
    self.username_TextField.leftView = leftView1;
    self.username_TextField.font = [UIFont fontWithName:fontName size:16.0f];
    
    
    self.password_TextField.backgroundColor = [UIColor whiteColor];
    self.password_TextField.layer.cornerRadius = 3.0f;
    self.password_TextField.placeholder = @"Password";
    self.password_TextField.leftViewMode = UITextFieldViewModeAlways;
    UIView* leftView2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
    self.password_TextField.leftView = leftView2;
    self.password_TextField.font = [UIFont fontWithName:fontName size:16.0f];
    self.password_TextField.secureTextEntry=YES;
    
    self.login_Button.backgroundColor = darkColor;
    self.login_Button.layer.cornerRadius = 3.0f;
    self.login_Button.titleLabel.font = [UIFont fontWithName:boldFontName size:20.0f];
    [self.login_Button setTitle:@"LOGIN HERE" forState:UIControlStateNormal];
    [self.login_Button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.login_Button setTitleColor:[UIColor colorWithWhite:1.0f alpha:0.5f] forState:UIControlStateHighlighted];
    
    self.reg_Button.backgroundColor = [UIColor clearColor];
    self.reg_Button.titleLabel.font = [UIFont fontWithName:fontName size:12.0f];
    [self.reg_Button setTitle:@"Sign Up for MyPurdue Assistance" forState:UIControlStateNormal];
    [self.reg_Button setTitleColor:darkColor forState:UIControlStateNormal];
    [self.reg_Button setTitleColor:[UIColor colorWithWhite:1.0 alpha:0.5] forState:UIControlStateHighlighted];


  
}



- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}


- (void)didReceiveMemoryWarning
{
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (IBAction)login_Click:(UIButton *)sender {
    NSString* command = @"login";
    NSMutableDictionary* params =[NSMutableDictionary dictionaryWithObjectsAndKeys:
                                 command, @"command",
                                  username_TextField.text, @"username",
                                  password_TextField.text, @"password",
                                  nil];
    //make the call to the web API
    [[API sharedInstance] commandWithParams:params
                               onCompletion:^(NSDictionary *json) {
                                   //handle the response
                                   //result returned
                                   
                                   NSDictionary* res = [[json objectForKey:@"result"] objectAtIndex:0];
                                   NSLog(@"%@",json);
                                   if ([json objectForKey:@"error"]==nil && [[res objectForKey:@"userID"] intValue] >= 0) {
                                       //success
                                       [[API sharedInstance] setUser: res];
                                       [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
                                       //show message to the user
                                    [self performSegueWithIdentifier:@"LoginToMain"sender:self];
                                       if ([[res objectForKey:@"valid"]intValue] ==0) {
                                           UIAlertView * alertView = [[UIAlertView alloc] initWithTitle: @"My Error" message: @"Please verify your email " delegate: nil cancelButtonTitle: @"OK" otherButtonTitles: nil];
                                           [alertView show];
                                       }
                                       username_TextField.text=@"";
                                       password_TextField.text=@"";

                                   } else {
                                       //error
                                       UIAlertView * alertView = [[UIAlertView alloc] initWithTitle: @"My Error" message: [json objectForKey:@"error"] delegate: nil cancelButtonTitle: @"OK" otherButtonTitles: nil];
                                       [alertView show];
                                       
                                       
                                   }
                                   
                               }];
}
-(void)dismissAlertView:(UIAlertView *)alertView{
    [alertView dismissWithClickedButtonIndex:0 animated:YES];
}

- (IBAction)reg_Click:(UIButton *)sender {
    
     [self performSegueWithIdentifier:@"LoginToRegister"sender:self];
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
    username_TextField.text=@"";
    password_TextField.text=@"";
   }


@end

