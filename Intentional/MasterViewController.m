//
//  MasterViewController.m
//  Intentional
//
//  Created by Brad Grzesiak on 2/4/14.
//  Copyright (c) 2014 Bendyworks Inc. All rights reserved.
//

#import "MasterViewController.h"

#import "PersonProxy.h"
#import "SignUpIntention.h"

@interface MasterViewController () <UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet PersonProxy *personProxy;
@property (strong, nonatomic) IBOutlet SignUpIntention *signUpIntention;
@property (weak, nonatomic) IBOutlet UIButton *saveButton;
@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSString *newString = [textField.text stringByReplacingCharactersInRange:range withString:string];
    self.signUpIntention.email = newString;
    [self emailWasChanged];
    return YES;
}

- (void)emailWasChanged {
    NSError *error = nil;
    BOOL valid = [self.signUpIntention validate:&error];

    if (!valid) {
        NSLog(@"Validation failed: %@", [error localizedDescription]);
    }

    [self.saveButton setEnabled:valid];
}

- (IBAction)saveTapped:(id)sender
{
    NSError *error = nil;
    BOOL saved = [self.signUpIntention save:&error];

    if (!saved) {
        NSLog(@"Save failed: %@", [error localizedDescription]);
        return;
    }

    [self performSegueWithIdentifier:@"advance" sender:self];
}

@end