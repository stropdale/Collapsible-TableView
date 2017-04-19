//
//  CollapsibleTableView.m
//  Collapsible TableView
//
//  Created by Richard Stockdale on 18/04/2017.
//  Copyright © 2017 JSD. All rights reserved.
//

#import "CollapsibleTableView.h"
#import "SectionModel.h"
#import "HeaderView.h"

@interface CollapsibleTableView ()

@property (nonatomic, strong) NSArray <SectionModel *> * sections;

@end

@implementation CollapsibleTableView

- (void) populateWithSectionModels: (NSArray <SectionModel *> *) sections {
    self.sections = sections;

    
    
    [self reloadData];
}

#pragma mark - Data Delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger rows = self.sections[section].rowTitles.count;
    
    return rows;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    NSInteger sections = self.sections.count;
    
    return sections;
}


#pragma mark - TableView Delegate

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    SectionModel *m = self.sections[indexPath.section];
    NSString *rowText = m.rowTitles[indexPath.row];
    cell.textLabel.text = rowText;
    
    return cell;
}

- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    SectionModel *m = self.sections[section];
    NSString *title = m.sectionHeaderTitle;
    
    HeaderView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"header"];
    
    if (!headerView) {
        headerView = [[HeaderView alloc] initWithReuseIdentifier:@"header"];
    }
    
    [headerView setTitle:title forSection:section];
    headerView.delegate = self;
    
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 60.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    SectionModel *sm = self.sections[indexPath.section];
    return sm.expanded ? 60.0 : 0.0;
}

#pragma mark - Header Delegate method

- (void) headerTappedForSectionTapped: (NSInteger) section {
    [self toggleSection:section];
}

#pragma mark - Collapse and Expand Sections

- (void) toggleSection: (NSInteger) section {
    SectionModel *tappedSection = self.sections[section];
    tappedSection.expanded = !tappedSection.expanded;
    
    // Work out the items to be animated
    NSMutableArray <NSIndexPath *> *indexPaths = [NSMutableArray new];
    
    for (NSInteger i = 0; i < tappedSection.rowTitles.count; i++) {
        NSIndexPath *path = [NSIndexPath indexPathForRow:i inSection:section];
        [indexPaths addObject:path];
        
    }
    
    [self beginUpdates];
    [self reloadRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationAutomatic];
    [self endUpdates];
}

#pragma mark - LifeCycle

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.dataSource = self;
        self.delegate = self;
    }
    return self;
}



@end
