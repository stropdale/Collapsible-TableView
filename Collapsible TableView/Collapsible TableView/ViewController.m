//
//  ViewController.m
//  Collapsible TableView
//
//  Created by Richard Stockdale on 18/04/2017.
//  Copyright © 2017 JSD. All rights reserved.
//

#import "ViewController.h"
#import "SectionModel.h"
#import "CollapsibleTableView.h"

@interface ViewController ()

@property (nonatomic, strong) CollapsibleTableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView = [[CollapsibleTableView alloc] initWithFrame:self.view.frame];
    self.tableView.onlyOneExpanded = YES;
    [self.view addSubview:self.tableView];
    
    [self populateTableViewWithDummyData];
}

- (void) populateTableViewWithDummyData {
    
    NSMutableArray <SectionModel *> *arr = [NSMutableArray new];
    
    for (int i = 0; i < 10; i++) {
        SectionModel *m = [SectionModel new];
        m.sectionHeaderTitle = [NSString stringWithFormat:@"Header %d", i];
        m.rowTitles = @[@"Row 1", @"Row 2", @"Row 3", @"Row 4", @"Row 5", @"Row 6", @"Row 7"];
        m.expanded = i == 0 ? YES : NO;
        
        [arr addObject:m];
    }
    
    [self.tableView populateWithSectionModels:arr];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
