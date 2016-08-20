//
//  QRCodeView.h
//  QRcode生成
//
//  Created by yangguangyu on 16/8/19.
//  Copyright © 2016年 yangguangyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QRCodeView : UIImageView
///** 中心的logo图片 */
//@property (nonatomic, strong) UIImage *logo;
///** 中心的logo图片 */
//@property (nonatomic, strong) UIColor *frontColor;
///** 中心的logo图片 */
//@property (nonatomic, strong) UIColor *backColor;


/** 创建二维码 */
-(void)creatQRcodeImageWithText:(NSString *)text;

/** 创建二维码 带有logo */
-(void)creatQRcodeImageWithText:(NSString *)text logo:(UIImage *)logo;

/** 创建二维码 带有logo、前景色、背景色 */
-(void)creatQRcodeImageWithText:(NSString *)text logo:(UIImage *)logo frontColor:(UIColor *)frontColor backColor:(UIColor *)backColor;
@end
