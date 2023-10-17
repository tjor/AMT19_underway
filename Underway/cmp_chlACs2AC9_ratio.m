# compute stats for ACs 2 AC9 chl correction


# find matching times for AC9 and ACS
[~, iACS, iAC9] = intersect(amt_optics.acs.time, amt_optics.ac9.time);

# find when ACS is not nan
inotnan = find(~isnan(amt_optics.acs.chl(iACS)) & ~isnan(amt_optics.ac9.chl(iAC9)));

chlACs = amt_optics.acs.chl(iACS(inotnan));
chlAC9 = amt_optics.ac9.chl(iAC9(inotnan));



# check if ratio depends on chl 
disp(sprintf("\ncorrelation coefficient between chlACs and ratio chlACs:chlAC9 = %0.3f\n", corr(chlACs, chlACs./chlAC9))) 

plot(chlACs./chlAC9)
ylim([0,1])

# compute median value of ACS:AC9
# chlACs2AC9 = [median(chlACs./chlAC9) prcrng(chlACs./chlAC9)];
# no overlap period with `good ACS data' in AMT 1
#chlACs2AC9 = [0.755846   0.016054]; # coeffs from AMT 28 
chlACs2AC9 = [0.69   0.016]; # coeffs from Dall Olmo 2012 (based on AMT 22 and AMT 19)

# save ratio to to file
#save("-ascii", [OUT_PROC UWAY_DIR "chlACs2AC9_median_prcrng.dat"], "chlACs2AC9");


# add new chl_adj variable to ac9 structure
amt_optics.ac9.chl_adj = amt_optics.ac9.chl * chlACs2AC9(1);







