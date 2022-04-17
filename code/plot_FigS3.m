
cnt=1;
%U=1;N=2;H=5;T=3;M=4;
%ss={'U','N','T','M','H'};
%load('../data_save/ycell.mat')
%U=1;N=2;T=4;M=3;
ss={'U','N','M','T'};
load('../data_save/ycell.mat')
for i=1:size(ycell,1)
    for j=1:size(ycell,2)
da{i,j}(:,:)=ycell{i,j}(:,:);
    end
end
%
%1处设的是各维度的最大值没有问题。0处是各点的初始值？

danb=[da{M,T},da{T,N},da{N,U}];
%danb=[da{M,H}];
t=size(danb);
A1=mean(danb,2);

A2=std(danb, 1,2);
A1=repmat( A1 , 1 , t(2) );
A2=repmat( A2 , 1 , t(2) );
danbl=(danb-A1)./A2;
incre=min(danbl,[],2);
scale=round(t(2)/6);dalal=[];
for i=1:17
    danbl(i,:)=danbl(i,:)-incre(i);
end
decre=max(danbl,[],2);
danbl=danbl./decre;
for i=0:4
    dalal(:,i+1)=mean(danbl(:,scale*i+1:scale*i+scale),2);
end
dalal(:,6)=mean(danbl(:,scale*5:end),2);

writetable(table(dalal),'ycelldeal.csv');

for i=1:17
    tanb(i)=max(danb(i,:));
    lanb(i)=min(danb(i,:));
    manb(i)=(tanb(i)+lanb(i))/2;
    danb(i,:)=format(danb(i,:),manb(i));
    %danb(i,:)=(danb(i,:)-lanb(i))./(tanb(i)-lanb(i));
end
figure
imagesc(danb)
colormap jet
%caxis([0 1])
xlabel('Time');
[N,N]=size(danb);
set(gca, 'YTick', 1:N, 'YTickLabel', {'AHR','NFIC','FOS','KLF4','FOXF1','JUN','SMAD3','MITF','SMAD4','MAFB','NR3C1','NR2F1','STAT5A','TBX3','TFE3','ETV5','TFAP2A'})
%set(gca,'Clim',[0 1])
h=colorbar(gca);
set(h, 'Position', [0.915 0.46 0.05 0.160493827160494]);
%{
C=zeros(2,3);
C(1,1)=0;
C(1,2)=0;
C(1,3)=1;
C(2,1)=1;
C(2,2)=1;
C(2,3)=0;
colormap(C);
%}
title('M->T->N->U','position',[120,0.5])
%title('M->H','position',[60,0.5])
xlabel('Time','position',[30,25])
%}
ta={};
la={};
ma={};

%{
figure
for i=1:size(ycell,1)
for j=1:size(ycell,2)
if i~=j
    for k=1:17
    ta{i,j}(k)=max(da{i,j}(k,:));
    la{i,j}(k)=min(da{i,j}(k,:));

    ma{i,j}(k)=(ta{i,j}(k)+la{i,j}(k))/2;
    na{i,j}(k,:)=(da{i,j}(k,:)-la{i,j}(k))./(ta{i,j}(k)-la{i,j}(k));
    da{i,j}(k,:)=format(da{i,j}(k,:),ma{i,j}(k));
    end
end
end
end

tit={'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'};
i=3
    for j=1:size(ycell,2)
        if i~=j
subplot(3,1,cnt)
imagesc(na{i,j})
colormap jet
colorbar
caxis([0 1])
xlabel('Time','FontSize',6);
[N,N]=size(na{1,2});
set(gca, 'YTick', 1:N, 'YTickLabel',  {'AHR','NFIC','FOS','KLF4','FOXF1','JUN','SMAD3','MITF','SMAD4','MAFB','NR3C1','NR2F1','STAT5A','TBX3','TFE3','ETV5','TFAP2A'},'FontSize',6)
set(gca,'Clim',[0 1])
h=colorbar('YTickLabel',{'0','','1'});
set(h, 'Position', [0.915 0.46 0.05 0.160493827160494]);
%{
C=zeros(2,3);
C(1,1)=0;
C(1,2)=0;
C(1,3)=1;
C(2,1)=1;
C(2,2)=1;
C(2,3)=0;
colormap(C);
%}
 title_i=strcat(tit(cnt),':  ',ss(i),'->',ss(j));
 title(title_i);
%title(title_i,'position',[30,0.5])
xlabel('Time');%,'position',[30,19])
cnt=cnt+1
    end
        end

%}
%{
subplot(3,2,2)
da23(:,:)=ycell{2,3}(:,:);





for i=1:17
    ta23(i)=max(da23(i,:));
    la23(i)=min(da23(i,:));
    ma23(i)=(ta23(i)+la23(i))/2;
da23(i,:)=format(da23(i,:),ma23(i));
end
imagesc(da23)
colormap jet
colorbar
caxis([0 1])
xlabel('Time');
[N,N]=size(da23);
set(gca, 'YTick', 1:N, 'YTickLabel', {'Zeb1','Oct4','Mdm2','Snai1','miR145','miR200','miR34','p53','rkip','Let7','Lin28','Bach1','MEK','ERK','CEBP','PPAR'})
%set(gca,'Clim',[0 1])
%h=colorbar('YTickLabel',{'0','','1'});
set(gca,'Clim',[0 1])
h=colorbar(gca,'YTick',[0 0.5 1],'YTickLabel',{'0','','1'});
set(h, 'Position', [0.915 0.46 0.05 0.160493827160494]);
C=zeros(2,3);
C(1,1)=0;
C(1,2)=0;
C(1,3)=1;
C(2,1)=1;
C(2,2)=1;
C(2,3)=0;
colormap(C);
title('B (A->M)','position',[30,0.5])
xlabel('Time','position',[30,19])
%




subplot(3,2,3)
da32(1,:)=ycell{3,2}(1,:);
da32(2,:)=ycell{3,2}(2,:);
da32(3,:)=ycell{3,2}(3,:);
da32(4,:)=ycell{3,2}(4,:);
da32(5,:)=ycell{3,2}(5,:);
da32(6,:)=ycell{3,2}(6,:);
da32(7,:)=ycell{3,2}(7,:);
da32(8,:)=ycell{3,2}(8,:);
da32(9,:)=ycell{3,2}(9,:);
da32(10,:)=ycell{3,2}(10,:);
da32(11,:)=ycell{3,2}(11,:);
da32(12,:)=ycell{3,2}(12,:);
da32(13,:)=ycell{3,2}(13,:);
da32(14,:)=ycell{3,2}(14,:);
da32(15,:)=ycell{3,2}(15,:);
da32(16,:)=ycell{3,2}(16,:);
da32(17,:)=ycell{3,2}(17,:);
for i=1:17
    ta32(i)=max(da32(i,:));
    la32(i)=min(da32(i,:));
    ma32(i)=(ta32(i)+la32(i))/2;
da32(i,:)=format(da32(i,:),ma32(i));
end
imagesc(da32)
colormap jet
colorbar
caxis([0 1])
xlabel('Time');
[N,N]=size(da32);
set(gca, 'YTick', 1:N, 'YTickLabel', {'Zeb1','Oct4','Mdm2','Snai1','miR145','miR200','miR34','p53','rkip','Let7','Lin28','Bach1','MEK','ERK','CEBP','PPAR'})
set(gca,'Clim',[0 1])
%h=colorbar('YTickLabel',{'0','','1'});
%set(gca,'Clim',[0 0.8])
h=colorbar(gca,'YTick',[0 0.5 1],'YTickLabel',{'0','','1'});
set(h, 'Position', [0.915 0.46 0.05 0.160493827160494]);
C=zeros(2,3);
C(1,1)=0;
C(1,2)=0;
C(1,3)=1;
C(2,1)=1;
C(2,2)=1;
C(2,3)=0;
colormap(C);
title('C (M->A)','position',[30,0.5])
xlabel('Time','position',[30,19])




%
subplot(3,2,4)
da21(1,:)=ycell{2,1}(1,:);
da21(2,:)=ycell{2,1}(2,:);
da21(3,:)=ycell{2,1}(3,:);
da21(4,:)=ycell{2,1}(4,:);
da21(5,:)=ycell{2,1}(5,:);
da21(6,:)=ycell{2,1}(6,:);
da21(7,:)=ycell{2,1}(7,:);
da21(8,:)=ycell{2,1}(8,:);
da21(9,:)=ycell{2,1}(9,:);
da21(10,:)=ycell{2,1}(10,:);
da21(11,:)=ycell{2,1}(11,:);
da21(12,:)=ycell{2,1}(12,:);
da21(13,:)=ycell{2,1}(13,:);
da21(14,:)=ycell{2,1}(14,:);
da21(15,:)=ycell{2,1}(15,:);
da21(16,:)=ycell{2,1}(16,:);
for i=1:17
    ta21(i)=max(da21(i,:));
    la21(i)=min(da21(i,:));
    ma21(i)=(ta21(i)+la21(i))/2;
da21(i,:)=format(da21(i,:),ma21(i));
end

imagesc(da21)
colormap jet
colorbar

xlabel('Time');
[N,N]=size(da21);
set(gca, 'YTick', 1:N, 'YTickLabel', {'Zeb1','Oct4','Mdm2','Snai1','miR145','miR200','miR34','p53','rkip','Let7','Lin28','Bach1','MEK','ERK','CEBP','PPAR'})
%set(gca,'Clim',[0 1])
%h=colorbar(gca,'YTick',[0 0.5 1],'YTickLabel',{'0','','1'});
set(gca,'Clim',[0 0.8])
h=colorbar(gca,'YTick',[0 0.4 0.8],'YTickLabel',{'0','','1'});
set(h, 'Position', [0.915 0.46 0.05 0.160493827160494]);
C=zeros(2,3);
C(1,1)=0;
C(1,2)=0;
C(1,3)=1;
C(2,1)=1;
C(2,2)=1;
C(2,3)=0;
colormap(C);
title('D (A->E)','position',[30,0.5])
xlabel('Time','position',[30,19])
%





%
%
subplot(3,2,5)
da13(1,:)=ycell{1,3}(1,:);
da13(2,:)=ycell{1,3}(2,:);
da13(3,:)=ycell{1,3}(3,:);
da13(4,:)=ycell{1,3}(4,:);
da13(5,:)=ycell{1,3}(5,:);
da13(6,:)=ycell{1,3}(6,:);
da13(7,:)=ycell{1,3}(7,:);
da13(8,:)=ycell{1,3}(8,:);
da13(9,:)=ycell{1,3}(9,:);
da13(10,:)=ycell{1,3}(10,:);
da13(11,:)=ycell{1,3}(11,:);
da13(12,:)=ycell{1,3}(12,:);
da13(13,:)=ycell{1,3}(13,:);
da13(14,:)=ycell{1,3}(14,:);
da13(15,:)=ycell{1,3}(15,:);
da13(16,:)=ycell{1,3}(16,:);
for i=1:16
    ta13(i)=max(da13(i,:));
    la13(i)=min(da13(i,:));
    ma13(i)=(ta13(i)+la13(i))/2;
da13(i,:)=format(da13(i,:),ma13(i));
end
imagesc(da13)
colormap jet
colorbar
caxis([0 1])
xlabel('Time');
[N,N]=size(da13);
set(gca, 'YTick', 1:N, 'YTickLabel', {'Zeb1','Oct4','Mdm2','Snai1','miR145','miR200','miR34','p53','rkip','Let7','Lin28','Bach1','MEK','ERK','CEBP','PPAR'})
%set(gca,'Clim',[0 1])
%h=colorbar('YTickLabel',{'0','','1'});
set(gca,'Clim',[0 1])
h=colorbar(gca,'YTick',[0 0.5 1],'YTickLabel',{'0','','1'});
set(h, 'Position', [0.915 0.46 0.05 0.160493827160494]);
C=zeros(2,3);
C(1,1)=0;
C(1,2)=0;
C(1,3)=1;
C(2,1)=1;
C(2,2)=1;
C(2,3)=0;
colormap(C);
title('E (E->M)','position',[30,0.5])
xlabel('Time','position',[30,19])
%






subplot(3,2,6)
%data = [e31;f31;c31;d31;j31;i31;a31;g31];
da31(1,:)=ycell{3,1}(1,:);
da31(2,:)=ycell{3,1}(2,:);
da31(3,:)=ycell{3,1}(3,:);
da31(4,:)=ycell{3,1}(4,:);
da31(5,:)=ycell{3,1}(5,:);
da31(6,:)=ycell{3,1}(6,:);
da31(7,:)=ycell{3,1}(7,:);
da31(8,:)=ycell{3,1}(8,:);
da31(9,:)=ycell{3,1}(9,:);
da31(10,:)=ycell{3,1}(10,:);
da31(11,:)=ycell{3,1}(11,:);
da31(12,:)=ycell{3,1}(12,:);
da31(13,:)=ycell{3,1}(13,:);
da31(14,:)=ycell{3,1}(14,:);
da31(15,:)=ycell{3,1}(15,:);
da31(16,:)=ycell{3,1}(16,:);
for i=1:16
    ta31(i)=max(da31(i,:));
    la31(i)=min(da31(i,:));
    ma31(i)=(ta31(i)+la31(i))/2;
da31(i,:)=format(da31(i,:),ma31(i));
end
  
imagesc(da31)
colormap jet
colorbar
caxis([0 1])
xlabel('Time');
[N,N]=size(da31);
set(gca, 'YTick', 1:N, 'YTickLabel', {'Zeb1','Oct4','Mdm2','Snai1','miR145','miR200','miR34','p53','rkip','Let7','Lin28','Bach1','MEK','ERK','CEBP','PPAR'})
%set(gca,'Clim',[0 1])
%h=colorbar('YTickLabel',{'0','','1'});
set(gca,'Clim',[0.3 0.6])
h=colorbar(gca,'YTick',[0 0.3 0.6],'YTickLabel',{'0','','1'});
set(h, 'Position', [0.915 0.46 0.05 0.160493827160494]);
C=zeros(2,3);
C(1,1)=0;
C(1,2)=0;
C(1,3)=1;
C(2,1)=1;
C(2,2)=1;
C(2,3)=0;
colormap(C);
title('F (M->E)','position',[30,0.5])
xlabel('Time','position',[30,19])
%}





function out=format(a,b)
length=size(a);
for i=1:length(2)
   if a(i)<b
       a(i)=0;
   else
       a(i)=1;
   end
end
out=a;
end


