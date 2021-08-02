//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Andrew Pokachailo
// On: 7/29/21
// 
// Copyright © 2021 RSSchool. All rights reserved.

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ColorItem : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) UIColor *color;
@property (nonatomic, assign) BOOL checked;

- (instancetype)initWithTitle:(NSString *)title andColor:(UIColor *)color;

@end

NS_ASSUME_NONNULL_END
