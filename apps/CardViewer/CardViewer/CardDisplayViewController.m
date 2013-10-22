//
//  CardDisplayViewController.m
//  CardViewer
//
//  Created by Benjamin Shyong on 10/22/13.
//  Copyright (c) 2013 Benjamin Shyong. All rights reserved.
//

#import "CardDisplayViewController.h"
#import "PlayingCardView.h"

@interface CardDisplayViewController ()
  @property (weak, nonatomic) IBOutlet PlayingCardView *playingCardView;
@end

@implementation CardDisplayViewController
- (void)viewWillAppear:(BOOL)animated{
  [super viewWillAppear:animated];
  self.playingCardView.rank = self.rank;
  self.playingCardView.suit = self.suit;
  self.playingCardView.faceUp = YES;
}
@end
