//
//  MasterViewController.h
//  Intentional
//
//  Created by Brad Grzesiak on 2/4/14.
//  Copyright (c) 2014 Bendyworks Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@class PersonProxy;
@class SignUpIntention;
@interface MasterViewController : UIViewController <UITextFieldDelegate>
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong, nonatomic) IBOutlet PersonProxy *personProxy;
@property (weak, nonatomic) IBOutlet SignUpIntention *signUpIntention;
@property (weak, nonatomic) IBOutlet UIButton *saveButton;

- (IBAction)saveTapped:(id)sender;

@end