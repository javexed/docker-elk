#/bin/bash
if [ ! -f "1_csv_file_input.conf" ] ; then
  echo 'No 1_csv_file_input.conf file, copying sample, please configure'
  cp 1_csv_file_input.conf.sample 1_csv_file_input.conf
fi
if [ ! -f "2_logstash_filter.conf" ] ; then
  echo 'No 2_logstash_filter.conf file, copying sample, please configure'
  cp 2_logstash_filter.conf.sample 2_logstash_filter.conf
fi
if [ ! -f "3_logstash_output.conf" ] ; then
  echo 'No 3_logstash_output.conf file, copying sample, please configure'
  cp 3_logstash_output.conf.sample 3_logstash_output.conf.sample
fi
docker-compose stop
docker-compose rm -f
docker-compose build
docker-compose up -d
docker-compose run dejavu python load_scripts.py
