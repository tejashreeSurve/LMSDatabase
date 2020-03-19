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

;


