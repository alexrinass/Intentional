//
//  EnterEmailIntention.h
//  Intentional
//
//  Created by Brad Grzesiak on 2/4/14.
//  Copyright (c) 2014 Bendyworks Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SignUpIntention : NSObject
@property (nonatomic) NSString *email;

- (BOOL)validate:(NSError * __autoreleasing *)error;
- (IBAction)saveTapped:(id)sender;

@end
