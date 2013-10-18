//
//  MemoryGameViewController.m
//  MemoryGame
//
//  Created by Benjamin Shyong on 10/10/13.
//  Copyright (c) 2013 Benjamin Shyong. All rights reserved.
//

#import "MemoryGameViewController.h"
#import "CardMatchingGame.h"
#import "GameResult.h"

@interface MemoryGameViewController () <UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;
@property (strong, nonatomic) Deck *deck;
@property (strong, nonatomic) CardMatchingGame *game;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *lastActionLabel;
@property (strong, nonatomic) GameResult *gameResult;
@property (weak, nonatomic) IBOutlet UICollectionView *cardCollectionView;
@end

@implementation MemoryGameViewController

  -(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.startingCardCount;
  }

  -(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                   cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PlayingCard" forIndexPath:indexPath];
    Card *card = [self.game cardAtIndex:indexPath.item];
    [self updateCell:cell usingCard: card];
    return cell;
  }

  - (Deck *)createDeck {return nil;} //abstract method

  -(void)updateCell:(UICollectionViewCell *)cell usingCard:(Card *)card{
    //abstract
  }

  -(GameResult *)gameResult{
    if (!_gameResult) _gameResult = [[GameResult alloc] init];
    return _gameResult;
  }

  - (CardMatchingGame *)game{
    if(!_game) _game = [[CardMatchingGame alloc] initWithCardCount:self.startingCardCount
                                                         usingDeck:[self createDeck]];
    return _game;
  }

- (IBAction)deal {
  self.game = nil;
  self.gameResult = nil;
  self.flipCount = 0;
  [self updateUI];
}

  //  reflect model changes in the UI
  - (void)updateUI{
    for (UICollectionViewCell *cell in [self.cardCollectionView visibleCells]) {
      NSIndexPath *indexPath = [self.cardCollectionView indexPathForCell:cell];
      Card *card = [self.game cardAtIndex:indexPath.item];
      [self updateCell:cell usingCard:card];
    }
    self.lastActionLabel.text = self.game.lastAction;
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
  }

  - (void)setFlipCount:(int)flipCount{
      _flipCount = flipCount;
      self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
  }

  - (IBAction)flipCard:(UITapGestureRecognizer *)gesture {
    CGPoint tapLocation = [gesture locationInView:self.cardCollectionView];
    NSIndexPath *indexPath = [self.cardCollectionView indexPathForItemAtPoint:tapLocation];
    if(indexPath){
      [self.game flipCardAtIndex:indexPath.item];
      self.flipCount++;
      [self updateUI];
      self.gameResult.score = self.game.score;
    }
  }
@end
