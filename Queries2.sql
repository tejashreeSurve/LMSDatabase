select * from FellowshipCandidate;

-- candidate having java technology from candidateMachineLog
select distinct  FellowshipCandidate.Id ,FellowshipCandidate.FirstName,FellowshipCandidate.LastName,
FellowshipCandidate.EmailId,candidateMachineLog.technology
from (FellowshipCandidate inner join candidateMachineLog on FellowshipCandidate.id = candidateMachineLog.Id)
where candidateMachineLog.technology = "java";

use LMS;
select * from candidateMachineLog;

alter table candiateMachineLog rename to candidateMachineLog;

select distinct DateAndTime,Id,technology from candidateMachineLog
where  DateAndTime >= '2019-10-21 09:00:00' ;

-- this provide un unique id for unique dateAndTime from candidateMachineLog who come ear 
select distinct DateAndTime,Id,technology from candidateMachineLog
where  DateAndTime <= '2019-10-21 09:00:00' ;

-- early comming candidate
-- this select candidate id from candidateMachineLog table who has come early 
select distinct Id from candidateMachineLog
where  DateAndTime <= '2019-10-21 09:00:00' ;

-- this select the unique id and name of candidate from fellowhishp table who has come early on that date 
-- by using inner join
select distinct FellowshipCandidate.Id,FellowshipCandidate.FirstName from (FellowshipCandidate inner join candidateMachineLog on candidateMachineLog.Id = FellowshipCandidate.Id)
where  candidateMachineLog.DateAndTime <= '2019-10-21 09:00:00' ;


-- last going candidate 
select distinct  id,DateAndTime from candidateMachineLog
where DateAndTime >='2019-10-21 19:30:00';

-- early leaving candidate with candidate id and name
select distinct FellowshipCandidate.Id,FellowshipCandidate.FirstName  from (FellowshipCandidate inner join candidateMachineLog on candidateMachineLog.Id = FellowshipCandidate.Id) where candidateMachineLog.id not in 
(select distinct candidateMachineLog.id from candidateMachineLog
where DateAndTime >='2019-10-21 19:30:00');


select distinct id  from candidateMachineLog where DateAndTime in 
(select distinct max(DateAndTime)  from candidateMachineLog
group by id);

select  max(DateAndTime)  from candidateMachineLog
group by id;

-- id and name of candidate who has come late today
select distinct FellowshipCandidate.Id,FellowshipCandidate.FirstName 
from (FellowshipCandidate inner join candidateMachineLog on candidateMachineLog.Id = FellowshipCandidate.Id)
where  candidateMachineLog.DateAndTime >= '2019-10-21 09:00:00' 
and FellowshipCandidate.Id not in 
(select distinct FellowshipCandidate.Id from (FellowshipCandidate inner join candidateMachineLog on candidateMachineLog.Id = FellowshipCandidate.Id)
where  candidateMachineLog.DateAndTime <= '2019-10-21 09:00:00');


use LMS;
-- candidate who came early for day
select distinct   FellowshipCandidate.Id,FellowshipCandidate.FirstName
from (FellowshipCandidate inner join candidateMachineLog on candidateMachineLog.Id = FellowshipCandidate.Id)
where  DateAndTime <= '2019-10-21 09:00:00' ;

select distinct FellowshipCandidate.Id,FellowshipCandidate.FirstName from (FellowshipCandidate inner join candidateMachineLog on candidateMachineLog.Id = FellowshipCandidate.Id)
where  DateAndTime >= '2019-10-21 09:00:00';


(select distinct Id from candidateMachineLog
where  DateAndTime >= '2019-10-21 09:00:00' and Id  not in (select distinct id from 
candidateMachineLog where DateAndTime <= '2019-10-21 09:00:00'));

select distinct  FellowshipCandidate.Id from FellowshipCandidate,candidateMachineLog 
where FellowshipCandidate.Id in 
(select distinct   FellowshipCandidate.Id,FellowshipCandidate.FirstName,candidateMachineLog.DateAndTime
from (FellowshipCandidate inner join candidateMachineLog on candidateMachineLog.Id = FellowshipCandidate.Id)
where  DateAndTime >= '2019-10-21 09:00:00' );


Explain select DateAndTime,Id from candidateMachineLog;

call deployedCandidate();


-- create procedure for candidate having java techanology
delimiter //
create procedure candidateHavingJavaTechOnMSI()
begin
select distinct  FellowshipCandidate.Id ,FellowshipCandidate.FirstName,FellowshipCandidate.LastName,
FellowshipCandidate.EmailId,candiateMachineLog.technology
from (FellowshipCandidate inner join candiateMachineLog on FellowshipCandidate.id = candiateMachineLog.Id)
where candiateMachineLog.technology = "java";
end



