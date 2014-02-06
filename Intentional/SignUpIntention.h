//
//  EnterEmailIntention.h
//  Intentional
//
//  Created by Brad Grzesiak on 2/4/14.
//  Copyright (c) 2014 Bendyworks Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SignUpIntention : NSObject

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string;
- (IBAction)saveTapped:(id)sender;

@end
