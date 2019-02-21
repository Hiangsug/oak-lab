% clear all
% 
% subdata=xlsread('analyze2.xlsx');
% subdata2=[];
% 
% for i=1:size(subdata,1)
%     for j=1:0.5*size(subdata,2)
%         m=j*2-1;
%         subdata2(i,j)=subdata(i,m+1)-subdata(i,m);
%     end
% end

clear all
subdata=xlsread('dataagain.xlsx');

load mycolor2;
% bardata=subdata(1,:);
bardata1=subdata(1:3,:);
% for i=1:3
%     bardata1(i,1:9)=bardata(1,1+9*(i-1):9+9*(i-1));
% end
barerror1=subdata(4:6,:);
% barerror1=zeros(3,9);
% for i=1:3
%     barerror1(i,1:9)=barerror(1,1+9*(i-1):9+9*(i-1));
% end
leg = {['Pos:Neg'],['Pos:Neu'],['Neg:Neu']};
gpname = {['LowArousal-LowInter'],['LowArousal-MediumInter'],['LowArousal-HighInter'],['MediumArousal-LowInter'],['MediumArousal-MediumInter'],['MediumArousal-HighInter'],['HighArousal-LowArousal'],['HighArousal-MediumArousal'],['HighArousal-HighArousal']};
% gpname = {['1'],['2'],['3'],['4'],['5'],['6'],['7'],['8'],['9'];['1'],['2'],['3'],['4'],['5'],['6'],['7'],['8'],['9'];['1'],['2'],['3'],['4'],['5'],['6'],['7'],['8'],['9']};

mytitle = 'Result:Subject';
myxlabel = 'Condition';
myylabel = 'Gaze Duration(ms)';
soa=[1 2 3 4 5 6 7 8 9];

figure(1);
 pic2 = linewitherr(bardata1,barerror1,soa,gpname,mytitle,myxlabel,myylabel,leg,'y');
%  pic3 = linewitherr(bardata1(2,:),barerror1(2,:),soa(1,:),gpname,mytitle,myxlabel,myylabel,leg,'y');
% pic4 = linewitherr(bardata1(3,:),barerror1(3,:),soa,gpname,mytitle,myxlabel,myylabel,leg,'y');
% 
print(1,'-dpng',['Result_AllSub-1']);
    

% figure(1);
% pic1 = barweb(bardata,barerror,1,gpname,mytitle,myxlabel,myylabel,mycolor2,'y',leg,'plot');
% ylim([-550 550]);
% print(1,'-dpng','Plots/Result_Subject');
%     