//
//  AnnotationView.h
//  ARStavropol
//
//  Created by apple on 13.02.17.
//  Copyright © 2017 Vorobyev Stanislav. All rights reserved.
//

#import "ARAnnotationView.h"

@interface AnnotationView : ARAnnotationView

@property (weak, nonatomic) IBOutlet UILabel *distance;

- (void)initWithAnnotation:(ARAnnotation *)annotation;

@end
