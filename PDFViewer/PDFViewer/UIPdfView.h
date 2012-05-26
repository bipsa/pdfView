//
//  UIPdfView.h
//  Pronto
//
//  Created by Sebastian Romero on 5/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol UIPdfViewDelegate <NSObject>
- (void) pageDidLoad:(NSInteger *)pageIndex;
@end

@interface UIPdfView : UIView
{
@private
    CGPDFPageRef pdfPage;
    CGRect nextPageRect;
    CGRect prevPageRect;
    id<UIPdfViewDelegate> delegate;
    CGPDFDocumentRef document;
}
/**
 * @property 
 * This method sets the document you want to preview
 **/
@property (getter=getDocument, setter=setDocument:) CGPDFDocumentRef document;
/**
 * @property
 * This method show the assigned page index on the view 
 **/
@property (getter=getPageIndex, setter=setPageIndex:) NSInteger pageIndex;
@property (nonatomic, readonly) NSInteger totalPages;
@property (nonatomic, readwrite) CGPDFPageRef pdfPage;
@property (nonatomic, readwrite) CGRect nextPageRect;
@property (nonatomic, readwrite) CGRect prevPageRect;
@property (nonatomic, assign) id<UIPdfViewDelegate> delegate;
@end
