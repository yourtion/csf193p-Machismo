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
@end

@implementation CareGameViewController

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
    }else{
        Card *card = [[[PlayingCardDeck alloc] init] drawRandomCard];
        [sender setBackgroundImage:[UIImage imageNamed:@"cardfront"] forState:UIControlStateNormal];
        [sender setTitle:[NSString stringWithFormat:@"%@",card.content] forState:UIControlStateNormal];
    }
    self.flipCount++;
}

@end
