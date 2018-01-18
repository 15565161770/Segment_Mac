//
//  MainVC.m
//  Segment
//
//  Created by 仝兴伟 on 2018/1/17.
//  Copyright © 2018年 仝兴伟. All rights reserved.
//

#import "MainVC.h"
#import "LeftView.h"

#import "MyEnterpriseFile.h"
#import "DecryptionFile.h"
#import "ApplyDecryptionFile.h"
@interface MainVC ()<LeftViewDelegate>
@property (nonatomic ,strong) LeftView *left;

@property (nonatomic, strong) MyEnterpriseFile *myEnterpriseFile;
@property (nonatomic, strong) DecryptionFile *decryptionFile;
@property (nonatomic, strong) ApplyDecryptionFile *applyDecryptionFile;
@end

@implementation MainVC

- (void)viewWillDisappear {
    [super viewWillDisappear];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    self.view.wantsLayer = YES;
    self.view.layer.backgroundColor = [NSColor whiteColor].CGColor;
    
    [self addLeft];
    [self boxList];
}


#pragma mark -- 默认列表
- (void)boxList {
    if (self.myEnterpriseFile == nil) {
        self.myEnterpriseFile = [[MyEnterpriseFile alloc]initWithNibName:@"MyEnterpriseFile" bundle:nil];
        self.myEnterpriseFile.view.frame = CGRectMake(173, 0, 960 - 173, 600);
    }
    [self.view addSubview:self.myEnterpriseFile.view];
}
#pragma mark -- 添加左侧
- (void)addLeft {
    self.left = [[LeftView alloc]initWithFrame:CGRectMake(0, 0, 173, 480)];
    self.left.delegate = self;
    [self.view addSubview:self.left];
}

-(void)didSelectRow:(NSInteger)row {
    switch (row) {
        case 0:
        {
            NSLog(@"我的企业文件");
            [self boxList];
        }
            break;
        case 1:
        {
            NSLog(@"申请解密的文件");
            if (self.applyDecryptionFile == nil) {
                self.applyDecryptionFile = [[ApplyDecryptionFile alloc]initWithNibName:@"ApplyDecryptionFile" bundle:nil];
                self.applyDecryptionFile.view.frame = CGRectMake(173, 0, 960 - 173, 600);
            }
            [self.view addSubview:self.applyDecryptionFile.view];
        }
            break;
        case 2:
        {
            NSLog(@"已解密的文件");
            if (self.decryptionFile == nil) {
                self.decryptionFile = [[DecryptionFile alloc]initWithNibName:@"DecryptionFile" bundle:nil];
                self.decryptionFile.view.frame = CGRectMake(173, 0, 960 - 173, 600);
            }
            [self.view addSubview:self.decryptionFile.view];
        }
            break;
        default:
            break;
    }
}






@end
