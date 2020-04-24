clc
clear
close all

%% One-way Analysis of Variance (ANOVA).
% Example #1: Five groups with significant differences means.

[X1, ~] = meshgrid(1:2:10, 1:100);
X1 = X1 + normrnd(0,1,100,5);

myGroups = {'Group#1','Group#2','Group#3','Group#4','Group#5'};

anova1(X1,myGroups)

% The ANOVA table has six columns:
% • The first shows the source of the variability.
% • The second shows the Sum of Squares (SS) due to each source.
% • The third shows the degrees of freedom (df) associated with each source.
% • The fourth shows the Mean Squares (MS) for each source, which is the ratio SS/df.
% • The fifth shows the F statistic, which is the ratio of the MS’s.
% • The sixth shows the p-value, which is derived from the cdf of F. As F increases, the p-value decreases.

% The very small p-value indicates that differences between the column means are highly significant.
% The test strongly supports the alternate hypothesis, that one or more of
% the samples are drawn from populations with different means.



%% Two-way Analysis of Variance (ANOVA).
% Example #2: Content of Pb in air in 5 different urban zones revealed every 6 hours during the day

X2 = [28 25 30 22 26;
    34 32 37 31 30;
    22 21 24 20 19;
    36 31 40 33 29];

[P,ANOVATAB,STATS] = anova2(X2);

figure;
Urban_COMPARISON = multcompare(STATS, 'estimate', 'column');

figure;
time_COMPARISON = multcompare(STATS, 'estimate', 'row');
