//
//  DZRollingTabView.h
//  DZRollingTabViewDome
//
//  Created by iMac on 2017/11/27.
//  Copyright © 2017年 ChenDongZhi. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol V_RollingTabDelegate;

@interface DZRollingTabView : UIView <UIScrollViewDelegate>

@property (nonatomic,assign) id <V_RollingTabDelegate> delegate;

@property (nonatomic,retain) NSArray *arrayTitles;

@property (nonatomic,assign) BOOL isAddIndexLine;

@property (nonatomic,assign) BOOL isCanRoll;

@property (nonatomic,assign) int selectedIndex;

@end

@protocol V_RollingTabDelegate <NSObject>

///点击按钮回调
-(void)V_RollingTabSelectedIndx:(NSInteger)index;

@end
