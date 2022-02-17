--4
CREATE TABLE MAGAZIN(ID_magazin number(3),nr_tel char(10) unique,rating number(2) not null,
PRIMARY KEY(ID_magazin));

CREATE TABLE ADRESA(ID_adresa number(3),ID_magazin number(3) not null unique,oras varchar(25)
not null, judet varchar(20) not null,strada varchar(30) not null,PRIMARY KEY(ID_adresa)
,FOREIGN KEY(ID_magazin) references MAGAZIN(ID_magazin),
constraint unic unique(oras,judet,strada));

CREATE TABLE ANGAJAT(ID_angajat number(5),ID_magazin number(3) not null,salariu number(5)
not null,nr_tel char(10) not null,nume varchar(30) not null,prenume varchar(50) not null,
job varchar(30) not null,PRIMARY KEY(ID_angajat),
FOREIGN KEY(ID_magazin) references MAGAZIN(ID_magazin));

CREATE TABLE TRANSPORT(ID_transport number(6),nr_calculatoare_initiale number(3) not null,
nume_firma_curierat varchar(30) not null,PRIMARY KEY(ID_transport));

CREATE TABLE CALCULATOR(ID_calculator number(10),ID_magazin number(3) not null,ID_transport
number(6),cost number(5) not null,utilizare varchar(20),data_asamblare date,stare varchar(20)
not null,PRIMARY KEY(ID_calculator),FOREIGN KEY (ID_magazin) references MAGAZIN(ID_magazin),
FOREIGN KEY (ID_transport) references TRANSPORT(ID_transport));

CREATE TABLE COMPONENTA(ID_componenta number(6),consum_electricitate number (4) not null,greutate
number(5),data_lansare date not null,cost number(7,2) not null,tip varchar(20) not null,PRIMARY
KEY (ID_componenta));

create TABLE CONTINE(ID_calculator number(10),ID_componenta number(6),
PRIMARY KEY(ID_calculator,ID_componenta),FOREIGN KEY (ID_calculator) 
references CALCULATOR(ID_calculator),FOREIGN KEY(ID_componenta) references COMPONENTA(ID_componenta));

create TABLE FURNIZOR(ID_furnizor number(3),nr_telef char(10) not null,
tip_componenta varchar(20) not null,data_contract date not null,
durata_aprovizionare number(4) not null,PRIMARY KEY (ID_furnizor));

create TABLE APROVIZIONEAZA(ID_magazin number(3),ID_furnizor number(3), 
PRIMARY KEY(ID_magazin,ID_furnizor),FOREIGN KEY (ID_magazin) references MAGAZIN(ID_magazin),
FOREIGN KEY (ID_furnizor) references FURNIZOR(ID_furnizor));

CREATE TABLE LIVRARE (ID_transport numeric(6),ID_furnizor numeric(3) not null,
ID_magazin numeric(3) not null,nr_componente numeric(3) not null,cost numeric(7) not null,
data_livrare date not null,tip_curier varchar(30) not null,PRIMARY KEY(ID_transport), 
FOREIGN KEY (ID_furnizor) references FURNIZOR(ID_furnizor),
FOREIGN KEY (ID_magazin) references MAGAZIN(ID_magazin));

create table CLIENT (ID_client numeric(7),nume varchar(30) not null, prenume varchar(50) not null,
telefon char(10) not null,email varchar(50) not null,PRIMARY KEY (ID_client));

create table FACTURA (ID_factura numeric(10),ID_magazin numeric(3),ID_calculator numeric(10) 
not null unique,ID_client numeric(7) not null,data_cumpararii date not null,
PRIMARY KEY(ID_factura),FOREIGN KEY (ID_MAGAZIN) references MAGAZIN(ID_magazin),
FOREIGN KEY(ID_client) references CLIENT(ID_client),
FOREIGN KEY (ID_calculator) references CALCULATOR (ID_calculator));

create table GARANTIE(ID_garantie numeric(10),ID_factura numeric(10) not null unique,
data_emitere date not null,duarata numeric(4) not null,PRIMARY KEY(ID_garantie),
FOREIGN KEY (ID_factura) references FACTURA(ID_factura));

commit;

--5

insert into MAGAZIN values(100,'1234567890',7);
insert into MAGAZIN values(101,'1234567893',3);
insert into MAGAZIN values(102,null,7);
insert into MAGAZIN values(103,'0777777777',6);
insert into MAGAZIN values(104,null,2);
insert into MAGAZIN values(105,'07734426',2);
select * from MAGAZIN;

insert into ADRESA values(100,100,'Pitesti','Arges','Exercitiu');
insert into ADRESA values(101,101,'Sector 3','Bucuresti','Mizil');
insert into ADRESA values(102,102,'Vaslui','Vaslui','Munciii');
insert into ADRESA values(103,103,'Pitesti','Arges','Traian');
insert into ADRESA values(104,104,'Sector 1','Bucuresti','Academiei');
select * from ADRESA;

insert into ANGAJAT values(300,100,10600,'0773618370','Popescu','Mihnea-Valentin','Manager');
insert into ANGAJAT values(301,100,7000,'0773723371','Potcoveanu','Florin-Razvan','Programator');
insert into ANGAJAT values(302,100,5350,'0738218373','Coman','Eduard-Ionut','IT');
insert into ANGAJAT values(303,101,9500,'0773783271','Marcu','Corina','Manager');
insert into ANGAJAT values(304,101,7600,'0783218376','Cerchia','Raluca','Programator');
insert into ANGAJAT values(305,101,7600,'0783218376','John','Doe','Programator');
select * from ANGAJAT;

insert into TRANSPORT values(100,30,'Fan curier');
insert into TRANSPORT values(101,27,'Cargus');
insert into TRANSPORT values(102,5,'Fan curier express');
insert into TRANSPORT values(103,67,'Cargus');
insert into TRANSPORT values(104,2,'Posta Romana');
select * from transport;

insert into CALCULATOR values(100,100,null,4500,'Office',to_date('25/03/2011','DD/MM/YYYY'),'Nou');
insert into CALCULATOR values(101,100,null,7300,'Gaming',to_date('25/04/2011','DD/MM/YYYY'),'Nou');
insert into CALCULATOR values(102,102,101,5630,'Server',to_date('27/11/2010','DD/MM/YYYY'),'Uzat');
insert into CALCULATOR values(103,101,101,3100,'Office',null,'Second-Hand');
insert into CALCULATOR values(104,102,null,9600,'Gaming',to_date('05/07/2012','DD/MM/YYYY'),'Nou');
select * from CALCULATOR;

insert into COMPONENTA values(300,245,300,to_date('29/07/2009','DD/MM/YYYY'),3699.99,'GPU');
insert into COMPONENTA values(301,200,100,to_date('29/07/2010','DD/MM/YYYY'),2299.99,'CPU');
insert into COMPONENTA values(302,400,200,to_date('10/03/2011','DD/MM/YYYY'),1299.99,'Motherboard');
insert into COMPONENTA values(303,567,341,to_date('19/07/2007','DD/MM/YYYY'),599.99,'Cooler');
insert into COMPONENTA values(304,300,400,to_date('19/08/2010','DD/MM/YYYY'),4399.99,'GPU');
insert into COMPONENTA values(305,265,335,to_date('29/07/2009','DD/MM/YYYY'),3799.99,'GPU');
select * from COMPONENTA;

insert into CONTINE values(101,304);
insert into CONTINE values(101,303);
insert into CONTINE values(101,302);
insert into CONTINE values(101,301);
insert into CONTINE values(100,300);
insert into CONTINE values(100,303);
insert into CONTINE values(100,302);
insert into CONTINE values(100,301);
insert into CONTINE values(102,300);
insert into CONTINE values(102,303);
insert into CONTINE values(102,302);
insert into CONTINE values(102,301);
select * from contine;

insert into FURNIZOR values (100,'0723712375','GPU',to_date('23/05/2009','DD/MM/YYYY'),1800);
insert into FURNIZOR values (101,'0726438723','CPU',to_date('09/11/2008','DD/MM/YYYY'),2000);
insert into FURNIZOR values (102,'0736238734','Motherboard',to_date('23/05/2009','DD/MM/YYYY'),1250);
insert into FURNIZOR values (103,'0748267834','GPU',to_date('03/07/2010','DD/MM/YYYY'),1300);
insert into FURNIZOR values (104,'0784572375','CPU',to_date('19/01/2009','DD/MM/YYYY'),1700);
insert into FURNIZOR values (105,'0765236523','Motherboard',to_date('17/03/2012','DD/MM/YYYY'),3700);
select * from FURNIZOR;

insert into APROVIZIONEAZA values (100,100);
insert into APROVIZIONEAZA values (100,101);
insert into APROVIZIONEAZA values (100,102);
insert into APROVIZIONEAZA values (100,103);
insert into APROVIZIONEAZA values (100,104);
insert into APROVIZIONEAZA values (101,103);
insert into APROVIZIONEAZA values (101,104);
insert into APROVIZIONEAZA values (101,102);
insert into APROVIZIONEAZA values (101,105);
insert into APROVIZIONEAZA values (102,100);
insert into APROVIZIONEAZA values (102,101);
insert into APROVIZIONEAZA values (102,102);
insert into APROVIZIONEAZA values (102,103);
select * from APROVIZIONEAZA;

insert into LIVRARE values (100,100,100,300,29351,to_date('30/11/2013','DD/MM/YYYY'),'camion');
insert into LIVRARE values (101,100,101,300,12351,to_date('23/07/2012','DD/MM/YYYY'),'nava');
insert into LIVRARE values (102,101,104,300,64351,to_date('04/03/2014','DD/MM/YYYY'),'camion');
insert into LIVRARE values (103,101,100,300,61351,to_date('16/05/2013','DD/MM/YYYY'),'avion');
insert into LIVRARE values (104,102,103,300,32351,to_date('14/11/2013','DD/MM/YYYY'),'vapor');
select * from LIVRARE;

insert into CLIENT values (100,'Mocanu','Eduard-Ionut','0723652376','email1@gmail.com');
insert into CLIENT values (101,'Din','Andrei-Iulian','0765237634','email2@gmail.com');
insert into CLIENT values (102,'Nitescu','Andreea','0745762365','email3@gmail.com');
insert into CLIENT values (103,'Oprescu','Irene','0734762376','email4@gmail.com');
insert into CLIENT values (104,'Manda','Octavian','0734762343','email5@gmail.com');
select * from CLIENT;

insert into FACTURA values(100,100,100,100,to_date('23/04/2015','DD/MM/YYYY'));
insert into FACTURA values(101,100,101,100,to_date('21/04/2015','DD/MM/YYYY'));
insert into FACTURA values(102,101,103,102,to_date('21/08/2015','DD/MM/YYYY'));
insert into FACTURA values(103,102,102,103,to_date('11/02/2015','DD/MM/YYYY'));
insert into FACTURA values(104,102,104,103,to_date('17/07/2015','DD/MM/YYYY'));
select * from FACTURA;

insert into garantie values (100,100,to_date('23/04/2015','DD/MM/YYYY'),365);
insert into garantie values (101,101,to_date('27/09/2015','DD/MM/YYYY'),365);
insert into garantie values (102,102,to_date('23/04/2016','DD/MM/YYYY'),375);
insert into garantie values (103,103,to_date('19/07/2013','DD/MM/YYYY'),180);
insert into garantie values (104,104,to_date('04/06/2014','DD/MM/YYYY'),365);
select * from GARANTIE;

commit;

set serveroutput on;

--6
--scrieti o procedura care afiseaza cati angajati lucreaza pentru fiecare job si o lista cu acestia
--sortati crescator dupa salariu
create or replace procedure p6_pmv 
    is
    
    type tablou_imbricat is table of angajat.job%type;
    v_joburi tablou_imbricat:=tablou_imbricat();
    
    type vector is varray(1000) of varchar2(200);
    v_angajati vector:= vector();
    
    begin
    
    select unique job
    bulk collect into v_joburi
    from angajat;
    
    for i in v_joburi.first..v_joburi.last loop
    
        select prenume || ' ' || nume
        bulk collect into v_angajati
        from angajat
        where lower(job)=lower(v_joburi(i))
        order by salariu;
        
        dbms_output.put_line (v_joburi(i) || ' in care lucreaza ' || v_angajati.count || ' angajati :');
        for j in v_angajati.first..v_angajati.last loop
            dbms_output.put_line('Angajatul ' || v_angajati(j));
        end loop;
    end loop;
    
    end p6_pmv;
/

begin
p6_pmv;
end;
/

--7
--o functie care returneaza cate calculatoare care au fost asamblate pana la o anumita luna,data ca parametru,
--sunt transportate de o firma de curierat data ca parametru si creste costul acestora cu 5% 
create or replace function f7_pmv(v_luna number,v_firma varchar2)
    return number is
    
    v_nr number(4):=0;
    v_nr_aux number(4);
    
    cursor c_calculator(v_data_param number) is
        select id_calculator,id_transport
        from calculator
        where to_char(data_asamblare,'MM')<=v_data_param;
        
    invalid_data exception;
    
    begin
    
    if v_luna>12 or v_luna<0 then
        raise invalid_data;
    end if;
    
    for c in c_calculator(v_luna) loop
        select count(*)
        into v_nr_aux
        from transport t
        where lower(t.nume_firma_curierat)=lower(v_firma) and t.id_transport=c.id_transport;
        
        v_nr:=v_nr+v_nr_aux;
        
        if v_nr_aux>0 then
        
            update calculator c2
            set cost=cost+cost*0.05
            where c2.id_calculator=c.id_calculator;
            
        end if;
        
    end loop;
    
    return v_nr;
    exception
        when invalid_data then
            raise_application_error(-20003,'Data invalida');
    end f7_pmv;
/ 

begin
dbms_output.put_line(f7_pmv(11,'Cargus'));
end;
/
    --8
    --sa se returneze numele si salariul anual al angajatului cu salariul cel mai mare 
    --care lucreaza la jobul dat prin parametru si in orasul dat prin parametru
create or replace function f8_pmv(v_job varchar2,v_oras varchar2)
    return varchar2 is
    
    v_salariu angajat.salariu%type:= -1;
    v_nume angajat.nume%type;
    v_prenume angajat.prenume%type;
    v_aux number;
    v_err_msg varchar2(200);
    
    begin
        
        v_err_msg:=' angajat cu jobul dat';
        select count(*)
        into v_aux
        from angajat
        where lower(job)=lower(v_job);
        
        if v_aux<1 then
            raise no_data_found;
        end if;
        
        v_err_msg:=' magazin in orasul cerut care sa aiba angajat cu jobul dat';
        select max(salariu)
        into v_salariu
        from angajat join magazin using (id_magazin) join adresa using (id_magazin)
        where lower(job)=lower(v_job) and lower(oras)=lower(v_oras);
        
        select nume,prenume
        into v_nume, v_prenume
        from angajat
        where salariu=v_salariu and lower(job)=lower(v_job);
        
    return v_salariu*12 || ' '|| v_nume || ' ' || v_prenume;
    
    exception
        when no_data_found then
            raise_application_error(-20000,'Nu exista' || v_err_msg);
        when too_many_rows then
            raise_application_error(-20001,'Exista mai multi angajati cu salariul maxim al jobului '
            || v_job || ' din orasul ' || v_oras);
    end f8_pmv;
    /
    
begin
dbms_output.put_line(f8_pmv('Manager','Pitesti'));
end;
/

begin
dbms_output.put_line(f8_pmv('eaeaae','Pitesti'));
end;
/

begin
dbms_output.put_line(f8_pmv('Manager','eaaeae'));
end;
/

begin
dbms_output.put_line(f8_pmv('Programator','Sector 3'));
end;
/
    
    --9
    --o procedura care mareste consumul de electricitate al celei mai vechi componente(tip dat in param),
    --care a fost livrata intr-un calculator unui client cu un nume transmis prin parametru, cu 20%
    --si afiseaza datele componentei modificate
create or replace procedure p9_pmv (v_nume varchar2, v_tip varchar2)
    is
    
        v_aux number(4);
        v_nr number(4):=0;
        v_min componenta.data_lansare%type;
        v_data componenta%rowtype;
        
        no_client exception;
        
    begin
    
        select count(*)
        into v_aux
        from client
        where lower(nume)=lower(v_nume);
        
        if v_aux=0 then
            raise no_client;    
        end if;
        
        select min(data_lansare)
        into v_min
        from componenta join contine using (id_componenta) join calculator using (id_calculator)
        join factura using (id_calculator) join client using (id_client)
        where lower(nume)=lower(v_nume) and lower(tip)=lower(v_tip);
        
      
        
        select *
        into v_data
        from componenta
        where data_lansare=v_min and lower(tip)=lower(v_tip);
        
        update componenta
        set consum_electricitate=consum_electricitate+consum_electricitate*0.2
        where data_lansare=v_min and lower(tip)=lower(v_tip);
        
        select *
        into v_data
        from componenta
        where data_lansare=v_min and lower(tip)=lower(v_tip);
        
        dbms_output.put_line('Id: ' || v_data.id_componenta 
        || ' consum electricitate: ' || v_data.consum_electricitate || ' greutate:' || v_data.greutate || 
        ' data_lansare:' || v_data.data_lansare || ' cost:' || v_data.cost || ' tip:' || v_data.tip);
        
        exception
            when no_data_found then
                raise_application_error(-20000, 'Nu exista o componenta cu tipul ' || v_tip 
                || ' intr-un calculator livrat unui clientului cu numele ' || v_nume);
            when too_many_rows then
                raise_application_error(-20001,'Exista mai multe componente de tipul ' || v_tip 
                || ' lansate la data de ' || v_min);
            when no_client then
                raise_application_error(-20000,'Nu exista client cu numele dat');
        
    end p9_pmv;
/

begin
p9_pmv('Mocanu','CPU');
end;
/

rollback;

begin
p9_pmv('Mocanu','GPU');
end;
/

begin
p9_pmv('Meeee','GPU');
end;
/

begin
p9_pmv('Mocanu','FPU');
end;
/

--10
--un trigger care nu permite insert in tabelul angajat in weekend si update in afara
--intervalului orar 8:00-16:00
create or replace trigger t10_pmv
        before insert  or update on angajat
        declare
            v_data varchar(20):=to_char(sysdate,'fmday');
            v_hour number(2):= to_char(sysdate,'hh24');
            v_minute number(2):= to_char(sysdate,'mm');
        begin
            if inserting then
                if lower(v_data)='saturday' or lower(v_data)='sunday' then
                    raise_application_error(-20001,'Nu se pot insera angajati in weekend');
                end if;
            end if;
            if updating then
                if v_hour>16 or v_hour=16 and v_minute>0 then
                    raise_application_error(-20001,'Nu se pot updata angajati dupa ora 16');
                end if;
                if v_hour<8 then
                    raise_application_error(-20001,'Nu se pot updata angajati inainte de ora 8');
                end if;
            end if;
        end t10_pmv;
/
alter trigger t10_pmv
disable;
alter trigger t10_pmv
enable;

--activare
alter system set FIXED_DATE='2022-01-07-16:47:00';
update angajat
set salariu=0;

alter system set FIXED_DATE='2022-01-07-7:47:00';
update angajat
set salariu=0;

alter system set FIXED_DATE='2022-01-08-12:00:00';
insert into ANGAJAT values(306,101,7600,0773318571,'Popescu','Matei','Manager');

alter system set FIXED_DATE=None;

-11
--un trigger care nu permite update daca noul numarul de telefon al unui client
--nu coincide cu cel al unui magazin si incepe cu '07'

create or replace trigger t11_pmv
    before update of telefon on client
    for each row
    declare
    
        type tablou_imbricat is table of magazin.nr_tel%type;
        v_telef tablou_imbricat:=tablou_imbricat();
        v_id magazin.id_magazin%type;
        
    begin
    
        select nr_tel
        bulk collect into v_telef
        from magazin;
        
        for i in v_telef.first..v_telef.last loop
            if v_telef(i)=:NEW.telefon then
                select id_magazin
                into v_id
                from magazin
                where v_telef(i)=nr_tel;
                raise_application_error(-20000,'Noul numar de telefon este si numarul de telefon
                al unui magazin cu id-ul:' || v_id);
            end if;
        end loop;
        
        if :NEW.telefon not like '07%' then
            raise_application_error(-20001,'Numar de telefon invalid');
        end if;
    end t11_pmv;
/
alter trigger t11_pmv
disable;
alter trigger t11_pmv
enable;

--activare
update client
set telefon='1234567890'
where id_client=104;

rollback;

--12
--un trigger care nu permite operatii de tip alter si retine informatii
--despre celelalte operatii ldd intr-un tabel numit ldd_history

create table ldd_history
(
utilizator varchar2(200),
nume_obiect varchar2(100),
eveniment varchar2(100),
data timestamp
);

commit;

create or replace trigger t12_pmv
    before alter or create or drop on schema
    begin
        
        if lower(trim(sys.sysevent))='alter' then
            raise_application_error(-20000,'Operatiunile de tip alter nu sunt permise');
        end if;
        
        insert into ldd_history
        values(sys.login_user, sys.dictionary_obj_name, sys.sysevent, sysdate);
        
    end t12_pmv;
/
alter trigger t12_pmv
disable;
alter trigger t12_pmv
enable;

--activare
alter trigger t11_pmv
disable;

select *
from ldd_history;

create or replace package pachet1_pmv as
    procedure p6_pmv;
    function f7_pmv(v_luna number,v_firma varchar2) 
    return number;
    function f8_pmv(v_job varchar2,v_oras varchar2)
    return varchar2;
    procedure p9_pmv (v_nume varchar2, v_tip varchar2);
end pachet1_pmv;
/

--13
create or replace package body pachet1_pmv as 
--scrieti o procedura care afiseaza cati angajati lucreaza pentru fiecare job si o lista cu acestia
--sortati crescator dupa salariu
    procedure p6_pmv 
    is
    
    type tablou_imbricat is table of angajat.job%type;
    v_joburi tablou_imbricat:=tablou_imbricat();
    
    type vector is varray(1000) of varchar2(200);
    v_angajati vector:= vector();
    
    begin
    
    select unique job
    bulk collect into v_joburi
    from angajat;
    
    for i in v_joburi.first..v_joburi.last loop
    
        select prenume || ' ' || nume
        bulk collect into v_angajati
        from angajat
        where lower(job)=lower(v_joburi(i))
        order by salariu;
        
        dbms_output.put_line (v_joburi(i) || ' in care lucreaza ' || v_angajati.count || ' angajati :');
        for j in v_angajati.first..v_angajati.last loop
            dbms_output.put_line('Angajatul ' || v_angajati(j));
        end loop;
    end loop;
    
    end p6_pmv;


--o functie care returneaza cate calculatoare care au fost asamblate pana la o anumita luna,data ca parametru,
--sunt transportate de o firma de curierat data ca parametru si creste costul acestora cu 5% 
    function f7_pmv(v_luna number,v_firma varchar2)
    return number is
    
    v_nr number(4):=0;
    v_nr_aux number(4);
    
    cursor c_calculator(v_data_param number) is
        select id_calculator,id_transport
        from calculator
        where to_char(data_asamblare,'MM')<=v_data_param;
        
    invalid_data exception;
    
    begin
    
    if v_luna>12 or v_luna<0 then
        raise invalid_data;
    end if;
    
    for c in c_calculator(v_luna) loop
        select count(*)
        into v_nr_aux
        from transport t
        where lower(t.nume_firma_curierat)=lower(v_firma) and t.id_transport=c.id_transport;
        
        v_nr:=v_nr+v_nr_aux;
        
        if v_nr_aux>0 then
        
            update calculator c2
            set cost=cost+cost*0.05
            where c2.id_calculator=c.id_calculator;
            
        end if;
        
    end loop;
    
    return v_nr;
    exception
        when invalid_data then
            raise_application_error(-20003,'Data invalida');
    end f7_pmv;
    
    --sa se returneze numele si salariul anual al angajatului cu salariul cel mai mare 
    --care lucreaza la jobul dat prin parametru si in orasul dat prin parametru
    function f8_pmv(v_job varchar2,v_oras varchar2)
    return varchar2 is
    
    v_salariu angajat.salariu%type:= -1;
    v_nume angajat.nume%type;
    v_prenume angajat.prenume%type;
    v_aux number;
    v_err_msg varchar2(200);
    
    begin
        
        v_err_msg:=' angajat cu jobul dat';
        select count(*)
        into v_aux
        from angajat
        where lower(job)=lower(v_job);
        
        if v_aux<1 then
            raise no_data_found;
        end if;
        
        v_err_msg:=' magazin in orasul cerut care sa aiba angajat cu jobul dat';
        select max(salariu)
        into v_salariu
        from angajat join magazin using (id_magazin) join adresa using (id_magazin)
        where lower(job)=lower(v_job) and lower(oras)=lower(v_oras);
        
        select nume,prenume
        into v_nume, v_prenume
        from angajat
        where salariu=v_salariu and lower(job)=lower(v_job);
        
    return v_salariu*12 || ' '|| v_nume || ' ' || v_prenume;
    
    exception
        when no_data_found then
            raise_application_error(-20000,'Nu exista' || v_err_msg);
        when too_many_rows then
            raise_application_error(-20001,'Exista mai multi angajati cu salariul maxim al jobului '
            || v_job || ' din orasul ' || v_oras);
    end f8_pmv;
    
    --o procedura care mareste consumul de electricitate al celei mai vechi componente,
    --care a fost livrata intr-un calculator unui client cu un nume transmis prin parametru, cu 20%
    --si afiseaza datele componentei modificate
    procedure p9_pmv (v_nume varchar2, v_tip varchar2)
    is
    
        v_aux number(4);
        v_nr number(4):=0;
        v_min componenta.data_lansare%type;
        v_data componenta%rowtype;
        
        no_client exception;
        
    begin
    
        select count(*)
        into v_aux
        from client
        where lower(nume)=lower(v_nume);
        
        if v_aux=0 then
            raise no_client;    
        end if;
        
        select min(data_lansare)
        into v_min
        from componenta join contine using (id_componenta) join calculator using (id_calculator)
        join factura using (id_calculator) join client using (id_client)
        where lower(nume)=lower(v_nume) and lower(tip)=lower(v_tip);
        
      
        
        select *
        into v_data
        from componenta
        where data_lansare=v_min and lower(tip)=lower(v_tip);
        
        update componenta
        set consum_electricitate=consum_electricitate+consum_electricitate*0.2
        where data_lansare=v_min and lower(tip)=lower(v_tip);
        
        select *
        into v_data
        from componenta
        where data_lansare=v_min and lower(tip)=lower(v_tip);
        
        dbms_output.put_line('Id: ' || v_data.id_componenta 
        || 'consum electricitate: ' || v_data.consum_electricitate || ' greutate:' || v_data.greutate || 
        ' data_lansare:' || v_data.data_lansare || ' cost:' || v_data.cost || ' tip:' || v_data.tip);
        
        exception
            when no_data_found then
                raise_application_error(-20000, 'Nu exista o componenta cu tipul ' || v_tip 
                || ' intr-un calculator livrat unui clientului cu numele ' || v_nume);
            when too_many_rows then
                raise_application_error(-20001,'Exista mai multe componente de tipul ' || v_tip 
                || ' lansate la data de ' || v_min);
            when no_client then
                raise_application_error(-20000,'Nu exista client cu numele dat');
        
    end p9_pmv;
end pachet1_pmv;
/

begin
pachet1_pmv.p6_pmv;
end;
/

begin
dbms_output.put_line(pachet1_pmv.f7_pmv(11,'Cargus'));
end;
/

begin
dbms_output.put_line(pachet1_pmv.f8_pmv('Manager','Pitesti'));
end;
/

begin
dbms_output.put_line(pachet1_pmv.f8_pmv('eaeaae','Pitesti'));
end;
/

begin
dbms_output.put_line(pachet1_pmv.f8_pmv('Manager','eaaeae'));
end;
/

begin
dbms_output.put_line(pachet1_pmv.f8_pmv('Programator','Sector 3'));
end;
/

begin
pachet1_pmv.p9_pmv('Mocanu','CPU');
end;
/

begin
pachet1_pmv.p9_pmv('Mocanu','GPU');
end;
/

begin
pachet1_pmv.p9_pmv('Meeee','GPU');
end;
/

begin
pachet1_pmv.p9_pmv('Mocanu','FPU');
end;
/

--14
create or replace package pachet2_pmv as
    -- un cursor care retine clientii cu un anumit nume
    cursor c_client (v_nume varchar2)
    return client%rowtype;
    --un tablou imbricat care retine id-uri
    type tablou_imbricat is table of number(5);
    --o functie care sterge clientii cu un anumit nume, sterge
    --garantiile si facturile acestora si returneaza cati clienti au fost stersi
    function f1_pmv (v_nume client.nume%type)
        return number;
    --o functie care adauga o noua componenta, id-ul va fi generat cu o secventa, data_lansare va
    --fi sysdate iar costul va fi egal cu pretul celei mai noi componente de acelasi tip+200
    --functia va returna cate componente de acest tip exista in baza de date
    function f2_pmv (v_consum_electricitate componenta.consum_electricitate%type,
    v_greutate componenta.greutate%type,v_tip componenta.tip%type)
        return number;
     --o procedura care schimba id-ul unui furnizor
     procedure p1_pmv(v_id furnizor.id_furnizor%type, v_id_nou furnizor.id_furnizor%type);
     --o procedura care insereaza un furnizor,id-ul va fi generat de o secventa,
     --data contract va fi sysdate si durata aprovizionare va fi media duratelor
     --procedura afiseaza datele noului furnizor
     procedure p2_pmv(v_nr_telef furnizor.nr_telef%type, v_tip_componenta furnizor.tip_componenta%type);
end pachet2_pmv;
/

create sequence seq_componenta
    start with 500
    increment by 1
    maxvalue 999999;
    
create sequence seq_furnizor
    start with 500
    increment by 1
    maxvalue 999999;

create or replace package body pachet2_pmv as

    cursor c_client(v_nume varchar2) 
    return client%rowtype is
        select *
        from client
        where lower(nume)=lower(v_nume);
            
    function f1_pmv (v_nume client.nume%type)
        return number is
            v_nr number(4):=0;
            v_id_facturi tablou_imbricat;
        begin
            for i in c_client(v_nume) loop
                select id_factura
                bulk collect into v_id_facturi
                from factura
                where id_client=i.id_client;
                
                for j in v_id_facturi.first..v_id_facturi.last loop
                    delete from garantie
                    where id_factura=v_id_facturi(j);
                    
                    delete from factura
                    where id_factura=v_id_facturi(j);
                    
                end loop;
                
                delete from client 
                where id_client=i.id_client;
                
                v_nr:=v_nr+1;
            end loop;
            return v_nr;
        end f1_pmv;
        
    function f2_pmv (v_consum_electricitate componenta.consum_electricitate%type,
    v_greutate componenta.greutate%type,v_tip componenta.tip%type)
        return number is
        
            v_cost componenta.cost%type;
            v_nr number(4);
            
        begin
            
            select max(cost)+200
            into v_cost
            from componenta
            where lower(tip)=lower(v_tip);
            
            select count(*)
            into v_nr
            from componenta
            where lower(tip)=lower(v_tip);
            
            insert into componenta
            values(seq_componenta.nextval, v_consum_electricitate, v_greutate, sysdate, v_cost, v_tip);
            
        return v_nr;
        
        end f2_pmv;
        
        procedure p1_pmv(v_id furnizor.id_furnizor%type, v_id_nou furnizor.id_furnizor%type)
            is
            
            v_nr_telef furnizor.nr_telef%type;
            v_tip_componenta furnizor.tip_componenta%type;
            v_data_contract furnizor.data_contract%type;
            v_durata_aprovizionare furnizor.durata_aprovizionare%type;
            
            begin
                select nr_telef,tip_componenta,data_contract,durata_aprovizionare
                into v_nr_telef,v_tip_componenta,v_data_contract,v_durata_aprovizionare
                from furnizor
                where id_furnizor=v_id;
                
                insert into furnizor
                values(v_id_nou,v_nr_telef,v_tip_componenta,v_data_contract,v_durata_aprovizionare);
                
                update aprovizioneaza
                set id_furnizor=v_id_nou
                where id_furnizor=v_id;
                
                update livrare
                set id_furnizor=v_id_nou
                where id_furnizor=v_id;
                
                delete from furnizor
                where id_furnizor=v_id;
                
            end p1_pmv;
            
        procedure p2_pmv(v_nr_telef furnizor.nr_telef%type, v_tip_componenta furnizor.tip_componenta%type)
        is
        
        v_medie furnizor.durata_aprovizionare%type;
        v_id furnizor.id_furnizor%type:=seq_furnizor.nextval;
        
        begin
        
        select avg(durata_aprovizionare)
        into v_medie
        from furnizor;
        
        insert into furnizor
        values (v_id,v_nr_telef,v_tip_componenta, sysdate, v_medie);
        
        dbms_output.put_line('Id: ' || v_id || ' nr telef: ' || v_nr_telef || ' tip componenta: ' ||
        v_tip_componenta || ' data contract: ' || sysdate || ' durata aprovizionare: ' || v_medie);
        
        end p2_pmv;
        
end pachet2_pmv;
/
set serveroutput on;
begin
dbms_output.put_line(pachet2_pmv.f1_pmv('Mocanu'));
end;
/

begin
dbms_output.put_line(pachet2_pmv.f2_pmv('230',1000,'GPU'));
end;
/

begin
pachet2_pmv.p1_pmv(100,236);
end;
/

begin
pachet2_pmv.p2_pmv('07777','Motherboard');
end;
/

select * from factura;
select * from client;
select * from garantie;
select * from componenta;
select * from furnizor;
select * from livrare;
select * from aprovizioneaza;
rollback;
select * from magazin;
drop table magazin cascade constraints;
drop table adresa cascade constraints;
drop table angajat cascade constraints;
drop table transport cascade constraints;
drop table calculator cascade constraints;
drop table componenta cascade constraints;
drop table contine cascade constraints;
drop table furnizor cascade constraints;
drop table aprovizioneaza cascade constraints;
drop table livrare cascade constraints;
drop table client cascade constraints;
drop table factura cascade constraints;
drop table garantie cascade constraints;
commit;
rollback;