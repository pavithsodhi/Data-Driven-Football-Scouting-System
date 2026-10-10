USE final_dbms_project;

-- 1. Ensure Primary Keys
ALTER TABLE teamtable ADD PRIMARY KEY (Team_ID);
ALTER TABLE playertable ADD PRIMARY KEY (Player_ID);
ALTER TABLE matchstatstable ADD PRIMARY KEY (Player_ID);
ALTER TABLE shotefficiencytable ADD PRIMARY KEY (Player_ID);
ALTER TABLE passingstatstable ADD PRIMARY KEY (Player_ID);
ALTER TABLE defensivestatstable ADD PRIMARY KEY (Player_ID);
ALTER TABLE possessionstatstable ADD PRIMARY KEY (Player_ID);
ALTER TABLE discipplinestatstable ADD PRIMARY KEY (Player_ID);
ALTER TABLE airialstatstable ADD PRIMARY KEY (Player_ID);
ALTER TABLE dribblingstatstable ADD PRIMARY KEY (Player_ID);
ALTER TABLE gca_scastatstable ADD PRIMARY KEY (Player_ID);

-- 2. Add Foreign Key Constraints (Linking Player tables to Team, and Stats tables to Player)
ALTER TABLE playertable 
ADD CONSTRAINT fk_player_team 
FOREIGN KEY (Team_ID) REFERENCES teamtable(Team_ID);

ALTER TABLE matchstatstable 
ADD CONSTRAINT fk_match_player 
FOREIGN KEY (Player_ID) REFERENCES playertable(Player_ID);

ALTER TABLE shotefficiencytable 
ADD CONSTRAINT fk_shot_player 
FOREIGN KEY (Player_ID) REFERENCES playertable(Player_ID);

ALTER TABLE passingstatstable 
ADD CONSTRAINT fk_passing_player 
FOREIGN KEY (Player_ID) REFERENCES playertable(Player_ID);

ALTER TABLE defensivestatstable 
ADD CONSTRAINT fk_defensive_player 
FOREIGN KEY (Player_ID) REFERENCES playertable(Player_ID);

ALTER TABLE possessionstatstable 
ADD CONSTRAINT fk_possession_player 
FOREIGN KEY (Player_ID) REFERENCES playertable(Player_ID);

ALTER TABLE discipplinestatstable 
ADD CONSTRAINT fk_discipline_player 
FOREIGN KEY (Player_ID) REFERENCES playertable(Player_ID);

ALTER TABLE airialstatstable 
ADD CONSTRAINT fk_airial_player 
FOREIGN KEY (Player_ID) REFERENCES playertable(Player_ID);

ALTER TABLE dribblingstatstable 
ADD CONSTRAINT fk_dribbling_player 
FOREIGN KEY (Player_ID) REFERENCES playertable(Player_ID);

ALTER TABLE gca_scastatstable 
ADD CONSTRAINT fk_gca_player 
FOREIGN KEY (Player_ID) REFERENCES playertable(Player_ID);