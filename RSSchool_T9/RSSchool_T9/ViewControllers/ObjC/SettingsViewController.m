//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Andrew Pokachailo
// On: 7/28/21
// 
// Copyright © 2021 RSSchool. All rights reserved.

#import "SettingsViewController.h"
#import "SettingsTableViewCell.h"
#import "ColorsViewController.h"

@interface SettingsViewController ()

@property (nonatomic, strong) UITableView *tableView;


@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupVC];
}

- (void)setupVC {
    self.view.backgroundColor = [[UIColor alloc]initWithRed:0.898 green:0.898 blue:0.898 alpha:1];
    self.navigationItem.title = @"Settings";
    self.navigationController.navigationBar.barTintColor = UIColor.whiteColor;
    
    self.tableView = [[UITableView alloc] init];
    self.tableView.layer.cornerRadius = 16;
    self.tableView.translatesAutoresizingMaskIntoConstraints = false;
    [self.tableView setScrollEnabled:NO];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = UIColor.whiteColor;
    [self.tableView registerClass:SettingsTableViewCell.class forCellReuseIdentifier:@"CellId"];
    [self.view addSubview:self.tableView];
    
    [NSLayoutConstraint activateConstraints:@[
        [self.tableView.leadingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leadingAnchor constant:20],
        [self.tableView.trailingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.trailingAnchor constant:-20],
        [self.tableView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor constant:34],
        [self.tableView.heightAnchor constraintEqualToConstant:104]
        
    ]];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SettingsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellId"];
    if (indexPath.row == 0) {
        cell.textLabel.text = @"Draw stories";
        
        UISwitch *switchView = [[UISwitch alloc] initWithFrame:CGRectZero];
        [switchView setOn:YES animated:YES];
        cell.accessoryView = switchView;
    } else {
        cell = [[SettingsTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"CellId"];
        cell.textLabel.text = @"Stroke color";
        [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
        cell.detailTextLabel.text = @"a";
        
    }
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 52;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 1) {
        ColorsViewController *colorsVC = [ColorsViewController new];
        [self.navigationController pushViewController:colorsVC animated:YES];
    }
    
}

@end
