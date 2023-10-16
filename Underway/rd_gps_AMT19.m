function out = rd_gps_AMT19(fn)

    # function to read gps data for AMT 19
    
    #  Columns in csv are defined as:
    #   Time            lat              lon       tsgtemp     seatemp   cond    salin    fluo    trans   airtemp  press    humid    ptir    stir    ppar    spar      windspeed     winddir 
    
   # time has complex separators; easiest to read file twice (space and comma delim)  

   d = dlmread(fn,'', 3, 0);  # space delim 
   d(953:1440,:) = nan  
   #d(1441,:)=[];

   
   f = dlmread(fn,',', 3, 0); # comma delim
   f(953:1440,:) = nan  
   #f(1441,:)=[];
   
   g = dlmread(fn,':', 3, 0); # comma delim
   g(953:1440,:) = nan  
   #g(1441,:)=[];
   
   #keyboard
   date_vector = [ones(length(d),1)*2009, ones(length(d),1)*month(d(1,2)), day(d(:,2)), zeros(length(d),1), [0:1439]',  zeros(length(d),1)];% Y, M ,D ,H ,M ,S
       
 #      date_vector = [ones(length(d),1)*2009, ones(length(d),1)*month(d(1,2)), day(d(:,2)), zeros(length(d),1), [0:951]',  zeros(length(d),1)];% Y, M ,D ,H ,M ,S
   
   out.time = datenum(date_vector)    ;   
   out.lat = imag(g(:,3));
   out.lon = f(:,2); # longitude
   
endfunction
