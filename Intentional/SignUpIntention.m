//
//  EnterEmailIntention.m
//  Intentional
//
//  Created by Brad Grzesiak on 2/4/14.
//  Copyright (c) 2014 Bendyworks Inc. All rights reserved.
//

#import "SignUpIntention.h"
#import "PersonProxy.h"

@interface SignUpIntention () 
@property (weak, nonatomic) IBOutlet PersonProxy *personProxy;
@end

@implementation SignUpIntention

- (BOOL)validate:(NSError *__autoreleasing *)error
{
    [self.personProxy.person setValue:self.email forKey:@"email"];
    BOOL valid = [self.personProxy.person validateForInsert:error];
    return valid;
}

- (BOOL)save:(NSError *__autoreleasing *)error {
    return [self.personProxy.person.managedObjectContext save:error];
}

@end
