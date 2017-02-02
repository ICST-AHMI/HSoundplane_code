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



%ROW: [sample_id column row key_timestamp trial_timestamp force]

%IMPORTANT: LAST ROW REFERS TO [30 x], SAME COORDINATE OF BEFORE-LAST
% (column gets reset to 1 on finger_up)

data(end, 2:3) = data(end-1, 2:3);

%sort rows (may have been stored in different order)

%sort on columns, then on rows
data = sortrows(data,[5 2 3]); %NOTE sort on trial_timestamp instead?




% % CHECK THIS: it may not be true
% % for now, it may be just that some 6-ples are not stored in 
% % the right order 
% 
% %clean up data:
% % first column represents the index of consecutive timestamps if they're
% % not in order, they're wrong values n.b. check those exceeding the
% % expected (looks like it's the only case) + delete values over 2000 ms
% % (unlikely)
% for i=1:length(data)-1
%     if ((data(i,1)>(data(i+1,1)))||(data(i,4)>2000))
%         data(i,:) = 0;
%     end
% end
% 
 
% % if consecutive columns are not adjacent or
% % 2 apart at most, they're wrong
% for i=1:length(data)-1
%     columnGap = abs(data(i+1,2) - data(i,2));
%     if (columnGap > 2)
%         data(i+1,:) = 0;
%     end
% end

%remove first column, index of consecutive timestamps is no longer needed
X = data(:, [2, 3, 4, 5, 6]);
% NOW: [column row key_timestamp trial_timestamp force]

% if (X(1,1) ~= 1)
%     X(1,:) = 0;
% end

%cumulative sum of the timestamps related to the same key position
sameKeyCount = 1;
for i=2:length(X)
    if((X(i,1)==X(i-1,1))&&(X(i,2)==X(i-1,2)))
        sameKeyCount = sameKeyCount + 1;
        X(i,3) = X(i,3) + X(i-1,3);        
        X(i-1,3) = 0;
        %SUM UP FORCES AND AVERAGE ON NUMBER OF TIMESTAMPS
        X(i,5) = X(i,5) + X(i-1,5);
        X(i-1,5) = 0;
    else
        X(i-1,4) = X(i-1,4)/sameKeyCount;
        sameKeyCount = 1;
    end
end

cumulativeTime = double.empty(0,5);

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
% scatter user positions: 
% longer stay -> bigger marker
  dotSizeTime = ceil(repetitionResult(:,3));
% heavier pressure -> bigger marker
  dotSizeForce = ceil(repetitionResult(:,5).*50);%multiplied by 50 to see it

scatter(repetitionResult(:,1),repetitionResult(:,2),dotSizeTime,...
    'MarkerFaceColor',[1 0 0]);
scatter(repetitionResult(:,1),repetitionResult(:,2),dotSizeForce,'filled');

figure; hold on, grid on
axis([1 30 1 30]);
scatter3(repetitionResult(:,1),repetitionResult(:,2),...
    dotSizeForce,dotSizeTime);
plot3(repetitionResult(:,1),repetitionResult(:,2),...
    dotSizeForce);

%onepoles = ones(30,1);
%scatter3(correctTrack(1,:),correctTrack(2,:),onepoles);



