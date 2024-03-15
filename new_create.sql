alter table DOZORCE
   drop constraint FK_DOZORCE_POZICE2_OSOBA;

alter table HLIDA
   drop constraint FK_HLIDA_HLIDA_BLOK;

alter table HLIDA
   drop constraint FK_HLIDA_HLIDA2_SMENA;

alter table SLOUZIT
   drop constraint FK_SLOUZIT_SLOUZIT_SMENA;

alter table SLOUZIT
   drop constraint FK_SLOUZIT_SLOUZIT2_DOZORCE;

alter table TREST
   drop constraint FK_TREST_VYKONAVA_VEZEN;

alter table UVEZNENI
   drop constraint FK_UVEZNENI_PRIDELENI_TREST;

alter table UVEZNENI
   drop constraint FK_UVEZNENI_UMISTENI_BLOK;

alter table VEZEN
   drop constraint FK_VEZEN_POZICE_OSOBA;

drop index HLIDA2_FK;

drop index HLIDA_FK;

drop index SLOUZIT2_FK;

drop index SLOUZIT_FK;

drop index VYKONAVA_FK;

drop index PRIDELENI_FK;

drop index UMISTENI_FK;

drop table BLOK cascade constraints;

drop table DOZORCE cascade constraints;

drop table HLIDA cascade constraints;

drop table OSOBA cascade constraints;

drop table SLOUZIT cascade constraints;

drop table SMENA cascade constraints;

drop table TREST cascade constraints;

drop table UVEZNENI cascade constraints;

drop table VEZEN cascade constraints;

/*==============================================================*/
/* Table: BLOK                                                  */
/*==============================================================*/
create table BLOK  (
   BLOK_CISLO           INTEGER                         not null,
   NAZEV                VARCHAR2(80)                    not null,
   STUPEN               CLOB                            not null,
   constraint PK_BLOK primary key (BLOK_CISLO)
);

/*==============================================================*/
/* Table: DOZORCE                                               */
/*==============================================================*/
create table DOZORCE  (
   OS_CISLO             INTEGER                         not null,
   JMENO                VARCHAR2(80)                    not null,
   PRIJMENI             VARCHAR2(80)                    not null,
   PLAT                 NUMBER(8,2)                     not null,
   DATUM_NASTUP         DATE                            not null,
   
   CONSTRAINT CKC_PLAT_DOZORCE CHECK (PLAT BETWEEN 15000 AND 90000),
   CONSTRAINT CKC_DATUM_NASTUP_DOZORCE CHECK (DATUM_NASTUP >= TO_DATE('1993-01-01', 'YYYY-MM-DD')),
   CONSTRAINT PK_DOZORCE primary key (OS_CISLO)
);

/*==============================================================*/
/* Table: HLIDA                                                 */
/*==============================================================*/
create table HLIDA  (
   BLOK_CISLO           INTEGER                         not null,
   KOD                  INTEGER                         not null,
   constraint PK_HLIDA primary key (BLOK_CISLO, KOD)
);

/*==============================================================*/
/* Index: HLIDA_FK                                              */
/*==============================================================*/
create index HLIDA_FK on HLIDA (
   BLOK_CISLO ASC
);

/*==============================================================*/
/* Index: HLIDA2_FK                                             */
/*==============================================================*/
create index HLIDA2_FK on HLIDA (
   KOD ASC
);

/*==============================================================*/
/* Table: OSOBA                                                 */
/*==============================================================*/
create table OSOBA  (
   OS_CISLO             INTEGER                         not null,
   JMENO                VARCHAR2(80)                    not null,
   PRIJMENI             VARCHAR2(80)                    not null,
   constraint PK_OSOBA primary key (OS_CISLO)
);

/*==============================================================*/
/* Table: SLOUZIT                                               */
/*==============================================================*/
create table SLOUZIT  (
   KOD                  INTEGER                         not null,
   OS_CISLO             INTEGER                         not null,
   constraint PK_SLOUZIT primary key (KOD, OS_CISLO)
);

/*==============================================================*/
/* Index: SLOUZIT_FK                                            */
/*==============================================================*/
create index SLOUZIT_FK on SLOUZIT (
   KOD ASC
);

/*==============================================================*/
/* Index: SLOUZIT2_FK                                           */
/*==============================================================*/
create index SLOUZIT2_FK on SLOUZIT (
   OS_CISLO ASC
);

/*==============================================================*/
/* Table: SMENA                                                 */
/*==============================================================*/
create table SMENA  (
   KOD                  INTEGER                         not null,
   CAS_ZACATEK          DATE                            not null,
   CAS_KONEC            DATE,
   CONSTRAINT PK_SMENA primary key (KOD),
   CONSTRAINT CKC_CAS_ZACATEK_KONEC CHECK (CAS_KONEC >= CAS_ZACATEK)
);

/*==============================================================*/
/* Table: TREST                                                 */
/*==============================================================*/
create table TREST  (
   TREST_CISLO          INTEGER                         not null,
   OS_CISLO             INTEGER                         not null,
   DATUM_NASTUP         DATE                            not null,
   DATUM_PROPUST        DATE,
   
   CONSTRAINT PK_TREST primary key (TREST_CISLO),
   CONSTRAINT CKC_DATUM_NASTUP_TREST CHECK (DATUM_NASTUP >= TO_DATE('1993-01-01', 'YYYY-MM-DD')),
   CONSTRAINT CKC_DATUM_NASTUP_PROPUST CHECK (DATUM_PROPUST > DATUM_NASTUP)
);

/*==============================================================*/
/* Index: VYKONAVA_FK                                           */
/*==============================================================*/
create index VYKONAVA_FK on TREST (
   OS_CISLO ASC
);

/*==============================================================*/
/* Table: UVEZNENI                                              */
/*==============================================================*/
create table UVEZNENI  (
   ZAZNAM_CISLO         INTEGER                         not null,
   BLOK_CISLO           INTEGER                         not null,
   TREST_CISLO          INTEGER                         not null,
   DATUM_UVEZENI        DATE                            not null,
   DATUM_OPUSTENI       DATE,
   constraint PK_UVEZNENI primary key (ZAZNAM_CISLO)
);

/*==============================================================*/
/* Index: PRIDELENI_FK                                          */
/*==============================================================*/
create index PRIDELENI_FK on UVEZNENI (
   TREST_CISLO ASC
);

/*==============================================================*/
/* Index: UMISTENI_FK                                           */
/*==============================================================*/
create index UMISTENI_FK on UVEZNENI (
   BLOK_CISLO ASC
);

/*==============================================================*/
/* Table: VEZEN                                                 */
/*==============================================================*/
create table VEZEN  (
   OS_CISLO             INTEGER                         not null,
   JMENO                VARCHAR2(80)                    not null,
   PRIJMENI             VARCHAR2(80)                    not null,
   PREZDIVKA            VARCHAR2(80),
   constraint PK_VEZEN primary key (OS_CISLO)
);

alter table DOZORCE
   add constraint FK_DOZORCE_POZICE2_OSOBA foreign key (OS_CISLO)
      references OSOBA (OS_CISLO);

alter table HLIDA
   add constraint FK_HLIDA_HLIDA_BLOK foreign key (BLOK_CISLO)
      references BLOK (BLOK_CISLO);

alter table HLIDA
   add constraint FK_HLIDA_HLIDA2_SMENA foreign key (KOD)
      references SMENA (KOD);

alter table SLOUZIT
   add constraint FK_SLOUZIT_SLOUZIT_SMENA foreign key (KOD)
      references SMENA (KOD);

alter table SLOUZIT
   add constraint FK_SLOUZIT_SLOUZIT2_DOZORCE foreign key (OS_CISLO)
      references DOZORCE (OS_CISLO);

alter table TREST
   add constraint FK_TREST_VYKONAVA_VEZEN foreign key (OS_CISLO)
      references VEZEN (OS_CISLO);

alter table UVEZNENI
   add constraint FK_UVEZNENI_PRIDELENI_TREST foreign key (TREST_CISLO)
      references TREST (TREST_CISLO);

alter table UVEZNENI
   add constraint FK_UVEZNENI_UMISTENI_BLOK foreign key (BLOK_CISLO)
      references BLOK (BLOK_CISLO);

alter table VEZEN
   add constraint FK_VEZEN_POZICE_OSOBA foreign key (OS_CISLO)
      references OSOBA (OS_CISLO);
