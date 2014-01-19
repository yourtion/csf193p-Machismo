//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by Yourtion on 14-1-18.
//  Copyright (c) 2014年 Yourtion. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"
#import "Deck.h"

@interface CardMatchingGame : NSObject

-(instancetype)initWithCardCount:(NSUInteger)count
                       usingDeck:(Deck *)deck;

-(void)chooseCardAtIndex:(NSUInteger)index;
-(Card *)cardAtIndex:(NSUInteger)index;

@property (nonatomic, readonly)NSInteger score;
@property (nonatomic, readonly)NSString *result;
@end
