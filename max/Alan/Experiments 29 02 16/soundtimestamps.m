clear ; close all; clc

%load data from .txt dump

fprintf('Import subject recorded track (press enter):\n')
pause;
filename = uigetfile({'*.txt'});
data = load(filename);
fprintf('Import generated correct track (press enter):\n')
pause;
filename = uigetfile({'*.txt'});
correctTrack = load(filename);

%clean up data: 
% first column represents the index of consecutive timestamps
% if they're not in order, they're wrong values
% n.b. check those exceeding the expected (looks like it's the only case)
% + delete values over 1000 ms (unlikely)
for i=1:length(data)-1
    if ((data(i,1)>(data(i+1,1)))||(data(i,4)>1000))
        data(i,:) = 0;
    end
end

%remove first column, index of consecutive timestamps is no longer needed
X = data(:, [2, 3, 4]);

% if (X(1,1) ~= 1)
%     X(1,:) = 0;
% end

%cumulative sum of the timestamps related to the same key position
for i=2:length(X)
    if((X(i,1)==X(i-1,1))&&(X(i,2)==X(i-1,2)))
        X(i,3) = X(i,3) + X(i-1,3);
        X(i-1,3) = 0;
    end
end

%cumulativeTime = [0 0 0];
cumulativeTime = double.empty(0,3);

% if we accept also vertical movements, store both column and row
% otherwise, store only row (index of cumulativeTime becomes column number)
for i=1:length(X)
    if (X(i,3) ~= 0)
      % cumulativeTime(X(i,1),:) = X(i,:);
      cumulativeTime = [cumulativeTime; X(i,:)];
    end
end

%scatter3(cumulativeTime(:,1),cumulativeTime(:,2),cumulativeTime(:,3));
%plot3(cumulativeTime(:,1),cumulativeTime(:,2),cumulativeTime(:,3));



% 
% %plot
% averageLine = repmat(averageTime, 1, length(cumulativeTime));
% hold on; grid on;
% plot(cumulativeTime(:,3),'color','black');
% plot(averageLine,'color','red');
% hold off;

%calculate error array: 
%for each column, vertical displacement from correct row
error = zeros(length(cumulativeTime), 1);
 for i=1:length(cumulativeTime)
     for j=1:length(correctTrack)
        if (cumulativeTime(i,1)==correctTrack(j,1))
            error(i) = correctTrack(j,2) - cumulativeTime(i,2);
        end
    end
 end

repetitionResult = [cumulativeTime error];

%stats
totalTime = sum(cumulativeTime(:,3));
averageTime = totalTime/length(cumulativeTime);
timeVariance = var(cumulativeTime(:,3));
totalError = sum(abs(error)); %sum over error modules
averageError = totalError/length(error);

%plots
figure; hold on; 
%grid on; grid minor
axis([1 30 1 5]);
plot(correctTrack(:,1), correctTrack(:,2),'--og','LineWidth',2);
%plot(repetitionResult(:,1),repetitionResult(:,2), 'LineWidth',2);
% scatter user positions: loger stay -> bigger marker
dotSize = ceil(repetitionResult(:,3)./10);
scatter(repetitionResult(:,1),repetitionResult(:,2),dotSize,'filled');
%figure; hold on, grid on; grid minor



