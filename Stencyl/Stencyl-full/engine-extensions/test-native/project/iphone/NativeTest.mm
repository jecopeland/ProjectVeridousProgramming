#include <NativeTest.h>
#import <UIKit/UIKit.h>
#import <CoreFoundation/CoreFoundation.h>

using namespace nativetest;

namespace nativetest
{
    void showSystemAlert(const char *title, const char *message)
    {	
        UIAlertView* alert= [[UIAlertView alloc] initWithTitle: [[NSString alloc] 
        										 initWithUTF8String:title] 
        										 message: [[NSString alloc] initWithUTF8String:message] 
                                                 delegate: NULL 
                                                 cancelButtonTitle: @"OK" 
                                                 otherButtonTitles: NULL];
        [alert show];
    }
}