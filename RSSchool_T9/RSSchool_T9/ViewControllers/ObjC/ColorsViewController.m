//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Andrew Pokachailo
// On: 7/28/21
// 
// Copyright © 2021 RSSchool. All rights reserved.

#import "ColorsViewController.h"
#import "CollorsTableViewCell.h"
#import "ColorItem.h"

@interface ColorsViewController ()

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray<ColorItem *> *dataSource;

@end

@implementation ColorsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupVC];
    [self fillInitialDataSource];
}

- (void) setupVC {
    self.view.backgroundColor = [[UIColor alloc]initWithRed:0.898 green:0.898 blue:0.898 alpha:1];
    self.navigationController.navigationBar.tintColor = UIColor.redColor;
    self.tableView = [[UITableView alloc] init];
    self.tableView.layer.cornerRadius = 16;
    self.tableView.translatesAutoresizingMaskIntoConstraints = false;
    self.tableView.scrollEnabled = NO;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = UIColor.whiteColor;
    [self.tableView registerClass:CollorsTableViewCell.class forCellReuseIdentifier:@"CellId"];
    [self.view addSubview:self.tableView];
    
    [NSLayoutConstraint activateConstraints:@[
        [self.tableView.leadingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leadingAnchor constant:20],
        [self.tableView.trailingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.trailingAnchor constant:-20],
        [self.tableView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor constant:34],
        [self.tableView.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor constant:-117]
    ]];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CollorsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellId" forIndexPath:indexPath];
    [cell configureWithColorItem:self.dataSource[indexPath.row]];
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryCheckmark;
   // [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryNone;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return self.tableView.bounds.size.height / self.dataSource.count;
}

#pragma mark - Data source init

- (void)fillInitialDataSource {
    
    self.dataSource = [[NSMutableArray alloc]initWithArray:@[
        [[ColorItem alloc]initWithTitle:@"#be2813" andColor:[UIColor colorWithRed:0.745 green:0.157 blue:0.075 alpha:1]],
        [[ColorItem alloc]initWithTitle:@"#3802da" andColor:[UIColor colorWithRed:0.22 green:0.008 blue:0.855 alpha:1]],
        [[ColorItem alloc]initWithTitle:@"#467c24" andColor:[UIColor colorWithRed:0.275 green:0.486 blue:0.141 alpha:1]],
        [[ColorItem alloc]initWithTitle:@"#808080" andColor:[UIColor colorWithRed:0.502 green:0.502 blue:0.502 alpha:1]],
        [[ColorItem alloc]initWithTitle:@"#8e5af7" andColor:[UIColor colorWithRed:0.557 green:0.353 blue:0.969 alpha:1]],
        [[ColorItem alloc]initWithTitle:@"#f07f5a" andColor:[UIColor colorWithRed:0.941 green:0.498 blue:0.353 alpha:1]],
        [[ColorItem alloc]initWithTitle:@"#f3af22" andColor:[UIColor colorWithRed:0.953 green:0.686 blue:0.133 alpha:1]],
        [[ColorItem alloc]initWithTitle:@"#3dacf7" andColor:[UIColor colorWithRed:0.239 green:0.675 blue:0.969 alpha:1]],
        [[ColorItem alloc]initWithTitle:@"#e87aa4" andColor:[UIColor colorWithRed:0.91 green:0.478 blue:0.643 alpha:1]],
        [[ColorItem alloc]initWithTitle:@"#0f2e3f" andColor:[UIColor colorWithRed:0.059 green:0.18 blue:0.247 alpha:1]],
        [[ColorItem alloc]initWithTitle:@"#213711" andColor:[UIColor colorWithRed:0.129 green:0.216 blue:0.067 alpha:1]],
        [[ColorItem alloc]initWithTitle:@"#511307" andColor:[UIColor colorWithRed:0.318 green:0.075 blue:0.027 alpha:1]],
        [[ColorItem alloc]initWithTitle:@"#92003b" andColor:[UIColor colorWithRed:0.573 green:0 blue:0.231 alpha:1]],
    ]];
    
}


@end
