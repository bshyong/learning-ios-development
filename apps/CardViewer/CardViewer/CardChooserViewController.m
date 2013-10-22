//
//  CardChooserViewController.m
//  CardViewer
//
//  Created by Benjamin Shyong on 10/22/13.
//  Copyright (c) 2013 Benjamin Shyong. All rights reserved.
//

#import "CardChooserViewController.h"
#import "CardDisplayViewController.h"

@interface CardChooserViewController ()
  @property (weak, nonatomic) IBOutlet UISegmentedControl *suitSegmentedControl;
  @property (weak, nonatomic) IBOutlet UILabel *rankLabel;
  @property (nonatomic) NSUInteger rank;
  @property (nonatomic, readonly) NSString *suit;
@end

@implementation CardChooserViewController
  -(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    // destination view ViewDidLoad is not loaded at this point
    // Outlets are not loaded
    if ([segue.identifier isEqualToString:@"ShowCard"]){
      // conditional corresponds to name of segue set in inspector
      if ([segue.destinationViewController isKindOfClass:[CardDisplayViewController class]]){
        CardDisplayViewController *cdvc = (CardDisplayViewController *)segue.destinationViewController;
        cdvc.suit = self.suit;
        cdvc.rank = self.rank;
        cdvc.title = [[self rankAsString] stringByAppendingString:self.suit];
      }
    }
  }

  - (NSString *)rankAsString{
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"][self.rank];
  }

  - (NSString *)suit{
    return [self.suitSegmentedControl titleForSegmentAtIndex:self.suitSegmentedControl.selectedSegmentIndex];
  }

  -(void)setRank:(NSUInteger)rank{
    _rank = rank;
    self.rankLabel.text = [self rankAsString];
  }
  - (IBAction)changeRank:(UISlider *)sender {
    // need to round because slider's value is a float
    self.rank = round(sender.value);
  }
@end
