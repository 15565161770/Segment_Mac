//
//  LeftView.m
//  Segment
//
//  Created by 仝兴伟 on 2018/1/17.
//  Copyright © 2018年 仝兴伟. All rights reserved.
//

#import "LeftView.h"
#import "segmentcell.h"
#import "TWTableRow.h"
@interface LeftView ()<NSTableViewDelegate, NSTableViewDataSource>
@property (nonatomic, strong) NSScrollView *tableviewScrollView;
@property (nonatomic, strong) NSTableView *tableview;
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) NSMutableArray *imageArray;
@property (nonatomic, strong) NSMutableArray *imageSelectArray;
@property (nonatomic, assign) NSInteger selectRow;
@end
@implementation LeftView

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
    self.wantsLayer = YES;
    self.layer.backgroundColor = [NSColor darkGrayColor].CGColor;
}


-(instancetype)initWithFrame:(NSRect)frameRect {
    if ([super initWithFrame:frameRect]) {
        [self addTableData];
        [self addTbleview];
        [self.tableview reloadData];
    }
    return self;
}



- (void)addTbleview {
    self.tableviewScrollView = [[NSScrollView alloc]initWithFrame:CGRectMake(0,190, 170, 193 - 46)];
    self.tableview = [[NSTableView alloc]initWithFrame:CGRectMake(0, 0, 170, 180 - 46)];
    [self.tableview setAutoresizesSubviews:YES];
    [self.tableview setFocusRingType:NSFocusRingTypeDefault];
    self.tableview.headerView = nil;
    self.tableview.rowHeight = 46;
    self.tableview.rowSizeStyle = NSTableViewRowSizeStyleDefault;
    //  创建单元格 这里单元格设置为1个
    NSTableColumn *column1 = [[NSTableColumn alloc]initWithIdentifier:@"name"];
    column1.title = @"";
    column1.width = 170;
    [self.tableview addTableColumn:column1];
    
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    
    // 添加分割线
    self.tableview.gridStyleMask =  NSTableViewGridNone;
    // 设置分割线的颜色
    
    [self.tableviewScrollView setDocumentView:self.tableview];
    [self addSubview:self.tableviewScrollView];
    
}

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView{
    if (self.dataArray.count == 0) {
        return 0;
    }
    return self.dataArray.count;
}

- (CGFloat)tableView:(NSTableView *)tableView heightOfRow:(NSInteger)row
{
    return  46;
}


- (id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
    return nil;
}

// 设置某个元素的具体视图
-(NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row{
    segmentcell *cellView = [tableView makeViewWithIdentifier:@"kCellIdentifiers" owner:self];
    if (cellView == nil) {
        cellView = [[segmentcell alloc] init];
        [cellView setIdentifier: @"kCellIdentifiers"];
    }
    
    cellView.imageView_s.image = [NSImage imageNamed:self.imageArray[row]];
    cellView.titleLable.stringValue = NSLocalizedString(self.dataArray[row], self.dataArray[row]);
    cellView.imgName = self.imageArray[row];
    if (row == 0) {
        NSIndexSet *set = [NSIndexSet indexSetWithIndex:0];
        [self.tableview selectRowIndexes:set byExtendingSelection:NO];
    }
    return cellView;
}

-(void)tableViewSelectionDidChange:(nonnull NSNotification* )notification{
    self.tableview = notification.object;
    NSInteger row = (long)self.tableview.selectedRow;
    if (self.selectRow == row) {
        return;
    }
    // 使用代理
    self.selectRow = row;
    if ([_delegate respondsToSelector:@selector(didSelectRow:)]) {
        [_delegate didSelectRow:row];
    }
}

// 行选择状态
- (nullable NSTableRowView *)tableView:(NSTableView *)tableView rowViewForRow:(NSInteger)row{
    TWTableRow * rowView = [[TWTableRow alloc]init];
    return rowView;
}

- (void)addTableData {
    self.dataArray = [NSMutableArray arrayWithObjects:@"我的企业文件",@"申请解密的文件",@"已解密的文件", nil];
//    self.imageArray = [NSMutableArray arrayWithObjects:@"cloudbox_folder_1",@"cloudbox_folder_2",@"cloudbox_folder_3", nil];
    self.imageArray = [NSMutableArray arrayWithObjects:@"leftbar_icon_home",@"leftbar_icon_cloudbox",@"leftbar_icon_Messages",@"leftbar_icon_setting", nil];
    self.imageSelectArray = [NSMutableArray arrayWithObjects:@"cloudbox_folder_1_Selected",@"leftbar_icon_cloudbox_Selected",@"leftbar_icon_Messages_Selected", nil];
}


@end
