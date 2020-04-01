select distinct  fellowshipcandidate.Id ,fellowshipcandidate.FirstName,fellowshipcandidate.LastName,
fellowshipcandidate.EmailId,candidatemachinelog.technology
from (fellowshipcandidate inner join candidatemachinelog on fellowshipcandidate.id = candidatemachinelog.Id)
where candidatemachinelog.technology = "java";



drop procedure candidateHavingJavaTechOnMLF ;



DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `deployedCandidate`()
begin
select FellowshipCandidate.id,FellowshipCandidate.FirstName,FellowshipCandidate.LastName,FellowshipCandidate.HiredDate
from FellowshipCandidate 
where FellowshipCandidate.HiredDate<='2020-03-24';
end$$
DELIMITER ;

select FellowshipCandidate.id,FellowshipCandidate.FirstName,FellowshipCandidate.LastName,FellowshipCandidate.HiredDate
from FellowshipCandidate 
where FellowshipCandidate.HiredDate<='2020-03-24';
