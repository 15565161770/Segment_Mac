//
//  LeftView.h
//  Segment
//
//  Created by 仝兴伟 on 2018/1/17.
//  Copyright © 2018年 仝兴伟. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@protocol LeftViewDelegate <NSObject>

@optional
- (void)didSelectRow:(NSInteger)row;
@end

@interface LeftView : NSView

@property(nonatomic, weak) id<LeftViewDelegate> delegate;

@end
