//
//  ViewController.m
//  QRcode生成
//
//  Created by yangguangyu on 16/8/19.
//  Copyright © 2016年 yangguangyu. All rights reserved.
//

#import "ViewController.h"
#import "QRCodeView.h"

@interface ViewController ()
@property (nonatomic, strong) QRCodeView *qrCodeView;

@end

@implementation ViewController

-(QRCodeView *)qrCodeView {
    if (!_qrCodeView) {
        _qrCodeView = [[QRCodeView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
        _qrCodeView.center = self.view.center;
        
        [_qrCodeView creatQRcodeImageWithText:@"iOS开发"];
        [_qrCodeView creatQRcodeImageWithText:@"iOS开发" logo:[UIImage imageNamed:@"ZFPlayer"]];
        [_qrCodeView creatQRcodeImageWithText:@"iOS开发" logo:[UIImage imageNamed:@"ZFPlayer"] frontColor:[UIColor greenColor] backColor:[UIColor blackColor]];
        
    }
    return _qrCodeView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.qrCodeView];
}

@end
