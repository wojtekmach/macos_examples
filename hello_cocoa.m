#import<Cocoa/Cocoa.h>

int main() {
    [NSAutoreleasePool new];
    [NSApplication sharedApplication];
    [NSApp setActivationPolicy:NSApplicationActivationPolicyRegular];

    dispatch_async(dispatch_get_main_queue(), ^{
        [NSApp activateIgnoringOtherApps:YES];
    });

    id quitMenuItemTitle = @"Quit";
    id quitMenuItem = [[NSMenuItem alloc] autorelease];
    [quitMenuItem
        initWithTitle:quitMenuItemTitle
        action:@selector(terminate:)
        keyEquivalent:@"q"];
    id appMenu = [[NSMenu new] autorelease];
    [appMenu addItem:quitMenuItem];
    id appMenuItem = [[NSMenuItem new] autorelease];
    [appMenuItem setSubmenu:appMenu];
    id mainMenu = [[NSMenu new] autorelease];
    [mainMenu addItem:appMenuItem];
    [NSApp setMainMenu:mainMenu];

    id window = [[NSWindow alloc] autorelease];
    [window
        initWithContentRect:NSMakeRect(0, 0, 300, 200)
        styleMask:NSWindowStyleMaskTitled
        backing:NSBackingStoreBuffered
        defer:NO];
    [window setTitle:@"Foo"];
    [window makeKeyAndOrderFront:nil];

    [NSApp run];
}
