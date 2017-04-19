//
//  HeaderView.h
//  Collapsible TableView
//
//  Created by Richard Stockdale on 19/04/2017.
//  Copyright © 2017 JSD. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HeaderViewProtocol <NSObject>

- (void) headerTappedForSectionTapped: (NSInteger) section;

@end

@interface HeaderView : UITableViewHeaderFooterView

@property (nonatomic, strong) NSObject <HeaderViewProtocol> *delegate;

- (void) setTitle: (NSString *) title forSection: (NSInteger) section;



@end
