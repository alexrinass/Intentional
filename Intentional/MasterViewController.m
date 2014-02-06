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

static NSDictionary *affordances = nil;

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    affordances =
        @{NSManagedObjectContextDidSaveNotification: @"personWasSaved:"};

    for (NSString *key in affordances)
        [self observe:key andPerform:affordances[key]];
}

- (void)observe:(NSString *)notification
     andPerform:(NSString *)selectorName {
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:NSSelectorFromString(selectorName)
                                                 name:notification
                                               object:self.managedObjectContext];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSString *newString = [textField.text stringByReplacingCharactersInRange:range withString:string];
    self.signUpIntention.email = newString;
    [self emailWasChanged];
    return YES;
}

- (void)emailWasChanged {
    [self setEnabledStateForSaveButton];
}

- (void)setEnabledStateForSaveButton {
    NSError *error = nil;
    BOOL valid = [self.signUpIntention validate:&error];

    if (!valid) {
        NSLog(@"Validation failed: %@", [error localizedFailureReason]);
    }

    [self.saveButton setEnabled:valid];
}

- (void)personWasSaved:(NSNotification *)note {
    [self performSegueWithIdentifier:@"advance" sender:note];
}

@end