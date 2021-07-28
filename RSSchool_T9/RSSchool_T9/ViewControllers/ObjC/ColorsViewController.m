//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Andrew Pokachailo
// On: 7/28/21
// 
// Copyright © 2021 RSSchool. All rights reserved.

#import "ColorsViewController.h"

@interface ColorsViewController ()

@property (nonatomic, strong) UITableView *tableView;


@end

@implementation ColorsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupVC];
}

- (void) setupVC {
    self.view.backgroundColor = [[UIColor alloc]initWithRed:0.898 green:0.898 blue:0.898 alpha:1];
}


@end
