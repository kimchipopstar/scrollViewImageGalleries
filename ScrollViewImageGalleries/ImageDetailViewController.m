//
//  ImageDetailViewController.m
//  ScrollViewImageGalleries
//
//  Created by Jaewon Kim on 2017-08-07.
//  Copyright © 2017 Jaewon Kim. All rights reserved.
//

#import "ImageDetailViewController.h"

@interface ImageDetailViewController () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;


@end

@implementation ImageDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.imageView.image = [UIImage imageNamed:@"Lighthouse-in-Field"];
    
}



#pragma mark - Navigation

-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return self.imageView;
}

@end
