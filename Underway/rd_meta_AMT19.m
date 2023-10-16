function out = rd_meta_AMT19(fn)

    # function to read meta data for AMT 19
    
    #  Columns in csv are defined as:
    #   Time            lat              lon       tsgtemp     seatemp   cond    salin    fluo    trans   airtemp  press    humid    ptir    stir    ppar    spar      windspeed     winddir 
    
   # time has complex separators; 2nd column of f is lon, 3rd column is tsgtemp, etc...  
   
   f = dlmread(fn,',', 3, 0); # comma delim
   f(953:1440,:) = nan
  # f(1441,:) = []


   d = dlmread(fn,'', 3, 0); # space delim
   d(953:1440,:) = nan
#   d(1441,:) = [];
   date_vector = [ones(length(d),1)*2009, ones(length(d),1)*month(d(1,2)), day(d(:,2)), zeros(length(d),1), [0:1439]',  zeros(length(d),1)];% Y, M ,D ,H ,M ,S
   
  # keyboard
  #    date_vector = [ones(length(d),1)*2009, ones(length(d),1)*month(d(1,2)), day(d(:,2)), zeros(length(d),1), [0:951]',  zeros(length(d),1)];% Y, M ,D ,H ,M ,S

   out.time = datenum(date_vector);    
   out.tsg_temp = f(:,3);  
   out.sst = f(:,4);  
   out.conductivty = f(:,5);  
   out.sal  = f(:,6);  # note - looks like some anomolies in time series
   out.fluo  = f(:,7);  
   out.trans = f(:,8);  
   out.air_temp = f(:,9);  
   out.pressure = f(:,10);  
   out.humidty = f(:,11);  
   out.ptir = f(:,12);  
   out.stir = f(:,13);  
   out.ppar = f(:,14);  
   out.spar = f(:,15); 
   out.windspeed = f(:,16); 
   out.winddir = f(:,17); 


endfunction
