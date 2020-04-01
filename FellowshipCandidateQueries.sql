ALTER TABLE candidatesPersonalDetailsCheck
DROP COLUMN lastUpdUser;

use lms;
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
delimiter;










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


select * from mentor;
delimiter //
create procedure mentorAndIdeationHavingJavaTech()
begin
select mentor.mentor_id,mentor.mentor_name,mentor.mentor_type,mentorTechStack.mentor_id,
mentorTechStack.tech_stack_id,techStack.tech_name
from ((mentor inner join mentorTechStack on mentorTechStack.mentor_id = mentor.mentor_id)
inner join techstack on techstack.tech_stack_id = mentortechstack.tech_stack_id)
where techstack.tech_name = "java";
end$$
Delimiter;

call deployedCandidate();


DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `deployedCandidate`()
begin
select FellowshipCandidate.id,FellowshipCandidate.FirstName,FellowshipCandidate.LastName,FellowshipCandidate.HiredDate
from FellowshipCandidate 
where FellowshipCandidate.HiredDate<='2020-02-27';
end$$
DELIMITER ;



