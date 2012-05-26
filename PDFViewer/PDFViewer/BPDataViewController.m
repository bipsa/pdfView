//
//  BPDataViewController.m
//  PDFViewer
//
//  Created by Sebastian Romero on 5/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BPDataViewController.h"

@interface BPDataViewController ()

@end

@implementation BPDataViewController

@synthesize dataObject = _dataObject;
@synthesize viewWrapper = _viewWrapper,
            index = _index;


/**
 * event triggers once the page was fully loaded
 **/
- (void) pageDidLoad:(NSInteger *)pageIndex
{
    
}


- (void)dealloc
{
    [_dataObject release];
    [_viewWrapper release];
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	    
    NSString *pdfPath = [[NSBundle mainBundle] pathForResource:@"Xserve_Guide" ofType:@"pdf"];
    CFURLRef pdfURL = (CFURLRef)[NSURL fileURLWithPath:pdfPath];
    CGPDFDocumentRef document = CGPDFDocumentCreateWithURL(pdfURL);
    pdfView = [[UIPdfView alloc] initWithFrame:self.viewWrapper.frame];
    pdfView.document = document;
    pdfView.delegate = self;
    [self.viewWrapper addSubview:pdfView];
    if(!_index)
        _index = 1;
    pdfView.pageIndex = _index;
}

- (void)viewDidUnload
{
    [self setViewWrapper:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
