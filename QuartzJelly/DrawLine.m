//
//  DrawLine.m
//  QuartzJelly
//
//  Created by 赵贵 on 16/4/5.
//  Copyright © 2016年 猎暄. All rights reserved.
//

#import "DrawLine.h"
#define JKRadius 70
#define JKTopY 100
#define JKColor(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]


@implementation DrawLine

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
//系统自动调用，视图显示在屏幕时回调用，并且只会调用一次
- (void)drawRect:(CGRect)rect {
    // Drawing code
    //drwaline();
    
    //绘制小黄人
    //1.获取图形上下文，等同于获取窗体句柄
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //2.图形绘制
    drawBody(context,rect);
    drawMouse(context,rect);
    drawEyes(context,rect);
    drawZuoshou(context, rect);
    drawYoushou(context, rect);
    drawZuojiao(context, rect);
    drawYoujiao(context, rect);
    drawZuoxie(context, rect);
    drawYuoxie(context, rect);
    drawShouzhang(context, rect);
    drawKuzi(context, rect);
    drawToufa(context, rect);
    drawKoudai(context, rect);
    
    
    
    //3.显示到View
    CGContextStrokePath(context);
    
}

//身体绘制
void drawBody(CGContextRef context,CGRect rect){
    //上半圆
    CGFloat topX = rect.size.width *0.5;
    CGFloat topY = JKTopY;
    CGFloat topRadius = JKRadius;
    CGContextAddArc(context, topX, topY, topRadius, 0, M_PI, 1);
    
    //线条向下延伸
    CGFloat middleX = topX - topRadius;
    CGFloat middleH = JKTopY;
    CGFloat middleY = topY + middleH;
    CGContextAddLineToPoint(context, middleX, middleY);
    
    //下半圆
    CGFloat bottomX = topX;
    CGFloat bottomY = middleY;
    CGFloat bottomRadius = topRadius;
    CGContextAddArc(context, bottomX, bottomY, bottomRadius, M_PI, 0, 1);
    
    //合并路径
    CGContextClosePath(context);
    
    //设置颜色
    [JKColor(252, 218, 0)set];
    
    //显示
    CGContextFillPath(context);
    
}

//嘴巴绘制
void drawMouse(CGContextRef context,CGRect rect){
    //为贝塞尔曲线设置一个控制点
    CGFloat controlX = rect.size.width *0.5;
    CGFloat controlY = rect.size.height *0.3;
    
    //设置当前点
    CGFloat marginX = 20;
    CGFloat marginY = 15;
    CGFloat currentX = controlX - marginX;
    CGFloat currentY = controlY - marginY;
    CGContextMoveToPoint(context, currentX, currentY);
    
    //设置结束点
    CGFloat endX = controlX + marginX;
    CGFloat endY = currentY;
    
    //绘制贝塞尔曲线
    CGContextAddQuadCurveToPoint(context, controlX, controlY, endX, endY);
    
    //颜色
    [[UIColor blackColor]set];
    
    //显示
    CGContextStrokePath(context);
    
    
}

//眼睛绘制
void drawEyes(CGContextRef context,CGRect rect){
    //黑色绑带 起点、终点坐标
    CGFloat startX = rect.size.width *0.5 - JKRadius;
    CGFloat startY = JKTopY;
    CGContextMoveToPoint(context, startX, startY);
    
    CGFloat endX = startX + 2*JKRadius;
    CGFloat endY = startY;
    CGContextAddLineToPoint(context, endX, endY);
    CGContextSetLineWidth(context, 15);
    
    [[UIColor greenColor]set];
    CGContextStrokePath(context);
    
    //灰色镜框
    [JKColor(61, 62, 66)set];
    CGFloat kRadius = JKRadius *0.4;
    CGFloat kY = startY;
    CGFloat kX = rect.size.width*0.5 - kRadius;
    CGContextAddArc(context, kX+10, kY, kRadius, 0, M_PI*2, 0);
    CGContextFillPath(context);
    
    //眼球白色区域
    [[UIColor whiteColor]set];
    CGFloat whiteRadius = kRadius *0.7;
    CGFloat whiteX = kX;
    CGFloat whiteY = kY;
    CGContextAddArc(context, whiteX + 10, whiteY, whiteRadius, 0, M_PI*2, 0);
    CGContextFillPath(context);
    
    //褐色眼珠区域
    [[UIColor brownColor]set];
    CGFloat yzRadius = whiteRadius *0.5;
    CGFloat yzX = whiteX;
    CGFloat yzY = whiteY;
    CGContextAddArc(context, yzX +10, yzY, yzRadius, 0, M_PI*2, 0);
    CGContextFillPath(context);
    
    
}

//四肢绘制
void drawZuoshou(CGContextRef context,CGRect rect){
    CGFloat startX = rect.size.width *0.5 - JKRadius;
    CGFloat startY = 1.4*JKTopY;
    CGContextMoveToPoint(context, startX, startY);
    
    CGFloat endX = startX - JKRadius;
    CGFloat endY = 2*JKTopY;
    CGContextAddLineToPoint(context, endX, endY);
    CGContextSetLineWidth(context, 5);
    
    [[UIColor blackColor]set];
    CGContextStrokePath(context);
    
}
void drawYoushou(CGContextRef context,CGRect rect){
    CGFloat startX = rect.size.width *0.5 - JKRadius + 2*JKRadius;
    CGFloat startY = 1.4*JKTopY;
    CGContextMoveToPoint(context, startX, startY);
    
    CGFloat endX = startX + JKRadius;
    CGFloat endY = 2*JKTopY;
    CGContextAddLineToPoint(context, endX, endY);
    CGContextSetLineWidth(context, 5);
    
    [[UIColor blackColor]set];
    CGContextStrokePath(context);
    
}
void drawZuojiao(CGContextRef context,CGRect rect){
    CGFloat startX = rect.size.width *0.5 - 0.5*JKRadius;
    CGFloat startY = 2.6*JKTopY;
    CGContextMoveToPoint(context, startX, startY);
    
    CGFloat endX = startX;
    CGFloat endY = 3*JKTopY;
    CGContextAddLineToPoint(context, endX, endY);
    CGContextSetLineWidth(context, 5);
    
    [[UIColor blackColor]set];
    CGContextStrokePath(context);
    
}
void drawYoujiao(CGContextRef context,CGRect rect){
    CGFloat startX = rect.size.width *0.5 + 0.5*JKRadius;
    CGFloat startY = 2.6*JKTopY;
    CGContextMoveToPoint(context, startX, startY);
    
    CGFloat endX = startX;
    CGFloat endY = 3*JKTopY;
    CGContextAddLineToPoint(context, endX, endY);
    CGContextSetLineWidth(context, 5);
    
    [[UIColor blackColor]set];
    CGContextStrokePath(context);
    
}
void drawZuoxie(CGContextRef context,CGRect rect){
    CGFloat topX = rect.size.width *0.5 - 0.5*JKRadius;
    CGFloat topY = 3*JKTopY;
    CGFloat topRadius = 0.3*JKRadius;
    CGContextAddArc(context, topX, topY, topRadius, 0, M_PI, 1);
    
    //合并路径
    CGContextClosePath(context);
    
    //设置颜色
    [JKColor(0, 0, 0)set];
    
    //显示
    CGContextFillPath(context);
}
void drawYuoxie(CGContextRef context,CGRect rect){
    
    CGFloat topX = rect.size.width *0.5 + 0.5*JKRadius;
    CGFloat topY = 3*JKTopY;
    CGFloat topRadius = 0.3*JKRadius;
    CGContextAddArc(context, topX, topY, topRadius, 0, M_PI, 1);
    
    //合并路径
    CGContextClosePath(context);
    
    //设置颜色
    [JKColor(0, 0, 0)set];
    
    //显示
    CGContextFillPath(context);
}
void drawShouzhang(CGContextRef context,CGRect rect){
    //zuo
    CGFloat topX = rect.size.width *0.5 - 2*JKRadius;
    CGFloat topY = 2*JKTopY;
    CGFloat topRadius = 0.1*JKRadius;
    CGContextAddArc(context, topX, topY, topRadius,2*M_PI,0, 1);
    
    //you
    CGFloat bottomX = rect.size.width *0.5 - JKRadius + 3*JKRadius;
    CGFloat bottomY = topY;
    CGFloat bottomRadius = topRadius;
    CGContextAddArc(context, bottomX, bottomY, bottomRadius, 2*M_PI, 0, 1);
    
    //合并路径
    CGContextClosePath(context);
    
    //设置颜色
    [JKColor(0, 0, 0)set];
    
    //显示
    CGContextFillPath(context);
    
}
void drawToufa(CGContextRef context,CGRect rect){
    //toufa
    CGFloat topX = rect.size.width *0.5;
    CGFloat topY = 0.5*JKTopY;
    CGFloat topRadius = 0.4*JKRadius;
    CGContextAddArc(context, topX, topY, topRadius, -0.2, M_PI, 1);
    
    //设置颜色
    [JKColor(291, 81, 73)set];
    
    //显示
    CGContextFillPath(context);
    
}
void drawKuzi(CGContextRef context,CGRect rect){
    //kuzi
    CGFloat bottomX = rect.size.width *0.5;
    CGFloat bottomY = 2*JKTopY;
    CGFloat bottomRadius = JKRadius;
    CGContextAddArc(context, bottomX, bottomY, bottomRadius, M_PI, 0, 1);
    
    //设置颜色
    [JKColor(43, 138, 253)set];
    
    //显示
    CGContextFillPath(context);
    
}
void drawKoudai(CGContextRef context,CGRect rect){
    CGFloat bottomX = rect.size.width *0.5;
    CGFloat bottomY = 2.3*JKTopY;
    CGFloat bottomRadius = 0.5*JKRadius;
    CGContextAddArc(context, bottomX, bottomY, bottomRadius, M_PI, 0, 1);
    
    //设置颜色
    [JKColor(7, 62, 136)set];
    
    //显示
    CGContextFillPath(context);
    
}



//画线
//void drwaline()
//{
//    //1.获取图形上下文，等同于获取窗体句柄
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    
//    //2.图形绘制
//    //设置线段的宽度
//    CGContextSetLineWidth(context, 3);
//    //设置线段颜色
//    CGContextSetRGBStrokeColor(context, 1, 0, 0, 0.8);
//    //设置线条起点
//    CGContextMoveToPoint(context, 10, 10);
//    //画线
//    CGContextAddLineToPoint(context, 100, 100);
//    
//    //3.显示到View
//    CGContextStrokePath(context);
//    
//    //2条线
//    [[UIColor blueColor] set];
//    //设置线条头部和尾部样式
//    CGContextSetLineCap(context, kCGLineCapRound);
//    //设置线条转折点样式
//    CGContextSetLineJoin(context, kCGLineJoinRound);
//    //画线
//    CGContextMoveToPoint(context, 100, 120);
//    CGContextAddLineToPoint(context, 150, 120);
//    CGContextAddLineToPoint(context, 150, 180);
//    //显示到View
//    CGContextStrokePath(context);
//    
//}


@end
