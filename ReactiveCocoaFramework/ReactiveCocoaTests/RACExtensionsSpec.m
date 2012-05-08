//
//  RACExtensions.m
//  ReactiveCocoa
//
//  Created by Brian King on 5/6/12.
//  Copyright (c) 2012 GitHub, Inc. All rights reserved.
//

#import "RACSpecs.h"

#import "NSObject+RACExtensions.h"

SpecBegin(RACExtensions)

describe(@"NSObject", ^{
    __block NSObject *foo = @"Object";
    __block id performID = nil;
    __block BOOL executed = NO;

    beforeEach(^{
        executed = NO;
        performID = [foo rac_performBlock:^{
            executed = YES;
        } afterDelay:.1];
	});
	
	it(@"should perform", ^{
		expect(executed).Not.toBeTruthy();
        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.11]];
        expect(executed).toBeTruthy();
    });

	it(@"should cancel", ^{
        expect(executed).Not.toBeTruthy();
        [foo rac_cancelPreviousPerformBlockRequestsWithId:performID];
        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.11]];
        expect(executed).Not.toBeTruthy();
    });
});

SpecEnd
