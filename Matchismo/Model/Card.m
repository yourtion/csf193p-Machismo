//
//  Card.m
//  Matchismo
//
//  Created by Yourtion on 14-1-18.
//  Copyright (c) 2014年 Yourtion. All rights reserved.
//

#import "Card.h"

@implementation Card

-(int)match:(Card *)card
{
    int score = 0;
    
    if ([card.content isEqualToString:self.content]) {
        score = 1;
    }
    return score;
}
@end
