//
//  RegisterViewController.m
//  courseReg
//
//  Created by Mingsheng Xu on 9/19/13.
//  Copyright (c) 2013 Mingsheng Xu. All rights reserved.
//

#import "RegisterViewController.h"
#import "API.h"
#import "UIAlertView+error.h"
#import <QuartzCore/QuartzCore.h>



@interface RegisterViewController ()

@end

@implementation RegisterViewController

@synthesize username_TextField;
@synthesize password_TextField;
@synthesize email_TextField;
@synthesize realName_TextField;
@synthesize year_TextField;
@synthesize college_TextField;

@synthesize college_PickerView;
@synthesize year_PickerView;

@synthesize gender_SegmentedControl;
@synthesize profileImageView;
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
	// Do any additional setup after loading the view.
    
    
    UIColor* mainColor = [UIColor colorWithRed:50.0/255 green:102.0/255 blue:147.0/255 alpha:1.0f];
    
    NSString* fontName = @"Optima-Italic";
    NSString* boldFontName = @"Optima-ExtraBlack";
    
    [self styleNavigationBarWithFontName:boldFontName];
    
    self.realName_TextField.textColor =  mainColor;
     self.realName_TextField.font =  [UIFont fontWithName:fontName size:14.0f];
    self.realName_TextField.delegate = self;

    self.username_TextField.textColor =  mainColor;
    self.username_TextField.font =  [UIFont fontWithName:fontName size:14.0f];
    self.username_TextField.delegate = self;

    self.password_TextField.textColor =  mainColor;
    self.password_TextField.font =  [UIFont fontWithName:fontName size:14.0f];
    self.password_TextField.delegate = self;

    self.email_TextField.textColor =  mainColor;
    self.email_TextField.font =  [UIFont fontWithName:fontName size:14.0f];
    self.email_TextField.delegate = self;

    
    self.college_TextField.textColor =  mainColor;
    self.college_TextField.font =  [UIFont fontWithName:fontName size:14.0f];
    self.college_TextField.delegate = self;

    
    self.year_TextField.textColor =  mainColor;
    self.year_TextField.font =  [UIFont fontWithName:fontName size:14.0f];
    self.year_TextField.delegate = self;

   [[UISegmentedControl appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontWithName:fontName size:14.0f], UITextAttributeFont, nil] forState:UIControlStateNormal];
    
    UITapGestureRecognizer *singleFingerOne = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                      action:@selector(handleSingleFingerEvent:)];
    singleFingerOne.numberOfTouchesRequired = 1; //手指数
    singleFingerOne.numberOfTapsRequired = 1; //tap次数
    singleFingerOne.delegate= self;
    [self.view addGestureRecognizer:singleFingerOne];
    
    self.profileImageView.image = [UIImage imageNamed:@"default_profile.png"];
    self.profileImageView.contentMode = UIViewContentModeScaleAspectFill;
    self.profileImageView.clipsToBounds = YES;
    self.profileImageView.layer.cornerRadius = 48.0f;
    self.profileImageView.layer.borderWidth = 4.0f;
    self.profileImageView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.profileImageView.userInteractionEnabled = YES;
    [ self.profileImageView addGestureRecognizer:singleFingerOne];
    
    self.scrollView.directionalLockEnabled = YES;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.scrollEnabled=YES;
    self.scrollView.delegate = self;
    self.bioContainer.layer.borderColor = [UIColor colorWithWhite:0.9 alpha:0.7].CGColor;
    self.bioContainer.layer.borderWidth = 1.0f;

    self.functionContainer.layer.borderColor = [UIColor colorWithWhite:0.9 alpha:0.7].CGColor;
    self.functionContainer.layer.borderWidth = 1.0f;
    
    UIColor* imageBorderColor = [UIColor colorWithRed:50.0/255 green:102.0/255 blue:147.0/255 alpha:0.4f];
    UIColor* darkColor = [UIColor colorWithRed:10.0/255 green:78.0/255 blue:108.0/255 alpha:1.0f];
    
    self.signup_Button.backgroundColor = darkColor;
    self.signup_Button.layer.cornerRadius = 3.0f;
    self.signup_Button.titleLabel.font = [UIFont fontWithName:boldFontName size:20.0f];
    [self.signup_Button setTitle:@"SIGN UP" forState:UIControlStateNormal];
    [self.signup_Button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.signup_Button setTitleColor:[UIColor colorWithWhite:1.0f alpha:0.5f] forState:UIControlStateHighlighted];

    // Create done button in UIPickerView

}
-(void)styleNavigationBarWithFontName:(NSString*)navigationTitleFont{
    
    
    CGSize size = CGSizeMake(320, 44);
    UIColor* color = [UIColor colorWithRed:50.0/255 green:102.0/255 blue:147.0/255 alpha:1.0f];
    
    UIGraphicsBeginImageContext(size);
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    CGRect fillRect = CGRectMake(0,0,size.width,size.height);
    CGContextSetFillColorWithColor(currentContext, color.CGColor);
    CGContextFillRect(currentContext, fillRect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    
    UINavigationBar* navAppearance = [UINavigationBar appearance];
    
    
    [navAppearance setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    
    [navAppearance setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                           [UIColor whiteColor], UITextAttributeTextColor,
                                           [UIFont fontWithName:navigationTitleFont size:18.0f], UITextAttributeFont, [NSValue valueWithCGSize:CGSizeMake(0.0, 0.0)], UITextAttributeTextShadowOffset,
                                           nil]];
    //UIImageView* searchView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"search.png"]];
    //searchView.frame = CGRectMake(0, 0, 20, 20);
    
    //UIBarButtonItem* searchItem = [[UIBarButtonItem alloc] initWithCustomView:searchView];
    
    // self.navigationItem.rightBarButtonItem = searchItem;
 
    
    //UIImageView* menuView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"menu.png"]];
    //menuView.frame = CGRectMake(0, 0, 28, 20);
    
    // UIBarButtonItem* menuItem = [[UIBarButtonItem alloc] initWithCustomView:menuView];
    
    //self.navigationItem.leftBarButtonItem = menuItem;
}


- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView

{
    
    return 1;
    
}




- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component

{
    
    if([pickerView isEqual:year_PickerView])
    {
        return [yearArray count];
    }
    if([pickerView isEqual:college_PickerView])
    {
        return [collegeArray count];
    }

    
}


- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component

{
    
    if([pickerView isEqual:year_PickerView])
    {
        return [yearArray objectAtIndex:row];
    }
    if([pickerView isEqual:college_PickerView])
    {
        return [collegeArray objectAtIndex:row];
    }

    
}


- (void) pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component

{
    switch ( pickerView.tag )
    {
        case 0:
        {
            year_TextField.text = [yearArray objectAtIndex:row];

            break;
        }
        case 1:
        {
            college_TextField.text = [collegeArray objectAtIndex:row];

            //處理你要的東西...
            break;
        }
    }
        
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    
    return YES;

}
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if([textField isEqual:password_TextField])
    {
        [self.scrollView setContentOffset:CGPointMake(0, 160)];
        self.scrollView.frame = CGRectMake(0, 0, 320, 240);
    }
    if([textField isEqual:realName_TextField])
    {
        [self.scrollView setContentOffset:CGPointMake(0, 140)];
        self.scrollView.frame = CGRectMake(0, 0, 320, 240);
    }
    if([textField isEqual:college_TextField])
    {
        [self.scrollView setContentOffset:CGPointMake(0, 180)];
        self.scrollView.frame = CGRectMake(0, 0, 320, 260);
        
        collegeArray = [[NSArray alloc] initWithObjects:@"College of Agriculture", @"College of Education",
                     @"College of Engineering", @"College of Health and Human Sciences",@"College of Liberal Arts",@"College of Pharmacy",@"College of Science",@"College of Technology",@"College of Veterinary Medicine",@"Exploratory Studies",@"Krannert School of Management",nil];
        
        college_PickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 43, 320, 400)];
        
        college_PickerView.delegate = self;
        
        college_PickerView.dataSource = self;
        
        [college_PickerView  setShowsSelectionIndicator:YES];
        
        college_TextField.inputView =  college_PickerView  ;
        college_TextField.text = [collegeArray objectAtIndex:0];
        college_PickerView.tag=1;
        
    }
    if([textField isEqual:username_TextField])
    {
        [self.scrollView setContentOffset:CGPointMake(0, 105)];
        self.scrollView.frame = CGRectMake(0, 0, 320, 260);
    }
    if([textField isEqual:email_TextField])
    {
        [self.scrollView setContentOffset:CGPointMake(0, 140)];
        self.scrollView.frame = CGRectMake(0, 0, 320, 260);
    }
    if([textField isEqual:year_TextField])
    {
        [self.scrollView setContentOffset:CGPointMake(0, 180)];
        self.scrollView.frame = CGRectMake(0, 0, 320, 260);
        
        
        yearArray = [[NSArray alloc] initWithObjects:@"Freshman", @"Sophomore",
                          @"Junior", @"Senior",nil];
        
        year_PickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 43, 320, 400)];
        
        year_PickerView.delegate = self;
        
        year_PickerView.dataSource = self;
        
        [year_PickerView  setShowsSelectionIndicator:YES];
        
        year_TextField.inputView =  year_PickerView  ;
        year_TextField.text = [yearArray objectAtIndex:0];

        year_PickerView.tag=0;
       
                   }
   

}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
        self.scrollView.frame = CGRectMake(0, 0, 320, 700);
     [self.scrollView setContentOffset:CGPointMake(0, 0)];
    [textField resignFirstResponder];
  
    return YES;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


// It is important for you to hide kwyboard



- (void)viewDidLayoutSubviews {
    self.scrollView.contentSize = CGSizeMake(320, 700);
}


- (IBAction)cancel_Button:(UIBarButtonItem *)sender {
[self dismissViewControllerAnimated:YES completion:nil];
   
}

- (void)handleSingleFingerEvent:(UITapGestureRecognizer *)sender{
	if(sender.numberOfTapsRequired == 1) {
      	//单指单击
        NSLog(@"单指单击");
        
        [[[UIActionSheet alloc] initWithTitle:nil
                                     delegate:self
                            cancelButtonTitle:@"Close"
                       destructiveButtonTitle:nil
                            otherButtonTitles:@"Take photo", @"Upload From photos",nil]
         showInView:self.view];
    }
}

- (IBAction)signup_Button:(UIButton *)sender {
    NSLog(@"%d",gender_SegmentedControl.selectedSegmentIndex);
    
     NSLog(@"%@",year_TextField.text);
    NSLog(@"%@",college_TextField.text);
    NSString* command = @"register";
    BOOL result;
	
	result = [self checkVaildInput];
    if (result == TRUE) {
		
	NSLog(@"true");
    
        NSMutableDictionary* params =[NSMutableDictionary dictionaryWithObjectsAndKeys:
                                  command, @"command",
                                  username_TextField.text, @"username",
                                   realName_TextField.text,@"fullName",
                                  password_TextField.text, @"password",
                                  email_TextField.text,@"email",
                                  year_TextField.text, @"year",
                                  college_TextField.text, @"college",
                                  [NSNumber numberWithInteger:gender_SegmentedControl.selectedSegmentIndex],@"gender",
                                UIImageJPEGRepresentation( self.profileImageView.image,250),@"file",
                                       @"",@"bio",
                                  nil];
        NSLog(@"%@",params);

        //make the call to the web API
        [[API sharedInstance] commandWithParams:params
                                   onCompletion:^(NSDictionary *json) {
                                       //handle the response
                                       //result returned
                                       NSDictionary* res = [[json objectForKey:@"result"] objectAtIndex:0];
                                       if ([json objectForKey:@"error"]==nil && [[res objectForKey:@"userID"] intValue] >= 0) {
                                           //success
                                           [[API sharedInstance] setUser: res];
                                           
                                           //show message to the user
                                           username_TextField.text=@"";
                                           realName_TextField.text=@"";
                                           password_TextField.text= @"";
                                           email_TextField.text=@"";
                                           year_TextField.text=@"";
                                           college_TextField.text=@"";
                                           
                                           UIAlertView * alertView = [[UIAlertView alloc] initWithTitle: @"My Error" message: @"Please verify your email" delegate: nil cancelButtonTitle: @"OK" otherButtonTitles: nil];
                                           [alertView show];

                                            [self performSegueWithIdentifier:@"RegisterToMain"sender:self];
                                           
                                            } else {
                                           //error
                                           UIAlertView * alertView = [[UIAlertView alloc] initWithTitle: @"My Error" message: [json objectForKey:@"error"] delegate: nil cancelButtonTitle: @"OK" otherButtonTitles: nil];
                                           [alertView show];
                                           
                                           
                                       }
                                       
                                   }];
        

        
    } else {
		NSLog(@"false");
	}

   
}
-(BOOL)checkVaildInput{
    if ([username_TextField.text isEqualToString:@""]) {
        UIAlertView * alertView = [[UIAlertView alloc] initWithTitle: @"Error" message: @"Please fill the User Name" delegate: nil cancelButtonTitle: @"OK" otherButtonTitles: nil];
        [alertView show];
           return NO;
    }
    else if (password_TextField.text.length >40) {
        UIAlertView * alertView = [[UIAlertView alloc] initWithTitle: @"Error" message: @"User Name too long" delegate: nil cancelButtonTitle: @"OK" otherButtonTitles: nil];
        [alertView show];
           return NO;
    }
    else if ([realName_TextField.text isEqualToString:@""]) {
        UIAlertView * alertView = [[UIAlertView alloc] initWithTitle: @"Error" message: @"Please fill the Real Name" delegate: nil cancelButtonTitle: @"OK" otherButtonTitles: nil];
        [alertView show];
           return NO;
    }
    else if (password_TextField.text.length < 6 ) {
        UIAlertView * alertView = [[UIAlertView alloc] initWithTitle: @"Error" message: @"Password need at least 6 Charaters" delegate: nil cancelButtonTitle: @"OK" otherButtonTitles: nil];
        [alertView show];
           return NO;
        
    }
    else if (password_TextField.text.length >=12 ) {
        UIAlertView * alertView = [[UIAlertView alloc] initWithTitle: @"Error" message: @"Password too long" delegate: nil cancelButtonTitle: @"OK" otherButtonTitles: nil];
        [alertView show];
        return NO;
    }
    else if (email_TextField.text.length==0){
        UIAlertView * alertView = [[UIAlertView alloc] initWithTitle: @"Error" message: @"Please fill the Email" delegate: nil cancelButtonTitle: @"OK" otherButtonTitles: nil];
        [alertView show];
        return NO;
        
    }else if (email_TextField.text.length>0){
       
        NSString *expression = @"^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}$"; // Edited: added ^ and $
        NSError *error = NULL;
        
        NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:expression options:NSRegularExpressionCaseInsensitive error:&error];
        
        NSTextCheckingResult *match = [regex firstMatchInString:email_TextField.text options:0 range:NSMakeRange(0, email_TextField.text.length)];
        
        if (!match){
            UIAlertView * alertView = [[UIAlertView alloc] initWithTitle: @"Error" message: @"This is not a valid email address" delegate: nil cancelButtonTitle: @"OK" otherButtonTitles: nil];
            [alertView show];
            return NO;
        }
    }

    return YES;
    
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    switch (buttonIndex) {
        case 0:
            [self takePhoto]; break;
        case 1:
            [self pickPhoto]; break;
            
    }
}

-(void)takePhoto {
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
#if TARGET_IPHONE_SIMULATOR
    imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
#else
    imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
#endif
    imagePickerController.editing = YES;
    imagePickerController.delegate = (id)self;
    
    [self presentModalViewController:imagePickerController animated:YES];
}

-(void) pickPhoto{
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    imagePickerController.editing = YES;
    imagePickerController.delegate = (id)self;
    
    [self presentModalViewController:imagePickerController animated:YES];
    
}
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    // Resize the image from the camera
    /*UIImage *scaledImage = [image resizedImageWithContentMode:UIViewContentModeScaleAspectFill bounds:CGSizeMake(photo.frame.size.width, photo.frame.size.height) interpolationQuality:kCGInterpolationHigh];
     // Crop the image to a square (yikes, fancy!)
     UIImage *croppedImage = [scaledImage croppedImage:CGRectMake((scaledImage.size.width -photo.frame.size.width)/2, (scaledImage.size.height -photo.frame.size.height)/2, photo.frame.size.width, photo.frame.size.height)];
     // Show the photo on the screen*/
    profileImageView.image = image;
    [picker dismissModalViewControllerAnimated:NO];
    
    
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissModalViewControllerAnimated:NO];
    
}



@end
