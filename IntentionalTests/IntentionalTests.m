//
//  IntentionalTests.m
//  IntentionalTests
//
//  Created by Brad Grzesiak on 2/4/14.
//  Copyright (c) 2014 Bendyworks Inc. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SignUpIntention.h"
#import "PersonProxy.h"

@interface IntentionalTests : XCTestCase

@end

@implementation IntentionalTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testSignUpIntention
{
    SignUpIntention *signUpIntention = [SignUpIntention new];
    signUpIntention.personProxy = nil; // We would need a core data stack here...
    signUpIntention.email = @"info@example.com";

    NSError *error;
    BOOL validatate = [signUpIntention validate:&error];
    XCTAssertTrue(validatate, @"%@", error);
}

@end
