//
//  UIView+RYKit.m
//  RYEmptyView
//
//  Created by 兔兔 on 2018/9/29.
//  Copyright © 2018年 tutu. All rights reserved.
//

#import "UIView+RYKit.h"
#import <objc/runtime.h>
#import "RYEmptyView.h"

@implementation UIView (RYKit)
static char  kRYEmptyView;

+ (void)ry_exchangeInstanceMethod:(SEL)method targetMethod:(SEL)target{
    method_exchangeImplementations(class_getInstanceMethod(self, method), class_getInstanceMethod(self, target));
}

- (void)setEmptyView:(RYEmptyView *)emptyView {
    if (emptyView != self.emptyView) {
        objc_setAssociatedObject(self, &kRYEmptyView, emptyView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        
        for (UIView *view in self.subviews) {
            if ([view isKindOfClass:[RYEmptyView class]]) {
                [view removeFromSuperview];
            }
        }
        
        [self addSubview:self.emptyView];
        self.emptyView.hidden = YES;
    }
}


- (void)getDataCountAndSet {
    if (!self.emptyView) {
        return;
    }
    if ([self itemTotalCount] > 0) {
        [self hide];
    }else {
        [self show];
    }
    
}


- (void)show {
    if (!self.emptyView.autoShowAndHideEmptyView) {
        self.emptyView.hidden = NO;
        return;
    }
    [self ry_showEmptyView];
}


- (void)hide {
    if (!self.emptyView.autoShowAndHideEmptyView) {
        self.emptyView.hidden = YES;
        return;
    }
    [self ry_hideEmptyView];
}



- (void)ry_showEmptyView {
    [self.emptyView.superview layoutSubviews];
    self.emptyView.hidden = NO;
    [self bringSubviewToFront:self.emptyView];
}

- (void)ry_hideEmptyView {
    self.emptyView.hidden = YES;
}



- (void)ry_startLoading {
    self.emptyView.hidden = NO;
}

- (void)ry_endLoading {
    self.emptyView.hidden = [self itemTotalCount];
}


- (NSInteger)itemTotalCount {
    NSInteger totalCount = 0;
    if ([self isKindOfClass:[UITableView class]]) {
        UITableView *tableView = (UITableView *)self;
        for (NSInteger section = 0; section < tableView.numberOfSections; section++) {
            totalCount += [tableView numberOfRowsInSection:section];
        }
    }else if ([self isKindOfClass:[UICollectionView class]]) {
        UICollectionView *collectionView = (UICollectionView *)self;
        for (NSInteger section = 0; section < collectionView.numberOfSections; section++) {
            totalCount += [collectionView numberOfItemsInSection:section];
        }
    }
    return totalCount;
}

- (RYEmptyView *)emptyView {
   return  objc_getAssociatedObject(self, &kRYEmptyView);
}







@end


@implementation UITableView (RYEmptyView)
+ (void)load {
    [self ry_exchangeInstanceMethod:@selector(reloadData) targetMethod:@selector(ry_tableViewReloadData)];
}

- (void)ry_tableViewReloadData {
    [self ry_tableViewReloadData];
    [self getDataCountAndSet];
}

@end


@implementation UICollectionView (RYEmptyView)
+ (void)load {
    [self ry_exchangeInstanceMethod:@selector(reloadData) targetMethod:@selector(ry_collectionViewReloadData)];
}

- (void)ry_collectionViewReloadData {
    [self ry_collectionViewReloadData];
    [self getDataCountAndSet];
}

@end
