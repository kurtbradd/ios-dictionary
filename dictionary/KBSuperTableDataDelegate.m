//
//  KBSuperTableDataDelegate.m
//  dictionary
//
//  Created by Kurt DaCosta on 2014-12-09.
//  Copyright (c) 2014 kurtbardd. All rights reserved.
//

#import "KBSuperTableDataDelegate.h"

@implementation KBSuperTableDataDelegate

- (instancetype)init
{
    return [super init];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSAssert(NO, @"Subclasses should implement this method");
    return -1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSAssert(NO, @"Subclasses should implement this method");
    return nil;
}

@end
