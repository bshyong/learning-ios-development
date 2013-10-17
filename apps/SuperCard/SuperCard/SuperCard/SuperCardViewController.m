//
//  SuperCardViewController.m
//  SuperCard
//
//  Created by Benjamin Shyong on 10/17/13.
//  Copyright (c) 2013 Benjamin Shyong. All rights reserved.
//

#import "SuperCardViewController.h"
#import "PlayingCardView.h"

@interface SuperCardViewController ()
@property (weak, nonatomic) IBOutlet PlayingCardView *playingCardView;

@end

@implementation SuperCardViewController

- (IBAction)swipe:(UISwipeGestureRecognizer *)sender {

  [UIView transitionWithView:self.playingCardView duration:0.5 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
      self.playingCardView.faceUp = !self.playingCardView.faceUp;
  }completion:NULL];
}

- (void)setPlayingCardView:(PlayingCardView *)playingCardView{
  _playingCardView = playingCardView;
  playingCardView.rank = 13;
  playingCardView.suit = @"♥";
  [playingCardView addGestureRecognizer:[[UIPinchGestureRecognizer alloc] initWithTarget:playingCardView action:@selector(pinch:)]];
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

@end
