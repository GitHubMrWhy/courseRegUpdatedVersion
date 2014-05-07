//
//  TradeItemTableViewCell.m
//  courseReg
//
//  Created by Mingsheng Xu on 14-5-1.
//  Copyright (c) 2014年 Mingsheng Xu. All rights reserved.
//

#import "TradeItemTableViewCell.h"

@implementation TradeItemTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    
    NSString* fontName = @"Optima-Italic";
    NSString* boldFontName = @"Optima-ExtraBlack";
    
      UIColor* mainColor = [UIColor colorWithRed:50.0/255 green:102.0/255 blue:147.0/255 alpha:1.0f];
    
    self.exchangeLabel.textColor =  mainColor;
    self.exchangeLabel.font =  [UIFont fontWithName:fontName size:14.0f];
    
    self.haveLabel.textColor =  mainColor;
    self.haveLabel.font =  [UIFont fontWithName:fontName size:14.0f];

                                
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
