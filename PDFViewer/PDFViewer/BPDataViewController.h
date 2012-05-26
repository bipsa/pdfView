//
//  BPDataViewController.h
//  PDFViewer
//
//  Created by Sebastian Romero on 5/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIPdfView.h"

@interface BPDataViewController : UIViewController <UIPdfViewDelegate>{

    @private
        UIPdfView *pdfView;
}
@property (strong, nonatomic) id dataObject;
@property (retain, nonatomic) IBOutlet UIView *viewWrapper;
@property (nonatomic, readwrite) NSUInteger index;
@end
