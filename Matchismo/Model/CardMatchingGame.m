//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by Yourtion on 14-1-18.
//  Copyright (c) 2014年 Yourtion. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()
@property (nonatomic, readwrite)NSInteger score;
@property (nonatomic, readwrite)NSString *result;
@property (nonatomic, strong)NSMutableArray *cards;
@end

@implementation CardMatchingGame
-(NSMutableArray *)cards
{
    if(!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

-(instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck
{
    [super self];
    if (self) {
        for (int i = 0; i < count; i++) {
            Card *card = [deck drawRandomCard];
            if (card) {
                [self.cards addObject:card];
            }else{
                self = nil;
                break;
            }
        }
    }
    return self;
}

-(Card *)cardAtIndex:(NSUInteger)index
{
    return (index<[self.cards count]) ? self.cards[index] : nil;
}

static const int MISMATCH_PENALTY = 2;
static const int MATCH_BONUS = 4;
static const int COST_TO_CHOOSE = 1;

-(void)chooseCardAtIndex:(NSUInteger)index
{
    Card *card = [self cardAtIndex:index];
    self.result = @"";
    if (!card.isMatched) {
        if (card.isChosen) {
            card.chosen = NO;
        }else{
            for (Card *otherCard in self.cards) {
                if (otherCard.isChosen && !otherCard.isMatched) {
                    int matchScore = [card match:@[otherCard]];
                    if (matchScore) {
                        self.score += matchScore * MATCH_BONUS;
                        otherCard.matched = YES;
                        card.matched = YES;
                        self.result = [NSString stringWithFormat:@"Matched %@ %@ for %d score!", card.content, otherCard.content, matchScore * MATCH_BONUS];
                    }else{
                        self.score -= MISMATCH_PENALTY;
                        otherCard.chosen = NO;
                        self.result = [NSString stringWithFormat:@"%@ %@ don't match! %d point penalty!",card.content, otherCard.content, MISMATCH_PENALTY];
                    }
                    break;
                }
            }
            self.score -= COST_TO_CHOOSE;
            card.chosen = YES;
        }
    }
}
@end
