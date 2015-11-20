//
//  PZOutputToSpec.m
//  OutputTo
//
//  Created by Paul Zabelin on 11/19/15.
//  Copyright 2015 Paul Zabelin. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "PZOutputTo.h"

SPEC_BEGIN(PZOutputToSpec)

describe(@"PZOutputTo", ^{
    context(@"no output", ^{
        it(@"should be empty", ^{
            [[[PZOutputTo log:^{
            }] should] beEmpty];
        });
    });
    
    context(@"log output", ^{
        it(@"should include logged string", ^{
            [[[PZOutputTo log:^{
                NSLog(@"simple string");
            }] should] containString:@"simple string"];
        });
        
        it(@"should go to standard error", ^{
            [[[PZOutputTo standardError:^{
                NSLog(@"example %d %@ %d", 1, @2, 1+2);
            }] should] endWithString:@"example 1 2 3\n"];
        });
    });
    
    context(@"printf", ^{
        it(@"should use standard output", ^{
            [[[PZOutputTo standardOutput:^{
                printf("C-style printf");
            }] should] equal:@"C-style printf"];
        });
    });
    
    BOOL runsOnTravis = [[NSProcessInfo processInfo].environment[@"TRAVIS"] boolValue];
    // See https://travis-ci.org/paulz/OutputTo where error context cause build to fail on travis
    if (!runsOnTravis) {
        context(@"error", ^{
            void (^simulateError)(void) = ^void(void) {
                NSString *logPath = [NSTemporaryDirectory() stringByAppendingPathComponent:@"PZOutputTo.log"];
                [[NSFileManager defaultManager] removeItemAtPath:logPath
                                                           error:nil];
            };
            
            it(@"should be reported", ^{
                [[[PZOutputTo log:^{
                    simulateError();
                }] should] startWithString:@"Error Domain=NSCocoaErrorDomain Code=260 \"The file “PZOutputTo.log” couldn’t be opened because there is no such file.\""];
                [[theValue(errno) should] equal:theValue(ENOENT)];
                errno = 0;
            });
        });
    }
});

SPEC_END
