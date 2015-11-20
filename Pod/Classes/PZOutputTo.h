//
//  PZOutputTo.h
//
//  Created by Paul Zabelin on 12/17/13.
//  Copyright (c) 2013 iPhone Developer. All rights reserved.
//

@interface PZOutputTo : NSObject
+(NSString *)standardOutput:(void (^)(void))whileExecutingBlock;
+(NSString *)standardError:(void (^)(void))whileExecutingBlock;
+(NSString *)log:(void (^)(void))whileExecutingBlock;
@end
