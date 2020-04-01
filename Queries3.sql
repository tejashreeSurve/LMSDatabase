SELECT * FROM LMS.candiateMachineLog;
create table partionTableForCandidate 
(select FellowshipCandidate.Id,FellowshipCandidate.FirstName,candiateMachineLog.DateAndTime,
candiateMachineLog.boot_time
from( FellowshipCandidate inner join candiateMachineLog on candiateMachineLog.Id = FellowshipCandidate.Id))
;
create table employee( emp_id int, name varchar(20),joiningDate date)
partition by range (year(joiningDate))(
partition part1 values less than (2000),
partition part2 values less than (2005),
partition p2 values less than (2010)
);

create table partEmployee( emp_id int, name varchar(20),joiningDate date)
partition by range (year(joiningDate))(
partition part1 values less than (2000),
partition part2 values less than (2005),
partition part3 values less than (2010)
);
insert into partEmployee values(1,"teju","2000-10-10");
insert into partEmployee values (2, 'Frank',"2005-10-11");
insert into partEmployee values(3, 'Ellen', "2000-10-11");
insert into partEmployee values ('4', 'Jim', "2005-10-11");
insert into partEmployee values  ('5', 'Mary', "2005-10-11");
insert into partEmployee values ('6', 'Linda', "2010-10-11");

select * from employee partition (p2);	
select * from LMS.MachineLogData;
select * from mentorTechStack;
set @candidate_name ="";
call listOfCandidateName(@candidate_name);
select @candidate_name;

call LMS.candidateHavingJavaTechOnMSI();

select distinct id from candidateMachineLog  where DateAndTime between'2019-10-21 08:30:00' and  '2019-10-21 09:00:00' ;
use lms;
select * from machinelogdata;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/machine.csv' 
INTO TABLE machinelogdata
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

ALTER TABLE machinelogdata 
modify column number_of_bytes_received long ;

select * from candidatemachinelog;

create table candidateMachineLog
select fellowshipcandidate.Id,machinelogdata.dateandtime,machinelogdata.Cpu_Count,machinelogdata.Cpu_Working_Time
 ,machinelogdata.Cpu_idle_Time,machinelogdata.cpu_percent,machinelogdata.Usage_Cpu_Count,
 machinelogdata.number_of_software_interrupts_since_boot,machinelogdata.number_of_system_calls_since_boot,machinelogdata.number_of_interrupts_since_boot,
 machinelogdata.cpu_avg_load_over_1_min,machinelogdata.cpu_avg_load_over_5_min,machinelogdata.cpu_avg_load_over_15_min,
 machinelogdata.system_total_memory,machinelogdata.system_used_memory,machinelogdata.system_free_memory,machinelogdata.system_active_memory,
 machinelogdata.system_inactive_memory,machinelogdata.system_buffers_memory,machinelogdata.system_cached_memory,
 machinelogdata.system_shared_memory,machinelogdata.system_avalible_memory,machinelogdata.disk_total_memory,
 machinelogdata.disk_used_memory,machinelogdata.disk_free_memory,machinelogdata.disk_read_count,
 machinelogdata.disk_write_count,machinelogdata.disk_read_bytes,
 machinelogdata.disk_write_bytes,machinelogdata.time_spent_reading_from_disk,
 machinelogdata.time_spent_writing_to_disk,machinelogdata.time_spent_doing_actual_io,machinelogdata.number_of_bytes_sent,
 machinelogdata.number_of_bytes_received,machinelogdata.number_of_packets_sent,machinelogdata.number_of_packets_recived,
 machinelogdata.total_number_of_errors_while_receiving,machinelogdata.total_number_of_errors_while_sending,
 machinelogdata.total_number_of_incoming_packets_which_were_dropped,machinelogdata.total_number_of_outgoing_packets_which_were_dropped,
 machinelogdata.boot_time,machinelogdata.user_name,machinelogdata.keyboard,machinelogdata.mouse,machinelogdata.technology,
 machinelogdata.files_changed
 from (machinelogdata inner join fellowshipcandidate on fellowshipcandidate.EmailId = machinelogdata.user_name);


