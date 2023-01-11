#ifdef __OBJC__
#import <Cocoa/Cocoa.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "bitsdojo_window.h"
#import "bitsdojo_window_api.h"
#import "bitsdojo_window_common.h"

FOUNDATION_EXPORT double bitsdojo_window_macosVersionNumber;
FOUNDATION_EXPORT const unsigned char bitsdojo_window_macosVersionString[];

