create sequence SEQ_AUTHOR_ID
   start = 1
   increment = 1
   ORDER
   comment = ‘Use this to fill in AUTHOR_ID’;
   
--NOTE:  If you do not include the word ORDER, your values will skip by 100 each time.    

//Drop and recreate the counter (sequence) so that it starts at 3 
create or replace sequence library_card_catalog.public.seq_author_uid
start = 3 
increment = 1 
ORDER
comment = 'Use this to fill in the AUTHOR_UID every time you add a row';
