#import "MoonyNavBarPlugin.h"
#if __has_include(<moony_nav_bar/moony_nav_bar-Swift.h>)
#import <moony_nav_bar/moony_nav_bar-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "moony_nav_bar-Swift.h"
#endif

@implementation MoonyNavBarPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftMoonyNavBarPlugin registerWithRegistrar:registrar];
}
@end
