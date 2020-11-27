% MICAS Mentor AMS 2020.3
% Based on : Ben Geeraerts, February 26th 2015
% Update : Nektar Xama, Oktober 2020
% 	   Matlab version

D='/esat/micas-data/software/Mentor/ams_2020.3/amsv';
setenv('MGC_AMS_HOME',D);
setenv('PATH', [ D '/modeltech/bin:' D '/bin:' getenv('PATH') ]);
setenv('MGLS_LICENSE_FILE', '1717@licserv');
