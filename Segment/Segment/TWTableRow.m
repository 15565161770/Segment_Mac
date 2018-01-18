//
//  TWTableRow.m
//  cloudscreen
//
//  Created by 仝兴伟 on 2017/11/16.
//  Copyright © 2017年 仝兴伟. All rights reserved.
//

#import "TWTableRow.h"
#import "segmentcell.h"

@implementation TWTableRow

//绘制选中状态的背景
-(void)drawSelectionInRect:(NSRect)dirtyRect{
    NSRect selectionRect = NSInsetRect(self.bounds, 1.0, 1.0);
    [[NSColor colorWithRed:243/255.0 green:243/255.0 blue:243/255.0 alpha:1.0]setStroke];
    [[NSColor colorWithRed:243/255.0 green:243/255.0 blue:243/255.0 alpha:1.0]setFill];
//    [[NSColor colorWithCalibratedWhite:.72 alpha:1.0] setStroke];
//    [[NSColor colorWithCalibratedWhite:.82 alpha:1.0] setFill];
    NSBezierPath *selectionPath = [NSBezierPath bezierPathWithRoundedRect:selectionRect xRadius:3 yRadius:3];
    [selectionPath fill];
    [selectionPath stroke];
}
//绘制背景
-(void)drawBackgroundInRect:(NSRect)dirtyRect{
    [super drawBackgroundInRect:dirtyRect];
    [[NSColor whiteColor]setFill];
    NSRectFill(dirtyRect);
}

// setSelected
-(void)setSelected:(BOOL)selected {
    [super setSelected:selected];
    segmentcell *cell = self.subviews.firstObject;
    if (selected) {
        cell.titleLable.textColor = [NSColor colorWithRed:1/255.0 green:1/255.0 blue:1/255.0 alpha:1.0];
//        cell.imageView_s.image = [NSImage imageNamed:[NSString stringWithFormat:@"%@_Selected", cell.imageView_s.image.name]];
        cell.imageView_s.image = [NSImage imageNamed:[NSString stringWithFormat:@"%@_Selected", cell.imgName]];

    } else {
        [cell.titleLable setTextColor:[NSColor colorWithRed:207/255.0 green:212/255.0 blue:217/255.0 alpha:1.0]];
//        NSMutableArray *array = (NSMutableArray *)[cell.imageView_s.image.name componentsSeparatedByString:@"_"];
//        [array removeObjectAtIndex:array.count -1];
//        [array componentsJoinedByString:@"_"];
//        cell.imageView_s.image = [NSImage imageNamed:[array componentsJoinedByString:@"_"]];
        cell.imageView_s.image = [NSImage imageNamed:[NSString stringWithFormat:@"%@", cell.imgName]];

    }
    
}

@end













