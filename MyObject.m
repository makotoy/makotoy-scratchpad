//
//  MyObject.m
//  XCTest
//
//  Created by Makoto Yamashita on 11/10/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "MyObject.h"


@implementation MyObject
@synthesize myString;
- (id)initWithString:(NSString*)str
{
	if ((self = [super init])) {
		self->myString = str;
	}
	return self;
}
@end
