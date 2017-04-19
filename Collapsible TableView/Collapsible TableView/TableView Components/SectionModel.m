//
//  SectionModel.m
//  Collapsible TableView
//
//  Created by Richard Stockdale on 18/04/2017.
//  Copyright © 2017 JSD. All rights reserved.
//

#import "SectionModel.h"

@implementation SectionModel

- (NSInteger) numberOfItemsInSection {
    if (self.expanded) {
        return self.rowTitles.count;
    }
    
    return 0;
}


@end
