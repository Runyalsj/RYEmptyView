//
//  UIView+RYExtension.m
//  生活的味道2.0.0
//
//  Created by 兔兔 on 2017/8/17.
//  Copyright © 2017年 兔兔. All rights reserved.
//

#import "UIView+Frame.h"

@implementation UIView (Frame)

- (void)setRy_x:(CGFloat)ry_x {
    CGRect ryFrame = self.frame;
    ryFrame.origin.x = ry_x;
    self.frame = ryFrame;
}

- (CGFloat)ry_x {
    return self.frame.origin.x;
}

- (void)setRy_y:(CGFloat)ry_y {
    CGRect ryFrame = self.frame;
    ryFrame.origin.y = ry_y;
    self.frame = ryFrame;
}

- (CGFloat)ry_y {
    return self.frame.origin.y;
}

-(void)setRy_origin:(CGPoint)ry_origin {
    CGRect ryFrame = self.frame;
    ryFrame.origin = ry_origin;
    self.frame = ryFrame;
}

- (CGPoint)ry_origin {
    return self.frame.origin;
}


- (void)setRy_width:(CGFloat)ry_width {
    CGRect ryFrame = self.frame;
    ryFrame.size.width = ry_width;
    self.frame = ryFrame;
}

- (CGFloat)ry_width {
    return self.frame.size.width;
}

- (void)setRy_height:(CGFloat)ry_height {
    CGRect ryFrame = self.frame;
    ryFrame.size.height = ry_height;
    self.frame = ryFrame;
}

- (CGFloat)ry_height {
    return self.frame.size.height;
}

- (void)setRy_size:(CGSize)ry_size {
    CGRect ryFrame = self.frame;
    ryFrame.size = ry_size;
    self.frame = ryFrame;
}

- (CGSize)ry_size {
    return self.frame.size;
}


- (CGFloat)ry_centerX {
    return self.center.x;
}

- (void)setRy_centerX:(CGFloat)ry_centerX {
    CGPoint ryFrame = self.center;
    ryFrame.x = ry_centerX;
    self.center = ryFrame;
}

- (void)setRy_centerY:(CGFloat)ry_centerY {
    CGPoint ryFrame = self.center;
    ryFrame.y = ry_centerY;
    self.center = ryFrame;
}

- (CGFloat)ry_centerY {
    return self.center.y;
}

- (CGFloat)ry_right{
    
    return CGRectGetMaxX(self.frame);
}

- (CGFloat)ry_bottom{
    
    return CGRectGetMaxY(self.frame);
}

- (void)setRy_right:(CGFloat)ry_right{
    
    self.ry_x = ry_right - self.ry_width;
}

- (void)setRy_bottom:(CGFloat)ry_bottom{
    
    self.ry_y = ry_bottom - self.ry_height;
}

@end
