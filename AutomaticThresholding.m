clc;
clear all;
close all;

% =========  Automatic Thresholding Using Iterative Thresholding  =========%

resim=input('Please enter number for desired object image\n 1:Duck\n 2:Tennis Ball\n 3:Candy Box\n 4:Cameraman\n 5:Butterfly\n 6:Planes\n');
img = imread(sprintf('%d.png',resim));
[row,col,channel]=size(img);

if channel==3
    img=double(rgb2gray(img));
else
    img=double(img);
end

figure (1)
imshow(uint8(img)), title('Original Image')
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);



% Average intensity level set as threshold     (Step 1)
Threshold = (min(img(:)) + max(img(:)))*0.5;

deltaT = 0.1; % Decisioning when iteration will satisfy (Delta of Thresholds)
done = false; % Loop terminator
counter = 1;  % Initial value set for oldThreshold value counter

while ~done
    
  % Keeping old thresholds
  oldThresholds(counter) = Threshold;
  
  % Partitioning into regions                  (Step 2)
  binimg = img >= Threshold;
  Tnext = 0.5*(mean(img(binimg)) + mean(img(~binimg)));
  
  % Comparing old threshold and new threshold  (Step 3)
  done = abs(Threshold - Tnext) < deltaT;
  Threshold = Tnext;
  
  % Display binary image
  figure (2)
  subplot(1, 2, 1);
  imshow(binimg);
  title('Binary Image');
  
  % Plot savedThresholds
  subplot(1, 2, 2);
  plot(oldThresholds, 'b*-', 'MarkerSize', 15, 'LineWidth', 2);
  grid on;
  title('Thresholds');
  xlabel('Iteration');
  ylabel('Threshold');
  
  % Enlarge figure to full screen.
  set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);
  
  % Increment loop interation counter.
  counter = counter + 1;
end
