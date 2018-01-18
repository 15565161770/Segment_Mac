//
//  AppDelegate.h
//  Segment
//
//  Created by 仝兴伟 on 2018/1/17.
//  Copyright © 2018年 仝兴伟. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "MainVC.h"
@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (nonatomic, strong) MainVC *mainVC;
@property (nonatomic, strong) NSWindowController *mainWindowController;
@end

