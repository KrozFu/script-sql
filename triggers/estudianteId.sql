create or replace trigger estudianteId
    before insert on estudiantes
    for each row
    declare 
    Vid number;
begin 
    Vid := estId;
    :new.id := Vid;
end estudianteId;
/