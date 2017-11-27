//
//  DZRollingTabView.m
//  DZRollingTabViewDome
//
//  Created by iMac on 2017/11/27.
//  Copyright © 2017年 ChenDongZhi. All rights reserved.
//

#import "DZRollingTabView.h"
#import <Masonry.h>

static CGFloat LineHeight = 1.0;
static NSInteger BaseTag = 100;

@interface DZRollingTabView ()
@property (nonatomic,retain) UIColor *selectedColor;
@property (nonatomic,retain) UIColor *normalColor;
@property (nonatomic,retain) UIFont *tabTitleFont;
@property (nonatomic,retain) UIColor *lineColor;
@property (nonatomic,assign) CGSize tabTitleSize;
@end

@implementation DZRollingTabView{
    UIView *line;
    UIButton *BTN_Selected;
}

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if(self){
        [self initSet];
    }
    return self;
}

-(id)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]){
        [self initSet];
    }
    return self;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self initSet];
    }
    return self;
}

-(void)initSet{
    self.layer.opaque = NO;
    self.clipsToBounds = YES;
    _tabTitleFont = [UIFont systemFontOfSize:15];
    _normalColor = [UIColor colorWithRed:102.0/255 green:102.0/255 blue:102.0/255 alpha:1];
    _selectedColor = [UIColor colorWithRed:22.0/255 green:139.0/255 blue:242.0/255 alpha:1];
    _lineColor = [UIColor colorWithRed:22.0/255 green:139.0/255 blue:242.0/255 alpha:1];;
    _isAddIndexLine = YES;
    _selectedIndex = 0;
}

- (void)setArrayTitles:(NSArray *)arrayTitles {
    _arrayTitles = arrayTitles;
    UIView *lastView;
    UIView *contentView = [UIView new];
    [self addSubview:contentView];
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    
    for (int i = 0; i < _arrayTitles.count; i++){
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.tag = BaseTag+i;
        btn.titleLabel.font = _tabTitleFont;
        [btn setTitleColor:_normalColor forState:UIControlStateNormal];
        [btn setTitleColor:_selectedColor forState:UIControlStateSelected];
        [btn setTitle:_arrayTitles[i] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(selectedTab:) forControlEvents:UIControlEventTouchUpInside];
        [contentView addSubview:btn];
        
        if(i == _selectedIndex){
            btn.selected = YES;
            BTN_Selected = btn;
        }
        
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            if (lastView) {
                make.left.equalTo(lastView.mas_right);
                make.top.bottom.equalTo(@0);
                make.width.equalTo(lastView);
            }else {
                make.left.top.bottom.equalTo(@0);
            }
            if (i == arrayTitles.count-1) {
                make.right.equalTo(@0);
            }
        }];
        lastView = btn;
    }
    self.isAddIndexLine = self.isAddIndexLine;
}

- (void)setIsAddIndexLine:(BOOL)isAddIndexLine {
    _isAddIndexLine = isAddIndexLine;
    if (!isAddIndexLine || line) return;
    UIButton *btn = [self viewWithTag:BaseTag];
    if (btn) {
        line = [UIView new];
        line.backgroundColor = _lineColor;
        [self addSubview:line];
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@0);
            make.bottom.equalTo(@(0));
            make.height.equalTo(@(LineHeight));
            make.width.equalTo(btn.mas_width);
        }];
    }
}

#pragma mark - UIButtonEventClick -
-(void)selectedTab:(UIButton *)sender{
    NSInteger index = sender.tag - BaseTag;
    if(!sender.isSelected){
        sender.selected = YES;
        BTN_Selected.selected = NO;
        BTN_Selected = sender;
        if(_isAddIndexLine){
            [self layoutIfNeeded];
            [line mas_updateConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(@(CGRectGetWidth(line.bounds)*index));
            }];
        }
        if ([self.delegate respondsToSelector:@selector(V_RollingTabSelectedIndx:)]) {
            [self.delegate V_RollingTabSelectedIndx:index];
        }
    }
}

- (void)setSelectedIndex:(int)selectedIndex{
    _selectedIndex = selectedIndex;
    UIButton *btn = [self viewWithTag:BaseTag+selectedIndex];
    if(btn){
        [self selectedTab:btn];
    }
}

@end
