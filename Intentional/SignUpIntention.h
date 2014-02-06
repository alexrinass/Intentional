//
//  EnterEmailIntention.h
//  Intentional
//
//  Created by Brad Grzesiak on 2/4/14.
//  Copyright (c) 2014 Bendyworks Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PersonProxy;
@interface SignUpIntention : NSObject
@property (weak, nonatomic) IBOutlet PersonProxy *personProxy;
@property (nonatomic) NSString *email;

- (BOOL)validate:(NSError * __autoreleasing *)error;
- (BOOL)save:(NSError * __autoreleasing *)error;

@end
