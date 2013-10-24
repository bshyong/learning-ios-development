//
//  AttributedStringViewController.m
//  ShutterBug
//
//  Created by Benjamin Shyong on 10/24/13.
//  Copyright (c) 2013 Benjamin Shyong. All rights reserved.
//

#import "AttributedStringViewController.h"

@interface AttributedStringViewController ()
  @property (weak, nonatomic) IBOutlet UITextView *textView;
@end

@implementation AttributedStringViewController

  - (void)setText:(NSAttributedString *)text
  {
    _text = text;
    self.textView.attributedText = text;
  }

  - (void) viewDidLoad
  {
    [super viewDidLoad];
    self.textView.attributedText = self.text;
  }

@end
