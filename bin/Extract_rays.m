function [mysray,EveStatloc]=Extract_rays(SAChdr_i)

load allrays.mat

estacion=[SAChdr_i.station.kstnm];
evento=[SAChdr_i.event.kevnm];

index=0;
L=length(allrays);
data=zeros(L,5);
values=allrays(:,1:5);
c=allrays(:,6);
f=allrays(:,5);
a=estacion(3:5);
a=str2num(a);
d=evento(3:5);
d=str2num(d);

for j=1:L   
    b=c(j);
    e=f(j);
  
         if isequal(a,b)  & isequal(d,e)
          index=index+1;

         data(index,:)=values(j,:);
         end
end
indices = find(data(:,2)==0);
data(indices,:) = [];
data(:,1)=1:1:length(data);

EveStatloc=[data(1,2) data(1,3) data(1,4) data(end,2) data(end,3) data(end,4)];
mysray=data;