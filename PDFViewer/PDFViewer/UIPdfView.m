//
//  UIPdfView.h
//  Pronto
//
//  Created by Sebastian Romero on 5/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "UIPdfView.h"


@implementation UIPdfView

@synthesize pageIndex,
document, 
totalPages, 
pdfPage, 
nextPageRect, 
prevPageRect, 
delegate;


/**
 * Handles the setter of the page index
 **/
-(void)setPageIndex:(NSInteger)value
{
    self->pageIndex = value;
    if(self->pageIndex>0)
    {
        [self displayPDFPageNumber:self->pageIndex];
    }
    
}


/**
 * Handles the getter of the page index
 **/
-(NSInteger)getPageIndex
{
    return self->pageIndex;
}


/**
 * Handles the setter of the Document
 **/
-(void)setDocument:(CGPDFDocumentRef)value
{
    self->document = value;
    if(self->document)
    {
        self->totalPages = CGPDFDocumentGetNumberOfPages(self->document);
    }
}


/**
 * Handles the getter of the Document
 **/
-(CGPDFDocumentRef)getDocument
{
    return self->document;
}


/**
 * This method shows the page with a given page index
 **/
- (void) displayPDFPageNumber:(NSInteger)pageNum {
    NSInteger maxPage = CGPDFDocumentGetNumberOfPages(document);
    if((pageNum < 1) || (pageNum > maxPage))
        return;
    pdfPage = CGPDFDocumentGetPage(document, pageNum);
    [self setNeedsDisplay];
    if([delegate respondsToSelector:@selector(pageDidLoad:)])
    {
        [delegate pageDidLoad:&pageNum];
    }
}



/**
 * @private
 * This method calculates the scale according the document size
 * @param documentWidth required parameter with the width of the document
 * @param documentHeight required parameter with the height of the document
 **/
- (float)getPropotion:(float)documentWidth documentHeight:(float)documentHeight rectWidth:(float)rectWidth rectHeight:(float)rectHeight
{
    return (documentWidth > documentHeight)?((rectWidth*100)/documentWidth)/100:((rectHeight*100)/documentHeight)/100;
}



/**
 * This method draws the page on the view 
 */
- (void)drawRect:(CGRect)rect 
{
    CGRect cropRect = CGPDFPageGetBoxRect(pdfPage, kCGPDFCropBox);
    float proportion = [self getPropotion:cropRect.size.width documentHeight:cropRect.size.height rectWidth:rect.size.width rectHeight:rect.size.height];
	CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetRGBFillColor(ctx, 255.0, 255.0, 255.0, 1.0);
	CGContextFillRect(ctx, rect);
	CGContextGetCTM(ctx);
	CGContextScaleCTM(ctx, 1, -1);
	CGContextTranslateCTM(ctx, 0, -rect.size.height);
    CGContextScaleCTM(ctx, proportion, proportion);
	CGContextTranslateCTM(ctx, ((rect.size.width - (cropRect.size.width*proportion))/2), 0);
	CGContextDrawPDFPage(ctx, pdfPage);
}


- (void)dealloc 
{
    [super dealloc];
}


@end
