call deployedCandidate();

select * from candidatetechstackassig;

select candidatetechstackassig.candAssig_id,candidatetechstackassig.candidate_id,candidatetechstackassig.requirement_id from candidatetechstackassig inner join companyrequirement
on candidatetechstackassig.requirement_id= companyrequirement.comp_req_id;

select candidatetechstackassig.candidate_id from candidatetechstackassig inner join companyrequirement
on candidatetechstackassig.requirement_id= companyrequirement.comp_req_id;

-- technology is not assign to candidate 
delimiter //
create procedure candidateTechNotAssign ()
begin 
select id ,FirstName   from fellowshipcandidate  where id not in
(select fellowshipcandidate.id from fellowshipcandidate inner join 
candidatetechstackassig on candidatetechstackassig.candidate_id= fellowshipcandidate.id);
end//

select fellowshipcandidate.id from candidatetechstackassig inner join 
fellowshipcandidate on candidatetechstackassig.candidate_id= fellowshipcandidate.id;




