
function     [x y]=findpoints1()
% I=SampleImg;
 global I;
% figure;
% imshow(I);
global a2y;
global x4;
global maxindxnose; 
         
% % *****************************FACE DETECTION************************
             
%  BW=im2bw(I,0.43);
% % figure,imshow(BW)
% 
% %%%%% minimisation of background portion
% 
% [n1 n2]=size(BW);
% r=floor(n1/10);
% c=floor(n2/10);
% x1=1;x2=r;
% s=r*c;
% 
% for i1=1:10
%     y1=1;y2=c;
%     for j1=1:10
%         if (y2<=c | y2>=9*c) | (x1==1 | x2==r*10)
%             loc=find(BW(x1:x2, y1:y2)==0);
%             [o p]=size(loc);
%             pr=o*100/s;
%             if pr<=100
%                 BW(x1:x2, y1:y2)=0;
%                 r1=x1;r2=x2;s1=y1;s2=y2;
%                 pr1=0;
%             end
% %             imshow(BW);
%         end
%             y1=y1+c;
%             y2=y2+c;
%     end
%     
%  x1=x1+r;
%  x2=x2+r;
% end
% %%%%%%%%%%%%%%% detection of face object%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% L = bwlabel(BW,8);
% BB  = regionprops(L,'BoundingBox');
% BB1=struct2cell(BB);
% BB2=cell2mat(BB1);
% 
% [s1 s2]=size(BB2);
% mx=0;
% for k1=3:4:s2-1
%     p=BB2(1,k1)*BB2(1,k1+1);
%     if p>mx & (BB2(1,k1)/BB2(1,k1+1))<1.8
%         mx=p;
%         j1=k1;
%     end
% end
% % figure,imshow(i);
% BB2(1,j1-2);
% BB2(1,j1-1);
% BB2(1,j1);
% BB2(1,j1+1);
% hold on;
% 
% % rectangle('Position',[BB2(1,j-2),BB2(1,j-1),BB2(1,j),BB2(1,j+1)],'EdgeColor','r' )
% %  rectangle('Position',[81 71 109 135],'EdgeColor','r' )
% % rectangle('Position',[i(1,j-2),i(1,j-1),i(1,j),i(1,j+1)],'EdgeColor','r')
%   newph=L(90:80+150,75:80+113);
%   newph1=I(90:80+150,75:80+113);
% 
% for a=1:1:s1
%     for b=1:1:s2
%         if BB2(a,b)~=1 & BB2(a,b)~=0
%             i1(a,b)=200;
%         end
%     end
% end
    
% ******************** preprocesing ********************************************

         FResize=imresize(I,[128 128]);
         FSmooth = fspecial('average', [1 5]);
         FSmooth1=imfilter(FResize,FSmooth);
         FH1=histeq(FSmooth1);
       FH=im2bw(FH1,0.33);
         [row col depth]=size(FH);
%          figure;
%          imshow(FH);
 %////////////////////////////////////////////////////////////////        
 
for y=1:1:col
    H(y)=((sum(FH(y,1:row))));
end
h3 = fspecial('average', [5 5]);
f2h=imfilter(H,h3);
% plot(H)
% figure;
% figure;
% plot(f2h)

%/////////////////////x-eyebrow ////////////////////////////////
   for y=2:1:col-1
       if f2h(y-1)>=f2h(y)
           if f2h(y+1)>f2h(y)
               aw=f2h(y);
               y6=y;
               break;
           end
           
       end  
   end
%    y6
      min7=int16(y6); %int16(aw)
   

 % /////////////////////////// x-eye ///////////////////////////////////
     for y=y6+1:1:col
       if f2h(y-1)>=f2h(y)
           if f2h(y+1)>f2h(y)
               qa=y;
               break;
           end
           
       end  
     end
      min8=int16(qa);
%     newph1(min7,1:row)=255;
%     newph1(min8,1:row)=255;
%   figure;
%   imshow(newph1)  

  %/////////////////////////// x-mouth //////////////////////////////
  
  foundinx=0;
for y=col-5:-1:2
      if f2h(y-1)>f2h(y) && f2h(y+1)>f2h(y)
           foundinx=foundinx+1;
           if foundinx==2
              max=f2h(y);
              maxindx=y-10;
              break;
           end
      end
 end   
   
  f2h(min7)=0;
  f2h(min8)=0;
  f2h(maxindx)=0;
%   figure
%   plot(f2h)

% ////////////////////////Y-CORNER-LIP////////////////////////////

%  newph1(maxindx-17:maxindx+17,1:col)=255;
   for x=maxindx-15:1:maxindx+15
   VLIP(x)=(sum(FH(1:col,x)));
   end
hLIP = fspecial('average', [5 5]);
f3vLIP=imfilter(VLIP,hLIP);
% figure;
% plot(f3vLIP)
   for x=(row/2)-1:-1:2
       if f3vLIP(x-24)<=f3vLIP(x-23) 
            if f3vLIP(x-22)<=f3vLIP(x-23)          
               minLIP1=f3vLIP(x-23);
               xLIP1=x-53;
               break;     
            end
       end
   end
    min1LIP1=int16(xLIP1);
%    newph1(1:col,min1LIP1)=200;
       
        for x=(row/2)+1:1:row-1
       if f3vLIP(x-30)<=f3vLIP(x-29) 
            if f3vLIP(x-28)<=f3vLIP(x-29)          
               minLIP2=f3vLIP(x-29);
               xLIP2=x-6;
               break;     
            end
       end
   end
    min1LIP2=int16(xLIP2);
%        newph1(1:col,min1LIP2)=200;
% //////////////////////X-MOUTH-UP AND X-MOUTH-DOWN/////////////////////////////////

 maxindxUP=maxindx-6;
 maxindxIN=maxindx+6;
%   newph1(maxindxUP,1:row)=255;
%    newph1(maxindxIN,1:row)=255;
   
%  /////////////////////////X-NOSE-1//////////////////////////////
  foundinxnose=0;
for y=maxindx-1:-1:2
      if f2h(y-1)>f2h(y) && f2h(y+1)>f2h(y)
           foundinxnose=foundinxnose+1;
           if foundinxnose==2
              max=f2h(y);
              maxindxnose=y+5;
              break;
           end
      end
end 
% newph1(maxindxnose,1:row)=100;
f2h(maxindxnose)=0;
% ////////////////////////////X-NOSE-2//////////////////////////

xnose2=maxindxnose-10;
% newph1(xnose2,1:row)=100;
%  ///////////////////////////////////////////////////////////////////

VH=min8-min7;
start1=int32(min7-0.2*VH);
end1=int32(min8+0.8*VH);
% newph1(15:45+10,1:col)=255;
% figure;
% imshow(newph1);
   for x=15:1:45+10
   V1(x)=(sum(FH(1:col,x)));
   end
h41 = fspecial('average', [5 5]);
f3v1=imfilter(V1,h41);
% figure;
% plot(f3v1)
% 
% //////////////////////Y-EYE-right-CORNER ////////////////////////////////////

    for x=55:-1:2
       if f3v1(x-1)<=f3v1(x) && f3v1(x+1)<=f3v1(x)
                     
               min12=f3v1(x);
               x31=x*2-10;
               break;     
       end
%        end
    end
  x31;
   min13=int16(min12);
%      newph1(1:col,x31)=100;
%    figure;
%    imshow(newph1) 
%    
% ////////////////////Y-EYE-LEFT-CORNER//////////////////////////////

   for x=10:1:56
       if f3v1(x-1)<=f3v1(x) && f3v1(x+1)<=f3v1(x)
%             if           
               min12=f3v1(x);
               x32=x;
               break;     
            end
%        end
    end
    x32;
   min13=int16(min12);
%       newph1(1:col,x32)=100;
%    figure;
%    imshow(newph1) 
%    
% ///////////////////////////////////////////////////////////////////
  
   for x=1:1:row
       V(x)=(sum(FH(1:col,x)));
   end
% plot(V)
% figure;
    h4 = fspecial('average', [5 5]);
    f3v=imfilter(V,h4);
   
    %////////////////// y-eye-left /////////////////////////////

%     figure;
%     plot(f3v)

    for x=(row/2)-16:-1:2
       if f3v(x-1)>f3v(x) 
            if f3v(x+1)>f3v(x)          
               min12=f3v(x);
               x3=x-6;
                a2y=x3;
               break;     
            end
       end
    end
%    x1
   min13=int16(min12);
%    newph1(1:col,x3)=255;
%    figure;
%    imshow(newph1)  
  
  %////////////// y-eye-right ///////////////////////////////////
  
   for x=(row/2)+15:1:row-1
       if f3v(x+1)>f3v(x) 
         if f3v(x-1)>f3v(x)
          
       min3=f3v(x);
       min4=int16(min3);
       x4=x
      break;
        end
       end
   end
%    x2
%    min4=int16(min3);
%    newph1(1:col,x4)=255;
 

%  /////////////////////OTHER POINT////////////////////////////
  a2x=min8-((min8-min7)/3);
  a4x=min8+((min8-min7)/3);
%   a2y=x3;
%   a4y=x4;
 a2x=int16(a2x);
 a4x=int16(a4x);

%  ////////////////////////// Other Points //////////////////////////////////////////
 
%  x(1)=newph1(min8-1:min8+1);
%  y(1)=newph1(x3-1:x3+1);
 x(1)=FH1(min8-1);
 y(1)=FH1(abs(a2y-1));
 
%  x(2)=newph1(a2x-1:a2x+1);
%  y(2)=newph1(x3-1:x3+1);
 x(2)=FH1(a2x-1);
 y(2)=FH1(abs(a2y-1));
 
%  x(311)=newph1(a4x-1:a4x+1);
%  y(311)=newph1(x3-1:x3+1);
 x(311)=FH1(a4x-1);
 y(311)=FH1(abs(a2y-1));
 
%  x(41)=newph1(min8-1:min8+1);
%  y(41)=newph1(x32-1:x32+1);
 x(41)=FH1(min8-1);
 y(41)=FH1(x32-1);
 
%  x(5)=newph1(min8-1:min8+1);
%  y(5)=newph1(((x3+15)-1:(x3+15)+1));
 x(5)=FH1(min8-1);
 y(5)=FH1((a2y+15)-1);
 
%  x(6)=newph1(min8-1:min8+1);
%  y(6)=newph1(x4-1:x4+1);
 x(6)=FH1(min8-1);
 y(6)=FH1(x4-1);
 
%  x(71)=newph1(min8-1:min8+1);
%  y(71)=newph1(x31-1:x31+1);
 x(7)=FH1(min8-1);
 y(7)=FH1(x31-1);
 
%  x(8)=newph1(a2x-1:a2x);
%  y(8)=newph1(x4-1:x4+1);
 x(8)=FH1(a2x-1);
 y(8)=FH1(x4-1);
 
%  x(9)=newph1(a4x-1:a4x+1);
%  y(9)=newph1(x4-1:x4+1);
 x(9)=FH1(a4x-1);
 y(9)=FH1(x4-1);

%  x(10)=newph1(min8-1:min8+1);
%  y(10)=newph1((x4-12)-1:(x4-12)+1);
 x(10)=FH1(min8-1);
 y(10)=FH1((x4-12)-1);
 
%  x(11)=newph1(min7-1:min7+1);
%  y(11)=newph1(x32-1:x32+1);
 x(11)=FH1(min7-1);
 y(11)=FH1(x32-1);
 
%  x(12)=newph1(min7-1:min7+1);
%  y(12)=newph1(x3-1:x3+1);
 x(12)=FH1(min7-1);
 y(12)=FH1(abs(a2y-1));
 
%  x(13)=newph1(min7-1:min7+1);
%  y(13)=newph1((x3+15)-1:(x3+15)+1);
 x(13)=FH1(min7-1);
 y(13)=FH1((a2y+15)-1);
 
%  x(14)=newph1(min7-1:min7+1);
%  y(14)=newph1(x31-1:x31+1);
 x(14)=FH1(min7-1);
 y(14)=FH1(x31-1);
 
%  x(15)=newph1(min7-1:min7+1);
%  y(15)=newph1(x4-1:x4+1);
 x(15)=FH1(min7-1);
 y(15)=FH1(x4-1);
 
%  x(16)=newph1(min8-1:min8+1);
%  y(16)=newph1((x4-12)-1:(x4-12)+1);
 x(16)=FH1(min8-1);
 y(16)=FH1((x4-12)-1);
 
  xa16=int16((0.15*128)/2);
%  x(17)=newph1(xa16-1:xa16+1);
%   y(17)=newph1(x3-1:x3+1);
 x(17)=FH1(xa16-1);
 y(17)=FH1(abs(a2y-1));
  
  w=128/2;
%  x(18)=newph1(xa16-1:xa16+1);
%  y(18)=newph1(w-1:w+1);
 x(18)=FH1(xa16-1);
 y(18)=FH1(w-1);
 
%  x(19)=newph1(xa16-1:xa16+1);
%  y(19)=newph1(x4-1:x4+1);
 x(19)=FH1(xa16-1);
 y(19)=FH1(x4-1);
 
%  x(20)=newph1(min8-1:min8+1);
%  y(20)=newph1(w-1:w+1);
 x(20)=FH1(min8-1);
 y(20)=FH1(w-1);
 
%  x(21)=newph1((row/2)-1:(row/2)+1);
%  y(21)=newph1(x32-1:x32+1);
 x(21)=FH1((row/2)-1);
 y(21)=FH1(x32-1);
 
%  x(22)=newph1((row/2)-1:(row/2)+1);
%  y(22)=newph1(x31-1:x31+1);
 x(22)=FH1((row/2)-1);
 y(22)=FH1(x31-1);
 
%  x(23)=newph1(xnose2-1:xnose2+1);
%  y(23)=newph1(w-1:w+1);
 x(23)=FH1(xnose2-1);
 y(23)=FH1(w-1);
 
%  x(24)=newph1(maxindxnose-1:maxindxnose+1);
%  y(24)=newph1((x3+15)-1:(x3+15)+1);
 x(24)=FH1(maxindxnose-1);
 y(24)=FH1((a2y+15)-1);
 
%  x(25)=newph1(maxindxnose-1:maxindxnose+1);
%  y(25)=newph1((x4-12)-1:(x4-12)+1);
x(25)=FH1(maxindxnose-1);
 y(25)=FH1((x4-12)-1);
 
%  x(26)=newph1(maxindx-1:maxindx+1);
%  y(26)=newph1(min1LIP1-1:min1LIP1+1);
 x(26)=FH1(maxindx-1);
 y(26)=FH1(min1LIP1-1);
 
%  x(27)=newph1(maxindxUP-1:maxindxUP+1);
%  y(27)=newph1(w-1:w+1);
 x(27)=FH1(maxindxUP-1);
 y(27)=FH1(w-1);
 
%  x(28)=newph1(maxindx-1:maxindx+1);
%  y(28)=newph1(min1LIP2-1:min1LIP2+1);
 x(28)=FH1(maxindx-1);
 y(28)=FH1(min1LIP2-1);
 
%  x(29)=newph1(maxindxIN-1:maxindxIN+1);
%  y(29)=newph1(w-1:w+1);
 x(29)=FH1(maxindxIN-1);
 y(29)=FH1(w-1);
 
%  x(30)=newph1(maxindx-1:maxindx+1);
%  y(30)=newph1(x32-1:x32+1);
 x(30)=FH1(maxindx-1);
 y(30)=FH1(x32-1);
 
%  x(31)=newph1(maxindx-1:maxindx+1);
%  y(31)=newph1(x31-1:x31+1);
 x(31)=FH1(maxindx-1);
 y(31)=FH1(x31-1);
 
%  x(32)=newph1((128-maxindxIN)-1:(128-maxindxIN)+1);
%  y(32)=newph1(x3-1:x3+1);
 x(32)=FH1((128-maxindxIN)-1);
 y(32)=FH1(abs(a2y-1));
 
%  x(33)=newph1(127-1:127+1);
%  y(33)=newph1(w-1:w+1);
 x(33)=FH1(127-1);
 y(33)=FH1(w-1);
 
%  x(34)=newph1((128-maxindxIN)-1:(128-maxindxIN)+1);
%  y(34)=newph1(x4-1:x4+1);
 x(34)=FH1((128-maxindxIN)-1);
 y(34)=FH1(x4-1);
 