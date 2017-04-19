//
//  SectionModel.h
//  Collapsible TableView
//
//  Created by Richard Stockdale on 18/04/2017.
//  Copyright © 2017 JSD. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SectionModel : NSObject


/**
 The title that will appear in the section header
 */
@property (nonatomic, strong) NSString *sectionHeaderTitle;


/**
 Text that will appear in the row
 */
@property (nonatomic, strong) NSArray <NSString *> *rowTitles;


/**
 Is the section expanded?
 */
@property (nonatomic) BOOL expanded;

/**
 A convenience method that returns 0 if the section is collapsed and the number of row if it's expanded

 @return Number of expanded rows that should appear
 */
- (NSInteger) numberOfItemsInSection;

@end
