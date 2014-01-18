//
//  PlayingCard.m
//  Matchismo
//
//  Created by Yourtion on 14-1-18.
//  Copyright (c) 2014年 Yourtion. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard
-(int)match:(NSArray *)otherCards
{
    int score = 0;
    if ([otherCards count] == 1) {
        PlayingCard *otherCard = [otherCards firstObject];
        if (otherCard.rank == self.rank) {
            score = 4;
        }else if ([otherCard.suit isEqualToString:self.suit]){
            score = 1;
        }
    }
    return score;
}

+(NSArray *)rankStrings
{
    return @[@"?", @"A", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K"];
}
+(NSArray *)validSuits
{
    return @[@"♥︎", @"♦︎", @"♠︎",@"♣︎"];
}
+(NSUInteger)maxRank
{
    return [[self rankStrings] count]-1;
}

-(NSString *)content
{
    NSArray *rankStrings = [PlayingCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}

@synthesize suit = _suit;
-(void)setSuit:(NSString *)suit
{
    if ([[PlayingCard validSuits] containsObject:suit]) {
        _suit = suit;
    }
}
-(NSString *)suit
{
    return _suit ? _suit : @"?";
}

-(void)setRank:(NSInteger)rank
{
    if (rank <= [PlayingCard maxRank]) {
        _rank = rank;
    }
}
@end
