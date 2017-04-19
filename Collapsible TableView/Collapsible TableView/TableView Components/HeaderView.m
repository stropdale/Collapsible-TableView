//
//  HeaderView.m
//  Collapsible TableView
//
//  Created by Richard Stockdale on 19/04/2017.
//  Copyright © 2017 JSD. All rights reserved.
//

#import "HeaderView.h"

@interface HeaderView ()

@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UIView *accessory;
@property (nonatomic) NSInteger section;

@end

@implementation HeaderView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        self.label = [[UILabel alloc] init];
        self.accessory = [[UIView alloc] init];
        [self.accessory.widthAnchor constraintEqualToConstant:12].active = YES;
        
        self.label.translatesAutoresizingMaskIntoConstraints = NO;
        self.accessory.translatesAutoresizingMaskIntoConstraints = NO;
        
        self.accessory.backgroundColor = [UIColor redColor];
        
        [self.contentView addSubview:self.label];
        [self.contentView addSubview:self.accessory];
        
        UITapGestureRecognizer *tgr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(headerWasTapped)];
        [self addGestureRecognizer:tgr];
    }
    return self;
}

- (void) layoutSubviews {
    [super layoutSubviews];
    
    NSDictionary *components = @{@"label" : self.label,
                                 @"accessory" : self.accessory};
    
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[label]-[accessory]-20-|"
                                                                            options:0
                                                                            metrics:nil
                                                                              views:components]];
    
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[label]-|"
                                                                             options:0
                                                                             metrics:nil
                                                                               views:components]];
    
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[accessory]-|"
                                                                             options:0
                                                                             metrics:nil
                                                                               views:components]];
}

- (void) setTitle: (NSString *) title forSection: (NSInteger) section {
    self.label.text = title;
    self.section = section;
}

- (void) headerWasTapped {
    if (self.delegate && [self.delegate respondsToSelector:@selector(headerTappedForSectionTapped:)]) {
        [self.delegate headerTappedForSectionTapped:self.section];
        
        // TODO: Animate to show the changes
    }
}

@end
