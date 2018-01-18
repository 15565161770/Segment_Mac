//
//  segmentcell.h
//  segment_table
//
//  Created by 仝兴伟 on 2017/11/14.
//  Copyright © 2017年 仝兴伟. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface segmentcell : NSTableCellView
@property (nonatomic, strong) NSTextField *titleLable;
@property (nonatomic, strong) NSImageView *imageView_s;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *imgName;
@end
