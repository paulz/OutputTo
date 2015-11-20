//
//  PZOutputTo.m
//
//  Created by Paul Zabelin on 12/17/13.
//  Copyright (c) 2013 iPhone Developer. All rights reserved.
//

#import "PZOutputTo.h"

@implementation PZOutputTo

+(NSString *)standardFile:(FILE *)file stream:(int)stream block:(void (^)(void))block {
    BOOL redirected = NO;
    
    NSString *logPath = [NSTemporaryDirectory() stringByAppendingPathComponent:@"PZOutputTo.log"];
    int duplicateDescriptor = dup(stream);
    if (duplicateDescriptor != -1) {
        if ((freopen([logPath cStringUsingEncoding:NSASCIIStringEncoding],"w", file)) != NULL) {
            redirected = YES;
        }
    }
    
    block();
    
    fflush(file);
    NSError *error = nil;
    NSString *logString = [NSString stringWithContentsOfFile:logPath
                                                    encoding:NSUTF8StringEncoding
                                                       error:&error];
    if (error) {
        logString = [error description];
    }
    if (redirected) {
        dup2(duplicateDescriptor, stream);
        close(duplicateDescriptor);
    }
    
    return logString;
}

+(NSString *)standardError:(void (^)(void))block {
    return [self standardFile:stderr stream:STDERR_FILENO block:block];
}

+(NSString *)standardOutput:(void (^)(void))block {
    return [self standardFile:stdout stream:STDOUT_FILENO block:block];
}

+(NSString *)log:(void (^)(void))block {
    return [self standardError:block];
}

@end
