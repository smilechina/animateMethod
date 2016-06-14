//
//  CoreAnimationEffect.m
//  TestAnimation
//
//  Created by apple  on 13-8-6.
//  Copyright (c) 2013年 apple . All rights reserved.
//

#import "CoreAnimationEffect.h"

@implementation CoreAnimationEffect

#pragma mark
#pragma mark CATransition
/**
 *  显示动画
 *
 *  @param type           动画过渡类型
 *  @param subType        动画过渡方向(子类型)
 *  @param duration       动画持续时间
 *  @param timingFunction 动画定时函数属性
 *  @param theView        需要添加动画的view.
 */
+ (void)showAnimationType:(NSString *)type
             withSubType:(NSString *)subType
                duration:(CFTimeInterval)duration
          timingFunction:(NSString *)timingFunction
                    view:(UIView *)theView

{
    CATransition *animation = [CATransition animation];
   
    animation.duration = duration;
    
    /*
     timingFunction
     
     用于变化起点和终点之间的插值计算,形象点说它决定了动画运行的节奏,比如是均匀变化(相同时间变化量相同)还是先快后慢,先慢后快还是先慢再快再慢.
     动画的开始与结束的快慢,有五个预置分别为(下同):
     
     kCAMediaTimingFunctionLinear            线性,即匀速
     kCAMediaTimingFunctionEaseIn            先慢后快
     kCAMediaTimingFunctionEaseOut           先快后慢
     kCAMediaTimingFunctionEaseInEaseOut     先慢后快再慢
     kCAMediaTimingFunctionDefault           实际效果是动画中间比较快.
     
     如果效果不满足，可以自行实现CAMediaTimingFunction
     */
    animation.timingFunction = [CAMediaTimingFunction functionWithName:timingFunction];
    
    /*
     fillMode
     
     决定当前对象过了非active时间段的行为,比如动画开始之前,动画结束之后.
    
     kCAFillModeRemoved   默认,当动画开始前和动画结束后,动画对layer都没有影响,动画结束后,layer会恢复到之前的状态
     kCAFillModeForwards  当动画结束后,layer会一直保持着动画最后的状态
     kCAFillModeBackwards 和kCAFillModeForwards相对
     kCAFillModeBoth      kCAFillModeForwards和kCAFillModeBackwards在一起的效果
    */
    animation.fillMode = kCAFillModeForwards;
    
    /*
     removedOnCompletion
     
     这个属性默认为YES.一般情况下,不需要设置这个属性.
     但如果是CAAnimation动画,并且需要设置 fillMode 属性,那么需要将 removedOnCompletion 设置为NO,否则fillMode无效
     */
    animation.removedOnCompletion = NO;
    
    /*
     type
    
     各种动画效果, 其中除了'fade', 'moveIn', 'push' , 'reveal',其他属于似有的API(可以点进去看下注释).
     上面四个可以分别使用'kCATransitionFade', 'kCATransitionMoveIn', 'kCATransitionPush', 'kCATransitionReveal'来调用.
     
     @"cube"                     立方体翻滚效果
     @"moveIn"                   新视图移到旧视图上面
     @"reveal"                   显露效果(将旧视图移开,显示下面的新视图)
     @"fade"                     交叉淡化过渡(不支持过渡方向) (默认为此效果)
     @"pageCurl"                 向上翻一页
     @"pageUnCurl"               向下翻一页
     @"suckEffect"               收缩效果，类似系统最小化窗口时的神奇效果(不支持过渡方向)
     @"rippleEffect"             滴水效果,(不支持过渡方向)
     @"oglFlip"                  上下左右翻转效果
     @"rotate"                   旋转效果
     @"push"
     @"cameraIrisHollowOpen"     相机镜头打开效果(不支持过渡方向)
     @"cameraIrisHollowClose"    相机镜头关上效果(不支持过渡方向)
     */

    animation.type = type;
    
    /**
     subtype
     
     各种动画方向
     kCATransitionFromRight;      同字面意思(下同)
     kCATransitionFromLeft;
     kCATransitionFromTop;
     kCATransitionFromBottom;
    
     当type为@"rotate"(旋转)的时候,它也有几个对应的subtype,分别为:
     
     90cw    逆时针旋转90°
     90ccw   顺时针旋转90°
     180cw   逆时针旋转180°
     180ccw  顺时针旋转180°
     
     */
    
    animation.subtype = subType;
    [theView.layer addAnimation:animation forKey:nil];
    
}

#pragma mark
#pragma mark BeginAnimations
/**
 *  左翻转
 *
 *  @param view     view
 *  @param duration 动画时间
 */
+ (void)animationFlipFromLeft:(UIView *)view
                     duration:(CFTimeInterval)duration
{
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDuration:duration];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:view cache:NO];
    [UIView commitAnimations];
    
}

/**
 *  右翻转
 *
 *  @param view     view
 *  @param duration 动画时间
 */
+ (void)animationFlipFromRigh:(UIView *)view
                     duration:(CFTimeInterval)duration
{
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDuration:duration];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:view cache:NO];
    [UIView commitAnimations];
    
}
/**
 *  上翻页
 *
 *  @param view     view
 *  @param duration 动画时间
 */
+ (void)animationCurlUp:(UIView *)view
               duration:(CFTimeInterval)duration
{
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDuration:duration];
    [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:view cache:NO];
    [UIView commitAnimations];
    
}

/**
 *  下翻页
 *
 *  @param view     view
 *  @param duration 动画时间
 */
+ (void)animationCurlDown:(UIView *)view
                 duration:(CFTimeInterval)duration
{
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDuration:duration];
    [UIView setAnimationTransition:UIViewAnimationTransitionCurlDown forView:view cache:NO];
    [UIView commitAnimations];
    
}

#pragma mark
#pragma mark AnimationByTransfrom

+ (void)animationByTransform:(UIView *)view
                    duration:(CFTimeInterval)duration
{
    /**
     * CGAffineTransformMakeTranslation 移动
     * CGAffineTransformMakeScale       放大缩小
     * CGAffineTransformMakeRotate      旋转
     */

    [UIView animateWithDuration:duration animations:^{
        
        view.transform = CGAffineTransformMakeScale(0.1, 0.1);

    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:duration animations:^{
            view.transform = CGAffineTransformMakeScale(1.0, 1.0);
        }];

    }];
  
    
}

#pragma mark
#pragma mark AnimationByTransfrom3D

/**
 *  通过Transform3D实现动画
 *
 *  @param view     view
 *  @param duration 动画时间
 */
+ (void)animationByTransform3D:(UIView *)view
                      duration:(CFTimeInterval)duration
{
    
    [UIView animateWithDuration:duration animations:^{

        CATransform3D transform = CATransform3DIdentity;
        transform = CATransform3DMakeTranslation(0.2, 0.2, 0.2);
        view.layer.transform = transform;
    
    }];
    
}

#pragma mark 
#pragma mark CAAnimationGroup
/**
 *  CAAnimationGroup动画组，组合动画
 *  这只是一个用例，因为这种组合实在是太多了，卓要讲解一下，用法。
 *  @param view 动画view
 */
+ (void)animationRotateAndScaleDownUp:(UIView*)view
{
    
    
    CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    /**
     KeyPath实际上是一个键-值编码协议的扩展,参数必须是CALayer的某一项属性,
     你的代码会对应的去改变该属性的效果
    
     例如 
     @"transform.rotation.z" 就是围绕z轴旋转,旋转的单位是弧度.
     @"opacity" 去修改透明度
     
     */
    
    rotationAnimation.toValue = [NSNumber numberWithFloat:(2 * M_PI) *2];
    /**
     value 有3种
     fromValue(开始值), toValue(结束值), byValue(偏移值),
     这三个属性最多只能同时设置两个;
     */
    
    rotationAnimation.duration = 0.35f;
    rotationAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.toValue = [NSNumber numberWithFloat:0.0];
    scaleAnimation.duration = 0.35f;
    scaleAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    
    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
    //动画时间
    animationGroup.duration = 0.35f;
    
    //动画完成后自动重新开始,默认为NO.
    animationGroup.autoreverses = YES;
    
    //动画重复次数
    animationGroup.repeatCount = 1;
   
    //设置动画组
    animationGroup.animations = [NSArray arrayWithObjects:rotationAnimation,scaleAnimation,nil];
    [view.layer addAnimation:animationGroup forKey:@"animationGroup"];
    
    //如果你需要在动画group执行结束后保存动画效果的话
    //设置 fillMode 属性,并且把removedOnCompletion 设置为NO,同上

}

@end
