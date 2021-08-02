//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Andrew Pokachailo
// On: 7/29/21
// 
// Copyright © 2021 RSSchool. All rights reserved.

#import "CollorsTableViewCell.h"
#import "ColorItem.h"

@interface CollorsTableViewCell ()

@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation CollorsTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupViews];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setupViews];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViews];
    }
    return self;
}

- (void)configureWithColorItem:(ColorItem *)colorItem {
    self.titleLabel.text = colorItem.title;
    self.titleLabel.textColor = colorItem.color;

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
   
    
    // Configure the view for the selected state
}

- (void)setupViews {

    
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:self.titleLabel];
    [NSLayoutConstraint activateConstraints:@[
        [self.titleLabel.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:16.0],
        [self.trailingAnchor constraintEqualToAnchor:self.titleLabel.trailingAnchor constant:16.0],
        [self.titleLabel.centerYAnchor constraintEqualToAnchor:self.centerYAnchor]
    ]];
}


@end
