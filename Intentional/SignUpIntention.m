//
//  EnterEmailIntention.m
//  Intentional
//
//  Created by Brad Grzesiak on 2/4/14.
//  Copyright (c) 2014 Bendyworks Inc. All rights reserved.
//

#import "SignUpIntention.h"
#import "PersonProxy.h"

@interface SignUpIntention () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet PersonProxy *personProxy;
@end

@implementation SignUpIntention

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSString *newString = [textField.text stringByReplacingCharactersInRange:range withString:string];
    [self.personProxy.person setValue:newString forKey:@"email"];
    return YES;
}

- (IBAction)saveTapped:(id)sender {
    [self.personProxy.person.managedObjectContext save:nil];
}

@end