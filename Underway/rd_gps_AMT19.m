function out = rd_gps_AMT19(fn)

    # function to read gps data for AMT 19
    
    #  Columns in csv are defined as:
    #   Time            lat              lon       tsgtemp     seatemp   cond    salin    fluo    trans   airtemp  press    humid    ptir    stir    ppar    spar      windspeed     winddir 
    
   # time has complex separators; easiest to read file twice (space and comma delim)  

   d = dlmread(fn,'', 4, 0); # space delim
   d = d(1:1440,:); # delete final minute of day to avoid double counting
   
   f = dlmread(fn,',', 4, 0); # comma delim
   f = f(1:1440,:); # delete final minute of day to avoid double counting
   
   date_vector = [ones(length(d),1)*2009, ones(length(d),1)*month(d(1,2)), day(d(:,2)), zeros(length(d),1), [0:1439]',  zeros(length(d),1)];% Y, M ,D ,H ,M ,S
   
   
   out.time = datenum(date_vector)       
   out.lat = d(:,4); # 
   out.lon = f(:,2); # longitude
      

endfunction
