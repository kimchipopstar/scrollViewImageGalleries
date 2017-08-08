//
//  ViewController.m
//  ScrollViewImageGalleries
//
//  Created by Jaewon Kim on 2017-08-07.
//  Copyright © 2017 Jaewon Kim. All rights reserved.
//

#import "ViewController.h"
#import "ImageDetailViewController.h"

@interface ViewController () <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *imageScrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property (nonatomic, strong) NSArray<UIImageView*> *imageViews;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(scrollViewTapped:)];
    [self.imageScrollView addGestureRecognizer:tapGesture];
}

-(void)viewDidAppear:(BOOL)animated{

    self.imageViews = @[[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Lighthouse-in-Field"]]
                                          ,[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Lighthouse-night"]]
                                          ,[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Lighthouse-zoomed"]]];
    self.pageControl.numberOfPages = self.imageViews.count;
    
    int i = 0;
    for (UIImageView *imageView in self.imageViews) {
        
        imageView.frame = CGRectMake(self.imageScrollView.frame.size.width * i, 0, self.imageScrollView.frame.size.width, self.imageScrollView.frame.size.height);
        
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        [self.imageScrollView addSubview:imageView];
        
        
        i++;
        
    }
    
    self.imageScrollView.contentSize = CGSizeMake(self.imageScrollView.frame.size.width * self.imageViews.count , self.imageScrollView.frame.size.height);
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([[segue identifier] isEqualToString:@"sagueToDetailView"]) {
        ImageDetailViewController *targetVC = (ImageDetailViewController*)segue.destinationViewController;
        targetVC.image = [self.imageViews[self.pageControl.currentPage] image];
    }
}

-(void)scrollViewTapped:(UITapGestureRecognizer*)sender{
    [self performSegueWithIdentifier:@"sagueToDetailView" sender:sender];
}


#pragma mark - Scroll View Delegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat pageWidth = self.imageScrollView.frame.size.width;
    float fractionalPage = self.imageScrollView.contentOffset.x / pageWidth;
    NSInteger page = lround(fractionalPage);
    self.pageControl.currentPage = page;
}


@end
