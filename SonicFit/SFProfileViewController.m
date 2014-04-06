//
//  SFProfileViewController.m
//  SonicFit
//
//  Created by Nihar Mehta on 1/26/14.
//  Copyright (c) 2014 FUHSD. All rights reserved.
//

#import "SFProfileViewController.h"

@interface SFProfileViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *emailField;

@end

@implementation SFProfileViewController

- (IBAction)doneEditing:(id)sender
{
    [self.view endEditing:YES];
}

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
    
    // Do any additional setup after loading the view from its nib.
    self.nameField.text = @"Prachi Mehta";
    self.emailField.text = @"prachi.mehta@gmail.com";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
