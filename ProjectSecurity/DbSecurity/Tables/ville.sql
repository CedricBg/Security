CREATE TABLE mytable(
   datasetid              VARCHAR(18) NOT NULL 
  ,recordid               VARCHAR(40) NOT NULL
  ,fieldscolumn_2         VARCHAR(30) NOT NULL
  ,fieldscoordonnees0     NUMERIC(13,10) NOT NULL
  ,fieldscoordonnees1     NUMERIC(13,11) NOT NULL
  ,fieldscolumn_3         NUMERIC(15,13) NOT NULL
  ,fieldscolumn_4         NUMERIC(15,12) NOT NULL
  ,fieldscolumn_1         INTEGER  NOT NULL
  ,geometrytype           VARCHAR(5) NOT NULL
  ,geometrycoordinates0   NUMERIC(13,11) NOT NULL
  ,geometrycoordinates1   NUMERIC(13,10) NOT NULL
  ,record_timestamp       VARCHAR(29) NOT NULL
);