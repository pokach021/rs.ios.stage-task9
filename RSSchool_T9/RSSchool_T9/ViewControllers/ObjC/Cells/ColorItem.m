//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Andrew Pokachailo
// On: 7/29/21
// 
// Copyright © 2021 RSSchool. All rights reserved.

#import "ColorItem.h"

@implementation ColorItem

- (instancetype)initWithTitle:(NSString *)title andColor:(UIColor *)color {
    self = [super init];
    if (self) {
        self.title = title;
        self.color = color;
        self.checked = NO;
    }
    return self;
}

@end
