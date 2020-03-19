ALTER TABLE candidatesPersonalDetailsCheck
DROP COLUMN lastUpdUser;

select * from candidatesPersonalDetailsCheck;techType

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `candidateHavingJavaTech`()
begin
select candidateTechStackAssig.candAssig_id,candidateTechStackAssig.candidate_id,FellowshipCandidate.FirstName,candidateTechStackAssig.assign_date,
companyRequirement.comp_id,companyRequirement.request_month,techType.tech_type_id,techType.type_name
from (((companyRequirement inner join  candidateTechStackAssig on companyRequirement.comp_req_id = candidateTechStackAssig.requirement_id)
inner join techType on techType.tech_type_id=companyRequirement.tech_type_id))inner join FellowshipCandidate on candidateTechStackAssig.candidate_id=FellowshipCandidate.id
where techType.type_name='java';
end$$
DELIMITER ;










ALTER TABLE candidatesPersonalDetailsCheck 
ADD  lastUpdUser int after lastUpdStamp;

ALTER TABLE companyRequirement
add  foreign key  (buddy_engg_id) REFERENCES mentor(mentor_id); 
select * from mentor;

select mentor.mentor_id,mentor.mentor_name,mentor.mentor_type,mentorTechStack.mentor_id,
mentorTechStack.tech_stack_id,techStack.tech_name
from ((mentor inner join mentorTechStack on mentorTechStack.mentor_id = mentor.mentor_id)
inner join techStack on techStack.tech_stack_id = mentorTechStack.tech_stack_id)
where techStack.tech_name = "java";

call candidateTechNotAssign();

call buddyIdeationCandidateID();
select * from companyRequirement;






DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `buddyIdeationCandidateID`()
begin
select FellowshipCandidate.Id,FellowshipCandidate.FirstName ,FellowshipCandidate.LastName,candidateTechStackAssig.candAssig_id,
candidateTechStackAssig.requirement_id,companyRequirement.buddy_engg_id,mentor.mentor_name,companyRequirement.ideation_engg_id,mentor.mentor_name

from (((FellowshipCandidate inner join candidateTechStackAssig on candidateTechStackAssig.candidate_id= FellowshipCandidate.id)
inner join companyRequirement on candidateTechStackAssig.requirement_id=companyRequirement.comp_req_id)inner join )
where FellowshipCandidate.id=6;
end$$
DELIMITER ;


DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `deployedCandidate`()
begin
select FellowshipCandidate.id,FellowshipCandidate.FirstName,FellowshipCandidate.LastName,FellowshipCandidate.HiredDate
from FellowshipCandidate 
where FellowshipCandidate.HiredDate<='2020-03-14';
end$$
DELIMITER ;



delimiter //
create procedure mentorAndIdeationHavingJavaTech()
begin
select mentor.mentor_id,mentor.mentor_name,mentor.mentor_type,mentorTechStack.mentor_id,
mentorTechStack.tech_stack_id,techStack.tech_name
from ((mentor inner join mentorTechStack on mentorTechStack.mentor_id = mentor.mentor_id)
inner join techStack on techStack.tech_stack_id = mentorTechStack.tech_stack_id)
where techStack.tech_name = "java";
end
delimiter //
call deployedCandidate();


DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `deployedCandidate`()
begin
select FellowshipCandidate.id,FellowshipCandidate.FirstName,FellowshipCandidate.LastName,FellowshipCandidate.HiredDate
from FellowshipCandidate 
where FellowshipCandidate.HiredDate<='2020-02-27';
end$$
DELIMITER ;


call lms.candidateHavingJavaTech();

drop procedure buddyIdeationCandidateID;
delimiter //
CREATE DEFINER=`root`@`localhost` PROCEDURE `buddyIdeationCandidateID`()
BEGIN
select FellowshipCandidate.Id,FellowshipCandidate.FirstName ,FellowshipCandidate.LastName,candidateTechStackAssig.candAssig_id,
candidateTechStackAssig.requirement_id,companyRequirement.buddy_engg_id,mentor.mentor_name,companyRequirement.ideation_engg_id,mentor.mentor_name

from (((((FellowshipCandidate inner join candidateTechStackAssig on candidateTechStackAssig.candidate_id= FellowshipCandidate.id)
inner join companyRequirement on candidateTechStackAssig.requirement_id=companyRequirement.comp_req_id) ) inner join 
mentor on mentor.mentor_id = companyRequirement.buddy_engg_id) inner join mentor on mentor.mentor_id = companyRequirement.buddy_engg_id)

where FellowshipCandidate.id=6;
END$$
DELIMITER ;


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

drop procedure candidateHavingJavaTechOnMSI;




-- create procedure for candidate having java techanology
delimiter //
create procedure candidateHavingJavaTechOnMLF()
begin
select distinct  FellowshipCandidate.Id ,FellowshipCandidate.FirstName,FellowshipCandidate.LastName,
FellowshipCandidate.EmailId,candiateMachineLog.technology
from (FellowshipCandidate inner join candiateMachineLog on FellowshipCandidate.id = candiateMachineLog.Id)
where candiateMachineLog.technology = "java";
end
