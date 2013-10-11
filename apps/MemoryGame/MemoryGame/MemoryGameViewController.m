//
//  MemoryGameViewController.m
//  MemoryGame
//
//  Created by Benjamin Shyong on 10/10/13.
//  Copyright (c) 2013 Benjamin Shyong. All rights reserved.
//

#import "MemoryGameViewController.h"
#import "PlayingCardDeck.h"

@interface MemoryGameViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (strong, nonatomic) Deck *deck;
@end

@implementation MemoryGameViewController
  - (Deck *)deck{
    if (!_deck) _deck = [[PlayingCardDeck alloc] init];
    return _deck;
  }

  - (void)setCardButtons:(NSArray *)cardButtons{
    _cardButtons = cardButtons;
    for (UIButton *cardButton in self.cardButtons) {
      Card *card = [self.deck drawRandomCard];
      [cardButton setTitle:card.contents forState:UIControlStateSelected];
    }
  }

  - (void)setFlipCount:(int)flipCount{
      _flipCount = flipCount;
      self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
  }

  - (IBAction)flipCard:(UIButton *)sender {
      sender.selected = !sender.isSelected;
      self.flipCount++;
  }
@end
