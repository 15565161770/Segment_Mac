//
//  AppDelegate.m
//  Segment
//
//  Created by 仝兴伟 on 2018/1/17.
//  Copyright © 2018年 仝兴伟. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    self.mainVC = [[MainVC alloc]initWithNibName:@"MainVC" bundle:nil];
    NSWindow *mainWindow = [NSWindow windowWithContentViewController:self.mainVC];
    self.mainWindowController = [[NSWindowController alloc]initWithWindow:mainWindow];
    self.mainVC.view.window.windowController = self.mainWindowController;
    [self.mainWindowController.window makeKeyAndOrderFront:self];
    [self.mainWindowController.window center];
    [self.mainWindowController showWindow:nil];
    
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (BOOL)applicationShouldHandleReopen:(NSApplication *)sender hasVisibleWindows:(BOOL)flag
{
    [self.mainWindowController.window makeKeyAndOrderFront:self];
    return YES;
}

@end




















