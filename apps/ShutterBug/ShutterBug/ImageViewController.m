//
//  ImageViewController.m
//  ShutterBug
//
//  Created by Benjamin Shyong on 10/23/13.
//  Copyright (c) 2013 Benjamin Shyong. All rights reserved.
//

#import "ImageViewController.h"
#import "AttributedStringViewController.h"

@interface ImageViewController () <UIScrollViewDelegate>
  @property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
  @property (weak, nonatomic) IBOutlet UIBarButtonItem *titleBarButtonItem;
  @property (strong, nonatomic) UIImageView *imageView;
  @property (strong, nonatomic) UIPopoverController *urlPopover;
@end

@implementation ImageViewController

  - (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
  {
    if ([identifier isEqualToString:@"Show URL"]) {
      return (self.imageURL && !self.urlPopover.popoverVisible) ? YES : NO;
    } else {
      return [super shouldPerformSegueWithIdentifier:identifier sender:sender];
    }
  }

  - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
  {
    if ([segue.identifier isEqualToString:@"Show URL"]) {
      if ([segue.destinationViewController isKindOfClass:[AttributedStringViewController class]]) {
        AttributedStringViewController *asc = (AttributedStringViewController *)segue.destinationViewController;
        asc.text = [[NSAttributedString alloc] initWithString:[self.imageURL description]];
        if ([segue isKindOfClass:[UIStoryboardPopoverSegue class]]) {
          self.urlPopover = ((UIStoryboardPopoverSegue *) segue).popoverController;
        }
      }
    }
  }

  - (void)setTitle:(NSString *)title
  {
    super.title = title;
    self.titleBarButtonItem.title = title;
  }

  - (void)setImageURL:(NSURL *)imageURL
  {
    _imageURL = imageURL;
    [self resetImage];
  }

  - (void)resetImage
  {
    if (self.scrollView){
      self.scrollView.contentSize = CGSizeZero;
      self.imageView.image = nil;
      NSData *imageData = [[NSData alloc] initWithContentsOfURL:self.imageURL];
      UIImage *image = [[UIImage alloc] initWithData:imageData];
      if (image){
        self.scrollView.zoomScale = 1.0;
        self.scrollView.contentSize = image.size;
        self.imageView.image = image;
        self.imageView.frame = CGRectMake(0, 0, image.size.width, image.size.height);
      }
    }
  }

  - (UIImageView *)imageView
  {
    if (!_imageView) _imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    return _imageView;
  }

  -(UIView *) viewForZoomingInScrollView:(UIScrollView *)scrollView
  {
    return self.imageView;
  }

  - (void)viewDidLoad
  {
    [super viewDidLoad];
    [self.scrollView addSubview:self.imageView];
    self.scrollView.minimumZoomScale = 0.2;
    self.scrollView.maximumZoomScale = 5.0;
    self.scrollView.delegate = self;
    self.titleBarButtonItem.title = self.title;
    [self resetImage];
  }


@end
