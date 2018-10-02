//
//  RYEmptyView.h
//  RYEmptyView
//
//  Created by 兔兔 on 2018/9/29.
//  Copyright © 2018年 tutu. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSInteger, RYEmptyType) {
    RYEmptyTypeNotNetwork,//无网络
    RYEmptyTypeNotContent,//无内容
};

typedef void(^RYEmptyResetBlock) (void);

@interface RYEmptyView : UIView


/**
 自动显隐
 */
@property (nonatomic, assign) BOOL autoShowAndHideEmptyView;

@property (nonatomic, copy, readonly) RYEmptyResetBlock resetBlock;
//类初始方法
+ (instancetype)createEmptyViewWithType:(RYEmptyType )type;

/**
 初始化
 
 @param type 类型
 @param block 回调block
 @return 实例
 */
+ (instancetype)createEmptyViewWithType:(RYEmptyType )type resetBlock:(RYEmptyResetBlock) block;

//实例初始方法
- (instancetype)initWithType:(RYEmptyType )type;

/**
 初始化
 
 @param type 类型
 @param block 回调block
 @return 实例
 */
- (instancetype)initWithType:(RYEmptyType )type resetBlock:(RYEmptyResetBlock) block;



- (void)show;
- (void)dismiss;

@end
