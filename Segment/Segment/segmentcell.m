//
//  segmentcell.m
//  segment_table
//
//  Created by 仝兴伟 on 2017/11/14.
//  Copyright © 2017年 仝兴伟. All rights reserved.
//

#import "segmentcell.h"

@implementation segmentcell

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
}

- (instancetype)initWithFrame:(NSRect)frameRect {
    self = [super initWithFrame:frameRect];
    if (self) {
        [self addLayout];
    }
    return self;
}

- (void)addLayout{
    self.imageView_s = [[NSImageView alloc]initWithFrame:CGRectMake(18, 14, 18, 18)];
    [self addSubview:self.imageView_s];
    self.titleLable = [[NSTextField alloc]initWithFrame:CGRectMake(48, 14, 200, 18)];
    [self.titleLable setTextColor:[NSColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0]];
    self.titleLable.maximumNumberOfLines = 0;
//    self.titleLable.font = [NSFont fontWithName:@"Helvetica" size:13.0];
    self.titleLable.backgroundColor = [NSColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:0.001];
    [self.titleLable setBordered:NO];
    [self.titleLable setEditable:NO];
    [self addSubview:self.titleLable];
}

@end
