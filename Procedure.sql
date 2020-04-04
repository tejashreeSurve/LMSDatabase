

-- name and id of buddy ideation engg assign for candidate id = 6
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `buddy_ideation_engg`()
begin 
select fellowshipcandidate.id ,fellowshipcandidate.FirstName,candidatetechstackassig.requirement_id,companyrequirement.ideation_engg_id,mentor.mentor_name,companyrequirement.buddy_engg_id
from (((candidatetechstackassig inner join  fellowshipcandidate on fellowshipcandidate.Id= candidatetechstackassig.candidate_id) inner join
companyrequirement on candidatetechstackassig.requirement_id =companyrequirement.comp_req_id ) inner join mentor on companyrequirement.ideation_engg_id=mentor.mentor_id)
where  fellowshipcandidate.id = 6;
end$$
DELIMITER ;

-- name and id of buddy ideation engg assign for candidate id = 6 
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `buddyIdeationEnggforCandidate`()
begin 
select fellowshipcandidate.id ,fellowshipcandidate.FirstName,candidatetechstackassig.requirement_id,companyrequirement.ideation_engg_id,mentor.mentor_name,companyrequirement.buddy_engg_id
from (((candidatetechstackassig inner join  fellowshipcandidate on fellowshipcandidate.Id= candidatetechstackassig.candidate_id) inner join
companyrequirement on candidatetechstackassig.requirement_id =companyrequirement.comp_req_id ) inner join mentor on companyrequirement.ideation_engg_id=mentor.mentor_id)
where  fellowshipcandidate.id = 6;
end$$
DELIMITER ;

-- candidate who come early on current day i.e current date  get from system
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `candidate_come_early_on_currentDay`()
BEGIN
select  candidatemachinelog.id,fellowshipcandidate.firstname , fellowshipcandidate.lastname ,cast(candidatemachinelog.dateandtime as time  )
from candidatemachinelog inner join fellowshipcandidate on fellowshipcandidate.id= candidatemachinelog.id
where cast(candidatemachinelog.dateandtime as time ) <='09:00:00'  and  cast(candidatemachinelog.dateandtime as date )  = (select current_date());

END$$
DELIMITER ;

-- candidate who come late on current date 
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `candidate_come_late_on_currentDay`()
BEGIN
select  candidatemachinelog.id,fellowshipcandidate.firstname , fellowshipcandidate.lastname ,cast(candidatemachinelog.dateandtime as time  )
from candidatemachinelog inner join fellowshipcandidate on fellowshipcandidate.id= candidatemachinelog.id
where cast(candidatemachinelog.dateandtime as time ) <='09:00:00'  and  cast(candidatemachinelog.dateandtime as date )  = (select current_date());
END$$
DELIMITER ;

-- candidate who come early on  yesterday as per current date using subdate command
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `candidate_gone_early_yeasterday`()
BEGIN
select distinct candidatemachinelog.id,fellowshipcandidate.firstname , fellowshipcandidate.lastname,cast(dateandtime as date  ) 
from candidatemachinelog inner join fellowshipcandidate on fellowshipcandidate.id= candidatemachinelog.id
where cast(dateandtime as date )  = (select subdate(current_date(),1)) and candidatemachinelog.id not in
(select distinct candidatemachinelog.id
from candidatemachinelog inner join fellowshipcandidate on fellowshipcandidate.id= candidatemachinelog.id
where  cast(dateandtime as date )  = (select subdate(current_date(),1)) and  cast(dateandtime as time ) >= '19:30:00');
END$$
DELIMITER ;

-- candidate who come early today as per current date of system 
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `candidateComeEarlyToday`()
BEGIN
select distinct   FellowshipCandidate.Id,FellowshipCandidate.FirstName,FellowshipCandidate.LastName
from (FellowshipCandidate inner join candidateMachineLog on candidateMachineLog.Id = FellowshipCandidate.Id)
where  DateAndTime <= '2019-10-21 09:00:00' ;
END$$
DELIMITER ;

-- candidate who has assign java technology 
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

-- candidate who as assign java technology on candidate machine log
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `candidateHavingJavaTechOnMLF`()
begin
select distinct  fellowshipcandidate.Id ,fellowshipcandidate.FirstName,fellowshipcandidate.LastName,
fellowshipcandidate.EmailId,candidatemachinelog.technology
from (fellowshipcandidate inner join candidatemachinelog on fellowshipcandidate.id = candidatemachinelog.Id)
where candidatemachinelog.technology = "java";
end$$
DELIMITER ;

-- candidate who present on current day
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `candidatePresenOnCurrentDay`()
BEGIN
select distinct candidatemachinelog.id,fellowshipcandidate.firstname , fellowshipcandidate.lastname,cast(dateandtime as date ) from candidatemachinelog inner join fellowshipcandidate on fellowshipcandidate.id= candidatemachinelog.id
where cast(dateandtime as date )  = (select current_date());
END$$
DELIMITER ;

-- candidate who has present on current date
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `candidatePresentOnDate`()
begin
select distinct  candidatemachinelog.Id,fellowshipcandidate.FirstName
from candidatemachinelog inner join  fellowshipcandidate on fellowshipcandidate.Id=candidatemachinelog.Id
where candidatemachinelog.dateandtime like  '2019-10-21%';
end$$
DELIMITER ;

-- candidate who related to pune lab
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `candidaterelatedlab`()
select fellowshipcandidate.id,fellowshipcandidate.FirstName,fellowshipcandidate.HiredCity
from fellowshipcandidate
where HiredCity ='pune';$$
DELIMITER ;

-- technology is not assign to candidate 
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `candidateTechNotAssign`()
begin 
select id ,FirstName   from fellowshipcandidate  where id not in
(select fellowshipcandidate.id from fellowshipcandidate inner join 
candidatetechstackassig on candidatetechstackassig.candidate_id= fellowshipcandidate.id);
end$$
DELIMITER ;

-- candidate who has deployed till date
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `deployedCandidate`()
begin
select FellowshipCandidate.id,FellowshipCandidate.FirstName,FellowshipCandidate.LastName,FellowshipCandidate.HiredDate
from FellowshipCandidate 
where FellowshipCandidate.HiredDate<='2020-02-27';
end$$
DELIMITER ;

-- ideation and mentor engg who have assign java technology 
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `mentorAndIdeationHavingJavaTech`()
begin
select mentor.mentor_id,mentor.mentor_name,mentor.mentor_type,mentortechstack.tech_stack_id,techstack.tech_name
from ((mentor inner join mentortechstack on mentor.mentor_id = mentortechstack.mentor_id) inner join techstack
on mentortechstack.tech_stack_id = techstack.tech_stack_id)
where techstack.tech_name = 'java' ;
end$$
DELIMITER ;

-- mentor related to mumbai lab buddy_ideation_engg
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `mentorRelatedLab`()
begin 
select mentor.mentor_id,mentor.mentor_name,lab.lab_name
from  mentor inner join lab on lab.lab_id= mentor.lab_id
where lab.lab_name='mumbai';
end$$
DELIMITER ;



