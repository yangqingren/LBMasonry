//
//  LBTableViewCell.m
//  Masonry
//
//  Created by 杨庆人 on 17/8/14.
//  Copyright © 2017年 杨庆人. All rights reserved.
//

#import "LBTableViewCell.h"
#import "Masonry.h"

@interface LBTableViewCell ()
@property (nonatomic,strong)UITextField * textField;

@end

@implementation LBTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (UITextField *)textField {
    if (!_textField) {
        _textField = [[UITextField alloc] init];
        _textField.borderStyle = UITextBorderStyleLine;
    }
    return _textField;
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.backgroundColor = [UIColor yellowColor];
        
        [self addSubview:self.textField];
        
        [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(30);
            make.edges.insets(UIEdgeInsetsMake(40, 15, 40, 15));
        }];
    }
    return self;
}


@end
