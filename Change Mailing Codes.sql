create table #cod (old varchar(10), new varchar(10))
insert into #cod (old, new)
values ('T15PDC001','I15TMWPD1'),
('T15PDC002','I15TMWPD2'),
('T15REA001','I15TMWRE1'),
('T15REA002','I15TMWRE2'),
('T15REA003','I15TMWRE3'),
('T15REA004','I15TMWRE4')

begin tran
update 
mailings 
set mailing = #cod.new
from mailings
m inner join #cod on m.mailing = #cod.old

--update 
--mailing_history
--set mailing = #cod.new
--from mailing_history
--m inner join #cod on m.mailing = #cod.old

update 
segments
set mailing = #cod.new
from segments
m inner join #cod on m.mailing = #cod.old

update 
sources
set source = #cod.new
from sources
m inner join #cod on m.source = #cod.old

update 
segments
set source = #cod.new
from segments
m inner join #cod on m.source = #cod.old

update 
segments
set segment = right(#cod.new,3)
from segments
m inner join #cod on m.mailing = #cod.new

update 
segments
set appeal = 'TMW'
from segments
m inner join #cod on m.mailing = #cod.new

update 
segments
set campaign = 'I15'
from segments
m inner join #cod on m.mailing = #cod.new

rollback



select * from #cod

