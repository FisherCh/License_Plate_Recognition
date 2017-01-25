clear all
close all
clc
[FileName,PathName]=uigetfile('Picture\*.jpg','Select an License Plate image');
pic_Ori=imread([PathName FileName]); % Read the selected image.
figure(1);subplot(2,2,1),imshow(pic_Ori),title('The original picture');
%% Pretreatment of Image.
pic_BW = im2bw(pic_Ori(:,:,3)-pic_Ori(:,:,1),0.3);
subplot(2,2,2),imshow(pic_BW),title('The Binary picture');
% Reduce the noise
% cut the License Plate area.
Level = sum(pic_BW)>0;subplot(2,2,3);plot(Level) %
Level_= find(Level>0);Left = Level_(1); Right = Level_(end);
Vertical = sum(pic_BW,2)>0;subplot(2,2,4);plot(Vertical)
Vertical_= find(Vertical>0);Up = Vertical_(1);Down = Vertical_(end);
Rate = (Right - Left)/(Down - Up);
if 3.5<Rate && Rate<4.5 % which means that it mere contains one license plate
    License = pic_Ori(Up:Down,Left:Right,:);
    figure(2);imshow(License)
end
