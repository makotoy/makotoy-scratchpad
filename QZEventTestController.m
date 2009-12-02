//
//  QZEventTestController.m
//  XCTest
//
//  Created by Makoto Yamashita on 11/11/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "QZEventTestController.h"

CGEventRef keyCallBack(CGEventTapProxy proxy, CGEventType type,
					   CGEventRef event, void *refcon)
{
	switch (type) {
		case kCGEventKeyUp:
		case kCGEventKeyDown:
			NSLog(@"Pressed key code: %d\n",
				  (int)CGEventGetIntegerValueField(event, kCGKeyboardEventKeycode));
			break;
		case kCGEventMouseMoved:
			break;
		default:
			NSLog(@"Event Type: %d", type);
			break;
	}
	return event;
}

@implementation QZEventTestController
- (void)awakeFromNib
{
	ProcessSerialNumber psn;
	GetCurrentProcess(&psn);
	CGEventMask watchMask;
	watchMask = CGEventMaskBit(kCGEventKeyUp) | CGEventMaskBit(kCGEventKeyDown)
				 | CGEventMaskBit(kCGEventFlagsChanged);
	CFMachPortRef tapRef;
	tapRef = CGEventTapCreateForPSN(&psn, kCGHeadInsertEventTap, kCGEventTapOptionDefault,
									watchMask, keyCallBack, NULL);
	if (tapRef == NULL) {
		NSLog(@"Could not create tapRef.");
		return;
	}
	NSLog(@"Creating Run Loop Source...");
	CFRunLoopSourceRef tapSourceRef;
	tapSourceRef = CFMachPortCreateRunLoopSource(kCFAllocatorDefault, tapRef, 0);
	if (tapSourceRef == NULL) return;
	NSLog(@"Adding Run Loop Source...");
	CFRunLoopAddSource(CFRunLoopGetMain(), tapSourceRef, kCFRunLoopCommonModes);
}

- (void)applicationDidFinishLaunching:(NSNotification *)notification
{
	NSLog(@"Howdy!");
}

- (void)keyDown:(NSEvent *)theEvent
{
	NSLog(@"Controller received keyDown: %@", theEvent);
}

- (void)keyUp:(NSEvent *)theEvent
{
	NSLog(@"Controller received keyUp: %@", theEvent);
}

@end
