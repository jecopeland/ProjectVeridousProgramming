#ifndef IPHONE
#define IMPLEMENT_API
#endif

#if defined(HX_WINDOWS) || defined(HX_MACOS) || defined(HX_LINUX)
#define NEKO_COMPATIBLE
#endif

#include <hx/CFFI.h>
#include "NativeTest.h"
#include <stdio.h>

//--------------------------------------------------
// Change this to match your extension's ID
//--------------------------------------------------

using namespace nativetest;


#ifdef IPHONE

//--------------------------------------------------
// Glues Haxe to native code.
//--------------------------------------------------

void ios_alert(value title, value message)
{
	showSystemAlert(val_string(title), val_string(message));
}
DEFINE_PRIM(ios_alert, 2);

#endif



//--------------------------------------------------
// IGNORE STUFF BELOW THIS LINE
//--------------------------------------------------

extern "C" void nativetest_main() 
{	
}
DEFINE_ENTRY_POINT(nativetest_main);

extern "C" int nativetest_register_prims() 
{ 
    return 0; 
}