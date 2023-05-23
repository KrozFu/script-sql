-- Trigger para ingresar nuevos Estudiante a la base de datos
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