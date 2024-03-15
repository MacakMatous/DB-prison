/*==============================================================*/
/* ISNSERT SCRIPT                                               */
/*==============================================================*/
insert into OSOBA (os_cislo, jmeno, prijmeni) values (1, 'Hubert', 'Pfeifer');
insert into OSOBA (os_cislo, jmeno, prijmeni) values (2, 'Horác', 'Grável');
insert into OSOBA (os_cislo, jmeno, prijmeni) values (3, 'František', 'Rapinett');
insert into OSOBA (os_cislo, jmeno, prijmeni) values (4, 'Jiří', 'Novotný');
insert into OSOBA (os_cislo, jmeno, prijmeni) values (5, 'Karel', 'Vomáčka');
insert into OSOBA (os_cislo, jmeno, prijmeni) values (6, 'Tomáš', 'Vostrý');
insert into OSOBA (os_cislo, jmeno, prijmeni) values (7, 'Josef', 'Mulholland');
insert into OSOBA (os_cislo, jmeno, prijmeni) values (8, 'Josef', 'Veselý');
insert into OSOBA (os_cislo, jmeno, prijmeni) values (9, 'Marek', 'Nový');
insert into OSOBA (os_cislo, jmeno, prijmeni) values (10, 'Daniel', 'Starý');

insert into DOZORCE (os_cislo, jmeno, prijmeni, plat, datum_nastup) values (1, 'Hubert', 'Pfeifer', 39767, '10-10-1996');
insert into DOZORCE (os_cislo, jmeno, prijmeni, plat, datum_nastup) values (2, 'Horác', 'Grável', 56523, '03-11-1998' );
insert into DOZORCE (os_cislo, jmeno, prijmeni, plat, datum_nastup) values (3, 'František', 'Rapinett', 38750, '09-01-2013' );
insert into DOZORCE (os_cislo, jmeno, prijmeni, plat, datum_nastup) values (4, 'Jiří', 'Novotný', 28066, '19-11-2001' );
insert into DOZORCE (os_cislo, jmeno, prijmeni, plat, datum_nastup) values (5, 'Karel', 'Vomáčka', 59437, '09-04-2021' );

insert into VEZEN (os_cislo, jmeno, prijmeni) values (6, 'Tomáš', 'Vostrý');
insert into VEZEN (os_cislo, jmeno, prijmeni, prezdivka) values (7, 'Josef', 'Mulholland', 'Holanďan');
insert into VEZEN (os_cislo, jmeno, prijmeni, prezdivka) values (8, 'Josef', 'Veselý', 'Smrťák');
insert into VEZEN (os_cislo, jmeno, prijmeni) values (9, 'Marek', 'Nový');
insert into VEZEN (os_cislo, jmeno, prijmeni, prezdivka) values (10, 'Daniel', 'Starý', 'Little D');

insert into BLOK (blok_cislo, nazev, stupen) values (1, 'Horní', 'Bez zvláštní ochrany');
insert into BLOK (blok_cislo, nazev, stupen) values (2, 'Dolní', 'Neustálý dozor');
insert into BLOK (blok_cislo, nazev, stupen) values (3, 'Za hřištěm', 'Střední');
insert into BLOK (blok_cislo, nazev, stupen) values (4, 'Malý', 'Střední se samotkou');
insert into BLOK (blok_cislo, nazev, stupen) values (5, 'Velký', 'Se zvýšeným dohledem');

insert into TREST (trest_cislo, os_cislo, datum_nastup, datum_propust) values (1, 6, '10-10-1996', '10-10-1998');
insert into TREST (trest_cislo, os_cislo, datum_nastup) values (2, 6, '10-10-1998');
insert into TREST (trest_cislo, os_cislo, datum_nastup, datum_propust) values (3, 7, '01-07-2003', '01-01-2028');
insert into TREST (trest_cislo, os_cislo, datum_nastup, datum_propust) values (4, 8, '18-03-2023', '18-03-2027');
insert into TREST (trest_cislo, os_cislo, datum_nastup) values (5, 9, '03-12-2017');
insert into TREST (trest_cislo, os_cislo, datum_nastup, datum_propust) values (6, 10, '03-04-1998', '03-10-1998');
insert into TREST (trest_cislo, os_cislo, datum_nastup, datum_propust) values (7, 10, '27-05-2003', '27-05-2004');
insert into TREST (trest_cislo, os_cislo, datum_nastup) values (8, 10, '15-09-2008');

insert into UVEZNENI (zaznam_cislo, blok_cislo, trest_cislo, datum_uvezeni) values (1, 1, 2, '10-10-1996');
insert into UVEZNENI (zaznam_cislo, blok_cislo, trest_cislo, datum_uvezeni) values (2, 2, 3, '01-07-2003');
insert into UVEZNENI (zaznam_cislo, blok_cislo, trest_cislo, datum_uvezeni) values (3, 3, 4, '18-03-2023');
insert into UVEZNENI (zaznam_cislo, blok_cislo, trest_cislo, datum_uvezeni) values (4, 3, 5, '03-12-2017');
insert into UVEZNENI (zaznam_cislo, blok_cislo, trest_cislo, datum_uvezeni, datum_opusteni) values (5, 4, 8, '15-09-2008', '15-09-2010');
insert into UVEZNENI (zaznam_cislo, blok_cislo, trest_cislo, datum_uvezeni) values (6, 1, 8, '15-09-2010');

insert into SMENA (kod, cas_zacatek, cas_konec)
    values (1, TO_DATE('18-03-2023 06:00:00', 'DD-MM-YYYY HH24:MI:SS'), TO_DATE('18-03-2023 13:00:00', 'DD-MM-YYYY HH24:MI:SS'));
insert into SMENA (kod, cas_zacatek, cas_konec)
    values (2, TO_DATE('18-03-2023 13:00:00', 'DD-MM-YYYY HH24:MI:SS'), TO_DATE('18-03-2023 20:00:00', 'DD-MM-YYYY HH24:MI:SS'));
insert into SMENA (kod, cas_zacatek, cas_konec)
    values (3, TO_DATE('19-03-2023 06:00:00', 'DD-MM-YYYY HH24:MI:SS'), TO_DATE('19-03-2023 18:00:00', 'DD-MM-YYYY HH24:MI:SS'));
insert into SMENA (kod, cas_zacatek, cas_konec)
    values (4, TO_DATE('20-03-2023 06:00:00', 'DD-MM-YYYY HH24:MI:SS'), TO_DATE('20-03-2023 13:00:00', 'DD-MM-YYYY HH24:MI:SS'));
insert into SMENA (kod, cas_zacatek, cas_konec)
    values (5, TO_DATE('20-03-2023 13:00:00', 'DD-MM-YYYY HH24:MI:SS'), TO_DATE('20-03-2023 22:00:00', 'DD-MM-YYYY HH24:MI:SS'));
insert into SMENA (kod, cas_zacatek, cas_konec)
    values (6, TO_DATE('21-03-2023 06:00:00', 'DD-MM-YYYY HH24:MI:SS'), TO_DATE('21-03-2023 13:00:00', 'DD-MM-YYYY HH24:MI:SS'));

insert into SLOUZIT (kod, os_cislo) values (1, 1);
insert into SLOUZIT (kod, os_cislo) values (1, 2);
insert into SLOUZIT (kod, os_cislo) values (2, 2);
insert into SLOUZIT (kod, os_cislo) values (2, 3);
insert into SLOUZIT (kod, os_cislo) values (3, 4);
insert into SLOUZIT (kod, os_cislo) values (4, 5);
insert into SLOUZIT (kod, os_cislo) values (5, 1);
insert into SLOUZIT (kod, os_cislo) values (5, 2);
insert into SLOUZIT (kod, os_cislo) values (5, 5);
insert into SLOUZIT (kod, os_cislo) values (6, 4);

insert into HLIDA (blok_cislo, kod) values (2, 1);
insert into HLIDA (blok_cislo, kod) values (2, 2);
insert into HLIDA (blok_cislo, kod) values (2, 3);
insert into HLIDA (blok_cislo, kod) values (3, 3);
insert into HLIDA (blok_cislo, kod) values (2, 4);
insert into HLIDA (blok_cislo, kod) values (5, 4);
insert into HLIDA (blok_cislo, kod) values (2, 5);
insert into HLIDA (blok_cislo, kod) values (5, 5);
insert into HLIDA (blok_cislo, kod) values (4, 6);