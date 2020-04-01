select mentor.mentor_id,mentor.mentor_name,lab.lab_name
from  mentor inner join lab on lab.lab_id= mentor.lab_id
where lab.lab_name='mumbai';
delimiter //


-- mentor related to mumbai labbuddy_ideation_engg
create procedure mentorRelatedLab()
begin 
select mentor.mentor_id,mentor.mentor_name,lab.lab_name
from  mentor inner join lab on lab.lab_id= mentor.lab_id
where lab.lab_name='mumbai';
end //
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `buddyIdeationEnggforCandidate`()
begin 
select fellowshipcandidate.id ,fellowshipcandidate.FirstName,candidatetechstackassig.requirement_id,companyrequirement.ideation_engg_id,mentor.mentor_name,companyrequirement.buddy_engg_id
from (((candidatetechstackassig inner join  fellowshipcandidate on fellowshipcandidate.Id= candidatetechstackassig.candidate_id) inner join
companyrequirement on candidatetechstackassig.requirement_id =companyrequirement.comp_req_id ) inner join mentor on companyrequirement.ideation_engg_id=mentor.mentor_id)
where  fellowshipcandidate.id = 6;
end$$
DELIMITER ;

select distinct  candidatemachinelog.Id,fellowshipcandidate.FirstName
from candidatemachinelog inner join  fellowshipcandidate on fellowshipcandidate.Id=candidatemachinelog.Id
where candidatemachinelog.dateandtime like  '2019-10-21%';

select * from candidatemachinelog;

select technology from candidatemachinelog;

-- procedure create for candidate present on particular date 
DELIMITER $$
create procedure candidatePresentOnDate()
begin
select distinct  candidatemachinelog.Id,fellowshipcandidate.FirstName
from candidatemachinelog inner join  fellowshipcandidate on fellowshipcandidate.Id=candidatemachinelog.Id
where candidatemachinelog.dateandtime like  '2019-10-21%';
end$$
delimiter ;

call candidatePresentOnDate();

select *
from candidateMachineLog
where id in (select distinct id from candidateMachineLog where DateAndTime = (
select max(DateAndTime) from candidateMachineLog))
order by id desc ;

select  id,DateAndTime from candidateMachineLog where DateAndTime = (
select max(DateAndTime) from candidateMachineLog);

use LMS;
explain select * from candidateMachineLog 
where DateAndTime in 
(select min(DateAndTime) from candidateMachineLog);

-- other way to find early commer candidate
select distinct id  from candidateMachineLog 
where DateAndTime like '2019-10-21 08%';

use lms;

select mentor.mentor_id,mentor.mentor_name,mentor.mentor_type,mentortechstack.tech_stack_id,techstack.tech_name
from ((mentor inner join mentortechstack on mentor.mentor_id = mentortechstack.mentor_id) inner join techstack
on mentortechstack.tech_stack_id = techstack.tech_stack_id)
where techstack.tech_name = 'java';


DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `mentorAndIdeationHavingJavaTech`()
begin
select mentor.mentor_id,mentor.mentor_name,mentor.mentor_type,mentortechstack.tech_stack_id,techstack.tech_name
from ((mentor inner join mentortechstack on mentor.mentor_id = mentortechstack.mentor_id) inner join techstack
on mentortechstack.tech_stack_id = techstack.tech_stack_id)
where techstack.tech_name = 'java' ;
end$$
DELIMITER ;






