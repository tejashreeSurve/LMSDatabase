use lms;
select now() ;

select * from candidatemachinelog;

INSERT INTO `lms`.`candidatemachinelog`
(`Id`,
`dateandtime`,
`Cpu_Count`,
`Cpu_Working_Time`,
`Cpu_idle_Time`,
`cpu_percent`,
`Usage_Cpu_Count`,
`number_of_software_interrupts_since_boot`,
`number_of_system_calls_since_boot`,
`number_of_interrupts_since_boot`,
`cpu_avg_load_over_1_min`,
`cpu_avg_load_over_5_min`,
`cpu_avg_load_over_15_min`,
`system_total_memory`,
`system_used_memory`,
`system_free_memory`,
`system_active_memory`,
`system_inactive_memory`,
`system_buffers_memory`,
`system_cached_memory`,
`system_shared_memory`,
`system_avalible_memory`,
`disk_total_memory`,
`disk_used_memory`,
`disk_free_memory`,
`disk_read_count`,
`disk_write_count`,
`disk_read_bytes`,
`disk_write_bytes`,
`time_spent_reading_from_disk`,
`time_spent_writing_to_disk`,
`time_spent_doing_actual_io`,
`number_of_bytes_sent`,
`number_of_bytes_received`,
`number_of_packets_sent`,
`number_of_packets_recived`,
`total_number_of_errors_while_receiving`,
`total_number_of_errors_while_sending`,
`total_number_of_incoming_packets_which_were_dropped`,
`total_number_of_outgoing_packets_which_were_dropped`,
`boot_time`,
`user_name`,
`keyboard`,
`mouse`,
`technology`,
`files_changed`)
VALUES
(15,
'2020-04-02 19:54:09',
2,
303.5,
573.0,
53.1,
2,
566666,
0,
432456,
1.61,
1.03,
1234569877,
2014563321,
1236547896,
4264370176,
1095507968,
267972608,
2111901696,
320360448,
3891707904,
30149586944,
17224462336,
11369984000,
96684,
9144,
1665381376,
9744667648,
124384,
131916,
252904,
871544,
6764135,
6025,
8344,
8344,
0,
0,
0,
0,
'0:08:13',
'prathameshsalap@gmail.com',
333,
658,
'nodejs',
286);

-- get candidate who is present on current date
select distinct id   from candidatemachinelog where cast(dateandtime as date )  = (select current_date());

select  candidatemachinelog.id,fellowshipcandidate.firstname , fellowshipcandidate.lastname,cast(dateandtime as time ) ,fellowshipcandidate.lastname,cast(dateandtime as date )
from candidatemachinelog inner join fellowshipcandidate on fellowshipcandidate.id= candidatemachinelog.id
where cast(dateandtime as date )  = (select current_date());

select  candidatemachinelog.id,fellowshipcandidate.firstname , fellowshipcandidate.lastname ,cast(candidatemachinelog.dateandtime as time  )
from candidatemachinelog inner join fellowshipcandidate on fellowshipcandidate.id= candidatemachinelog.id
where cast(candidatemachinelog.dateandtime as time ) <='09:00:00'  and  cast(candidatemachinelog.dateandtime as date )  = (select current_date());

select * from candidatemachinelog;

delete from candidatemachinelog where id = 12 and dateandtime = '2019-04-01 09:00:00';
delete from candidatemachinelog where id = 13 and dateandtime = '2020-04-02 06:30:09';
delete from candidatemachinelog where id = 17 and dateandtime = '2020-04-02 09:30:09';
delete from candidatemachinelog where id = 17 and dateandtime = '2020-04-02 05:30:09';
delete from candidatemachinelog where id = 18 and dateandtime = '2020-04-02 07:45:09';
delete from candidatemachinelog where id = 15 and dateandtime = '2020-04-02 10:45:09';
delete from candidatemachinelog where id = 16 and dateandtime = '2020-04-02 08:45:09';

select distinct candidatemachinelog.id,fellowshipcandidate.firstname , fellowshipcandidate.lastname,cast(dateandtime as date  ) 
from candidatemachinelog inner join fellowshipcandidate on fellowshipcandidate.id= candidatemachinelog.id
where  cast(dateandtime as date )  = (select current_date());






call candidatePresenOnCurrentDay();

select cast(dateandtime as date ) 
from candidatemachinelog 
where id = 12;

call candidate_come_early_oN_currentDay();


select cast(dateandtime as date)
from candidatemachinelog
where id = 12;


select  current_date()
where current_date like current_date();

-- first find the candidate who come early today and then find candidate who is not present not in those candidate who come early
select distinct candidatemachinelog.id,fellowshipcandidate.firstname , fellowshipcandidate.lastname ,cast(dateandtime as date )
from candidatemachinelog inner join fellowshipcandidate on fellowshipcandidate.id= candidatemachinelog.id
where cast(dateandtime as date )  = (select current_date()) and  candidatemachinelog.id not in 
(select  id
from candidatemachinelog 
where cast(dateandtime as time ) <='09:00:00'  and  cast(dateandtime as date )  = (select current_date()));

