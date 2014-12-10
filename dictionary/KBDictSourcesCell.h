//
//  KBDictSourcesCell.h
//  dictionary
//
//  Created by Kurt DaCosta on 2014-12-09.
//  Copyright (c) 2014 kurtbardd. All rights reserved.
//

#import "KBSettingOptionsCell.h"

@protocol DictionarySourceChangeProtocol <NSObject>

@required
- (void)didChangeToDictionarySource:(NSString *)source;

@end

@interface KBDictSourcesCell : KBSettingOptionsCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier accessoryType:(UITableViewCellAccessoryType)accessoryType;

@property (nonatomic, strong) id<DictionarySourceChangeProtocol>delegate;

@end
