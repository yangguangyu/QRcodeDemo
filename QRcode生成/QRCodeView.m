//
//  QRCodeView.m
//  QRcode生成
//
//  Created by yangguangyu on 16/8/19.
//  Copyright © 2016年 yangguangyu. All rights reserved.
//

#import "QRCodeView.h"

@interface QRCodeView ()
@property (nonatomic, strong) CIImage *QRImage;
//@property (nonatomic, strong) CIFilter *colorFilter;
@end

@implementation QRCodeView

-(void)creatQRcodeImageWithText:(NSString *)text {
    [self creatQRcodeImageWithText:text logo:nil frontColor:nil backColor:nil];
}

/** 创建二维码 带有logo */
-(void)creatQRcodeImageWithText:(NSString *)text logo:(UIImage *)logo {
    [self creatQRcodeImageWithText:text logo:logo frontColor:nil backColor:nil];
}

/** 创建二维码 带有logo、前景色、背景色 */
-(void)creatQRcodeImageWithText:(NSString *)text logo:(UIImage *)logo frontColor:(UIColor *)frontColor backColor:(UIColor *)backColor {
    NSAssert(!(self.frame.size.width == 0 || self.frame.size.height == 0) , @"请先设置控件的尺寸");
    
    //1.创建filter（过滤器）
    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    //2.设置默认值
    [filter setDefaults];
    
    //3.设置输入内容
    NSData *data = [text dataUsingEncoding:NSUTF8StringEncoding];
    [filter setValue:data forKey:@"inputMessage"];
    //4.取出生成的图片
    CIImage *ciimage = filter.outputImage;
    UIImage *image =  [UIImage imageWithCIImage:ciimage];
    
    
    
    //5.放大图片比例（取出的图片很小需要放大，否则图片很模糊）
    ciimage = [ciimage imageByApplyingTransform:CGAffineTransformMakeScale(self.frame.size.width / image.size.width, self.frame.size.height / image.size.height)];
    
    //设置前景色
    if (frontColor || backColor) {
        CIFilter *colorFilter = [CIFilter filterWithName:@"CIFalseColor"];
        [colorFilter setDefaults];
        [colorFilter setValue:ciimage forKey:@"inputImage"];
        
        if (frontColor) {
            [colorFilter setValue:[CIColor colorWithCGColor:frontColor.CGColor] forKey:@"inputColor0"];
        }
        
        if (backColor) {
            [colorFilter setValue:[CIColor colorWithCGColor:backColor.CGColor] forKey:@"inputColor1"];
        }
        ciimage = colorFilter.outputImage;
    }
    
    self.QRImage = ciimage;
    self.image = [UIImage imageWithCIImage:ciimage];
    
    if (logo) {
        [self setLogo:logo];
    }
}


-(void)setLogo:(UIImage *)logo {
    
    UIGraphicsBeginImageContext(self.frame.size);
    [[UIImage imageWithCIImage:self.QRImage] drawInRect: CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    [logo drawInRect:CGRectMake((self.frame.size.width - self.frame.size.width/4) * 0.5, (self.frame.size.height - self.frame.size.height / 4) * 0.5, self.frame.size.width / 4, self.frame.size.height / 4)];
    UIImage *image =  UIGraphicsGetImageFromCurrentImageContext();
    self.image = image;
    UIGraphicsEndImageContext();
}
@end
