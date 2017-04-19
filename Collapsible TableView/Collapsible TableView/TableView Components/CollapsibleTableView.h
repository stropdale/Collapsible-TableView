//
//  CollapsibleTableView.h
//  Collapsible TableView
//
//  Created by Richard Stockdale on 18/04/2017.
//  Copyright © 2017 JSD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HeaderView.h"
@class SectionModel;

@interface CollapsibleTableView : UITableView <UITableViewDataSource, UITableViewDelegate, HeaderViewProtocol>


/**
 Populates the table view with its content models

 @param sections An array of Section Models
 */
- (void) populateWithSectionModels: (NSArray <SectionModel *> *) sections;

@end
