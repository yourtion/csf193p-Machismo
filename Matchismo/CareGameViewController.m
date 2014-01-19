//
//  CareGameViewController.m
//  Matchismo
//
//  Created by Yourtion on 14-1-18.
//  Copyright (c) 2014年 Yourtion. All rights reserved.
//

#import "CareGameViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface CareGameViewController ()
@property (weak, nonatomic) IBOutlet UILabel *FlipLabel;
@property (strong, nonatomic) Deck *deck;
@property (strong, nonatomic) CardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLable;
@property (weak, nonatomic) IBOutlet UILabel *msgLable;
@end

@implementation CareGameViewController
-(CardMatchingGame *)game
{
    if (!_game) _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count]
                                                          usingDeck:[self createDeck]];
    return _game;
}
-(Deck *)deck
{
    if (!_deck) _deck = [self createDeck];
    return _deck;
}
-(Deck *)createDeck
{
    return [[PlayingCardDeck alloc] init];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)CardBtn:(UIButton *)sender {
    int chosenButtonIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:chosenButtonIndex];
    [self updateUI];
}
-(void)updateUI
{
    for (UIButton *cardButton in self.cardButtons) {
        int cardButtonIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardButtonIndex];
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
        self.scoreLable.text = [NSString stringWithFormat:@"Score: %d",self.game.score];
        self.msgLable.text = self.game.result;
    }
}

-(NSString *)titleForCard:(Card *)card
{
    return card.isChosen ? card.content : @"";
}
-(UIImage *)backgroundImageForCard:(Card *)card
{
    return [UIImage imageNamed:card.isChosen ? @"cardfront" : @"cardback"];
}
- (IBAction)resetButton:(UIButton *)sender {
    _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count]
                                      usingDeck:[self createDeck]];
    [self updateUI];
}
@end
