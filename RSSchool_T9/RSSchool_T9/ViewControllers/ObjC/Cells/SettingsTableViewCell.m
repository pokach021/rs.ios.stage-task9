//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Andrew Pokachailo
// On: 7/28/21
// 
// Copyright © 2021 RSSchool. All rights reserved.

#import "SettingsTableViewCell.h"

@implementation SettingsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setupViews];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    [self setupViews];
}

- (void)setupViews {
    
}

@end
