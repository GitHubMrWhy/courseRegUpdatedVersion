//
//  SelectCourseTableViewController.m
//  courseReg
//
//  Created by Mingsheng Xu on 14-5-2.
//  Copyright (c) 2014年 Mingsheng Xu. All rights reserved.
//

#import "SelectCourseTableViewController.h"
#import "NewTradeItemTableViewController.h"

@interface SelectCourseTableViewController ()
@property (nonatomic, strong) NSArray* settingTitles;

@property (nonatomic, strong) NSArray* settingsElements;

@property (nonatomic, strong) NSArray* sectionHeader;

@property (nonatomic, strong) NSString* boldFontName;

@property (nonatomic, strong) UIColor* onColor;

@property (nonatomic, strong) UIColor* offColor;

@property (nonatomic, strong) UIColor* dividerColor;



@end

@implementation SelectCourseTableViewController
@synthesize subjectTextField;
@synthesize numberTextField;
@synthesize crnTextField;
@synthesize subject_PickerView;
@synthesize delegate;

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
    
    
    NSString* fontName = @"Optima-Italic";
    NSString* boldFontName = @"Optima-ExtraBlack";
    UIColor* mainColor = [UIColor colorWithRed:50.0/255 green:102.0/255 blue:147.0/255 alpha:1.0f];
    
    
    self.subjectTextField.textColor =  mainColor;
    self.subjectTextField.font =  [UIFont fontWithName:fontName size:14.0f];
    self.subjectTextField.delegate = self;

    
    self.navigationController.title = @"Settings";
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, 568) style:UITableViewStyleGrouped];
    self.tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.backgroundView = nil;
    
    
    self.tableView.backgroundColor = [UIColor colorWithRed:231.0/255 green:235.0/255 blue:238.0/255 alpha:1.0f];
    self.tableView.separatorColor = [UIColor clearColor];
    
   
    
    self.sectionHeader = [NSArray arrayWithObjects:@"Subject", @"Course Number",@"CRN",  nil];
    //NSLog(@"%ld",(long)self.command.section);
    
    subjectArray = [[NSArray alloc] initWithObjects:
                    @"AAE-Aero & Astro Engineering",
                    @"AAS-African American Studies",
                    @"ABE-Agri & Biol Engineering",
                    @"AD-Art & Design",
                    @"AFT-Aerospace Studies",
                    @"AGEC-Agricultural Economics",
                    @"AGR-Agriculture",
                    @"AGRY-Agronomy",
                    @"AMST-American Studies",
                    @"ANSC-Animal Sciences",
                    @"ANTH-Anthropology",
                    @"ARAB-Arabic",
                    @"ASAM-Asian American Studies",
                    @"ASL-American Sign Language",
                    @"ASM-Agricultural Systems Mgmt",
                    @"ASTR-Astronomy",
                    @"AT-Aviation Technology",
                    @"BAND-Bands",
                    @"BCHM-Biochemistry",
                    @"BCM-Bldg Construct Mgmt Tech",
                    @"BIOL-Biological Sciences",
                    @"BME-Biomedical Engineering",
                    @"BMS-Basic Medical Sciences",
                    @"BTNY-Botany & Plant Pathology",
                    @"CAND-Candidate",
                    @"CE-Civil Engineering",
                    @"CEM-Construction Engr & Mgmt",
                    @"CGT-Computer Graphics Tech",
                    @"CHE-Chemical Engineering",
                    @"CHM-Chemistry",
                    @"CHNS-Chinese",
                    @"CLCS-Classics",
                    @"CLPH-Clinical Pharmacy",
                    @"CMPL-Comparative Literature",
                    @"CNIT-Computer & Info Tech",
                    @"COM-Communication",
                    @"CPB-Comparative Pathobiology",
                    @"CS-Computer Sciences",
                    @"CSR-Consumer ScI & Retailing",
                    @"DANC-Dance",
                    @"EAPS-Earth Atmos Planetary Sci",
                    @"ECE-Electrical & Computer Engr",
                    @"ECET-Electrical&Comp Engr Tech",
                    @"ECON-Economics",
                    @"EDCI-Educ-Curric & Instruction",
                    @"EDPS-Educ-Ed'l and Psy Studies",
                    @"EDST-Ed Leadrship&Cultrl Fnd",
                    @"EEE-Environ & Ecological Engr",
                    @"ENE-Engineering Education",
                    @"ENGL-English",
                    @"ENGR-Engineering",
                    @"ENTM-Entomology",
                    @"ENTR-Entrepreneurship",
                    @"EPCS-Engr Proj Cmity Service",
                    @"EXPL-Exploratory Studies",
                    @"FNR-Forestry&Natural Resources",
                    @"FR-French",
                    @"FS-Food Science",
                    @"FVS-Film And Video Studies",
                    @"GEP-Global Engineering Program",
                    @"GER-German",
                    @"GRAD-Graduate Studies",
                    @"GREK-Greek",
                    @"GS-General Studies",
                    @"HDFS-Human Dev &Family Studies",
                    @"HEBR-Hebrew",
                    @"HHS-College Health & Human Sci",
                    @"HIST-History",
                    @"HK-Health And Kinesiology",
                    @"HONR-Honors",
                    @"HORT-Horticulture",
                    @"HSCI-Health Sciences",
                    @"HTM-Hospitality & Tourism Mgmt",
                    @"IDE-Interdisciplinary Engr",
                    @"IDIS-Interdisciplinary Studies",
                    @"IE-Industrial Engineering",
                    @"IET-Industrial Engr Technology",
                    @"IPPH-Industrial & Phys Pharm",
                    @"IT-Industrial Technology",
                    @"ITAL-Italian",
                    @"JPNS-Japanese",
                    @"LA-Landscape Architecture",
                    @"LALS-Latina Am&Latino Studies",
                    @"LATN-Latin",
                    @"LC-Languages and Cultures",
                    @"LING-Linguistics",
                    @"MA-Mathematics",
                    @"MARS-Medieval &Renaissance Std",
                    @"MCMP-Med Chem &Molecular Pharm",
                    @"ME-Mechanical Engineering",
                    @"MET-Mechanical Engr Tech",
                    @"MFET-Manufacturing Engr Tech",
                    @"MGMT-Management",
                    @"MSE-Materials Engineering",
                    @"MSL-Military Science & Ldrshp",
                    @"MUS-Music History & Theory",
                    @"NRES-Natural Res & Environ Sci",
                    @"NS-Naval Science",
                    @"NUCL-Nuclear Engineering",
                    @"NUPH-Nuclear Pharmacy",
                    @"NUR-Nursing",
                    @"NUTR-Nutrition Science",
                    @"OBHR-Orgnztnl Bhvr &Hum Resrce",
                    @"OLS-Organiz Ldrshp&Supervision",
                    @"PES-Physical Education Skills",
                    @"PHAD-Pharmacy Administration",
                    @"PHIL-Philosophy",
                    @"PHPR-Pharmacy Practice",
                    @"PHRM-Pharmacy",
                    @"PHYS-Physics",
                    @"POL-Political Science",
                    @"PSY-Psychology",
                    @"PTGS-Portuguese",
                    @"REL-Religious Studies",
                    @"RUSS-Russian",
                    @"SA-Study Abroad",
                    @"SCI-General Science",
                    @"SLHS-Speech, Lang&Hear Science",
                    @"SOC-Sociology",
                    @"SPAN-Spanish",
                    @"STAT-Statistics",
                    @"TECH-Technology",
                    @"THTR-Theatre",
                    @"TLI-Technology Ldrshp Innovatn",
                    @"VCS-Veterinary Clinical Sci",
                    @"VM-Veterinary Medicine",
                    @"WGSS-Women Gend&Sexuality Std",
                    @"YDAE-Youth Develop & Ag Educ",
                    nil];
    subjectSubArray = [[NSArray alloc] initWithObjects:
                    @"AAE",
                    @"AAS",
                    @"ABE",
                    @"AD",
                    @"AFT",
                    @"AGEC",
                    @"AGR",
                    @"AGRY",
                    @"AMST",
                    @"ANSC",
                    @"ANTH",
                    @"ARAB",
                    @"ASAM",
                    @"ASL",
                    @"ASM",
                    @"ASTR",
                    @"AT",
                    @"BAND",
                    @"BCHM",
                    @"BCM",
                    @"BIOL",
                    @"BME",
                    @"BMS",
                    @"BTNY",
                    @"CAND",
                    @"CE",
                    @"CEM",
                    @"CGT",
                    @"CHE",
                    @"CHM",
                    @"CHNS",
                    @"CLCS",
                    @"CLPH",
                    @"CMPL",
                    @"CNIT",
                    @"COM",
                    @"CPB",
                    @"CS",
                    @"CSR",
                    @"DANC",
                    @"EAPS",
                    @"ECE",
                    @"ECET",
                    @"ECON",
                    @"EDCI",
                    @"EDPS",
                    @"EDST",
                    @"EEE",
                    @"ENE",
                    @"ENGL",
                    @"ENGR",
                    @"ENTM",
                    @"ENTR",
                    @"EPCS",
                    @"EXPL",
                    @"FNR",
                    @"FR",
                    @"FS",
                    @"FVS",
                    @"GEP",
                    @"GER",
                    @"GRAD",
                    @"GREK",
                    @"GS",
                    @"HDFS",
                    @"HEBR",
                    @"HHS",
                    @"HIST",
                    @"HK",
                    @"HONR",
                    @"HORT",
                    @"HSCI",
                    @"HTM",
                    @"IDE",
                    @"IDIS",
                    @"IE",
                    @"IET",
                    @"IPPH",
                    @"IT",
                    @"ITAL",
                    @"JPNS",
                    @"LA",
                    @"LALS",
                    @"LATN",
                    @"LC",
                    @"LING",
                    @"MA",
                    @"MARS",
                    @"MCMP",
                    @"ME",
                    @"MET",
                    @"MFET",
                    @"MGMT",
                    @"MSE",
                    @"MSL",
                    @"MUS",
                    @"NRES",
                    @"NS",
                    @"NUCL",
                    @"NUPH",
                    @"NUR",
                    @"NUTR",
                    @"OBHR",
                    @"OLS",
                    @"PES",
                    @"PHAD",
                    @"PHIL",
                    @"PHPR",
                    @"PHRM",
                    @"PHYS",
                    @"POL",
                    @"PSY",
                    @"PTGS",
                    @"REL",
                    @"RUSS",
                    @"SA",
                    @"SCI",
                    @"SLHS",
                    @"SOC",
                    @"SPAN",
                    @"STAT",
                    @"TECH",
                    @"THTR",
                    @"TLI",
                    @"VCS",
                    @"VM",
                    @"WGSS",
                    @"YDAE",
                      nil];
    //NSLog(@"%lu",(unsigned long)[subjectArray count]);
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
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 0;
}
*/

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)thePickerView {
    
    return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component

{
    
    if([pickerView isEqual:subject_PickerView])
    {
        return [subjectArray count];
    }
    
}


- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component

{
    
    if([pickerView isEqual:subject_PickerView])
    {
        return [subjectArray objectAtIndex:row];
    }
   
    
    
}


- (void) pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component

{
    switch ( pickerView.tag )
    {
        case 0:
        {
            subjectTextField.text = [subjectArray objectAtIndex:row];
            
            break;
        }
        
    }
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    
    return YES;
    
}
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
        if([textField isEqual:subjectTextField])
    {
        
        
        subject_PickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 43, 320, 400)];
        
        subject_PickerView.delegate = self;
        
        subject_PickerView.dataSource = self;
        
        [subject_PickerView  setShowsSelectionIndicator:YES];
        
        subjectTextField.inputView =  subject_PickerView  ;
        subjectTextField.text = [subjectArray objectAtIndex:0];
        subject_PickerView.tag=0;
        
    }
    
    
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
   
    [textField resignFirstResponder];
    
    return YES;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section==0) {
        return 40;
    }
    return 30;
}

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

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

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


// In a story board-based application, you will often want to do a little preparation before navigation
- (IBAction)cancel_Button:(UIBarButtonItem *)sender {
       [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)done_Button:(UIBarButtonItem *)sender {
    if(subjectTextField.text.length<=0 || numberTextField.text.length<=0 ||crnTextField.text.length <=0){
        UIAlertView * alertView = [[UIAlertView alloc] initWithTitle: @"Error" message: @"Please fill all the blank" delegate: nil cancelButtonTitle: @"OK" otherButtonTitles: nil];
        [alertView show];
            
    
    }else {
    
    if (self.command.section==0) {
        NSString *subject=  [subjectSubArray objectAtIndex:[subjectArray indexOfObject:subjectTextField.text]];
        
        NSString *data=[NSString stringWithFormat:@"%@ %@ CRN:%@", subject, numberTextField.text,crnTextField.text];
        [self.delegate done1:data];
    }
    if (self.command.section==1) {
        NSString *subject=  [subjectSubArray objectAtIndex:[subjectArray indexOfObject:subjectTextField.text]];
        
        NSString *data=[NSString stringWithFormat:@"%@ %@ CRN:%@", subject, numberTextField.text ,crnTextField.text];
        [self.delegate done2:data];

    }
    
    }
    //NSLog(@"%@ setc", object2.Label1.text);
   // NSLog(@"%@ setc",subjectTextField.text);
   
    
    //[self.navigationController popViewControllerAnimated:YES];
}

@end
