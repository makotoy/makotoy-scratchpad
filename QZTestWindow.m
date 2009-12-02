//
//  QZTestWindow.m
//  XCTest
//
//  Created by Makoto Yamashita on 11/11/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "QZTestWindow.h"


@implementation QZTestWindow
- (void)sendEvent:(NSEvent *)event
{
	if ([event type] == NSKeyDown || [event type] == NSKeyUp) {
		NSLog(@"sendEvent: %@", event);
	}
	[super sendEvent:event];
}

- (void)keyDown:(NSEvent *)theEvent
{
	[[self delegate] keyDown:theEvent];
}

- (void)keyUp:(NSEvent *)theEvent
{
	[[self delegate] keyUp:theEvent];
}

- (void)noResponderFor:(SEL)eventSelector
{
	NSString* selName = NSStringFromSelector(eventSelector);
	if ([selName hasPrefix:@"key"]) {
		NSLog(@"Custom noResponderFor: %@", selName);
	}
	[super noResponderFor:eventSelector];
}
@end
