//
//  CareGameViewController.m
//  Matchismo
//
//  Created by Yourtion on 14-1-18.
//  Copyright (c) 2014年 Yourtion. All rights reserved.
//

#import "CareGameViewController.h"
#import "PlayingCardDeck.h"

@interface CareGameViewController ()
@property (weak, nonatomic) IBOutlet UILabel *FlipLabel;
@property (nonatomic) int flipCount;
@property (strong, nonatomic) Deck *deck;
@end

@implementation CareGameViewController
-(Deck *)deck
{
    if (!_deck) _deck = [self createDeck];
    return _deck;
}
-(Deck *)createDeck
{
    return [[PlayingCardDeck alloc] init];
}

-(void)setFlipCount:(int)flipCount
{
    _flipCount = flipCount;
    self.FlipLabel.text = [NSString stringWithFormat:@"FlipCount: %d",flipCount];
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
    if ([sender.currentTitle length]) {
        [sender setBackgroundImage:[UIImage imageNamed:@"cardback"] forState:UIControlStateNormal];
        [sender setTitle:@"" forState:UIControlStateNormal];
        self.flipCount++;
    }else{
        Card *card = [self.deck drawRandomCard];
        if (card) {
            [sender setBackgroundImage:[UIImage imageNamed:@"cardfront"] forState:UIControlStateNormal];
            [sender setTitle:card.content forState:UIControlStateNormal];
            self.flipCount++;
        }
    }
}

@end
