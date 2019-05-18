create schema if not exists bd_project
create table  if not exists bd_project.match(
  match_id serial primary key NOT NULL,
  match_dt  TIMESTAMP(0) ,
  host_tm_id int ,
  guest_tm_id int ,
  income_ast int,
  result_txt  varchar(10)
)
create table if not exists bd_project.football_team (
  team_id serial primary key NOT NULL,
  team_nm varchar(100),
  budget_ast int ,
  stadium_id int ,
 coach_contract_id int

)
create table if not exists bd_project.coach(
  coach_id serial not null primary key,
  contract_id  int ,
  scheme_txt varchar(10),
  coach_nm varchar(30)
)
create table if not exists bd_project.player(
  player_id serial NOT NULL primary key ,
  contract_id int,
  captain_flg INT,
  player_nm varchar(30),
  position_txt VARCHAR(10)
)
create table if not exists bd_project.player_contract(
  contract_id serial PRIMARY KEY NOT NULL ,
  team_id int,
  player_id int,
  start_dt TIMESTAMP(0),
  exp_dt TIMESTAMP(0),
  salary_amt INT
)
create table if not exists bd_project.coach_contract(
  contract_id serial PRIMARY KEY NOT NULL ,
  team_id int ,
  coach_id int ,
  start_dt TIMESTAMP(0),
  exp_dt TIMESTAMP(0),
  salary_amt INT
)
create table if not exists bd_project.stadium(
  stadium_id SERIAL PRIMARY KEY NOT NULL ,
  stadium_nm VARCHAR(50),
  city_nm VARCHAR(20),
  capacity_amt INT
);
ALTER  table bd_project.match add foreign key (host_tm_id) references bd_project.football_team(team_id);
ALTER  table bd_project.match add foreign key (guest_tm_id)references bd_project.football_team(team_id);
ALTER  table bd_project.football_team add foreign key (stadium_id) references bd_project.stadium(stadium_id);
ALTER  table bd_project.football_team add foreign key (coach_contract_id) references bd_project.coach_contract(contract_id);
ALTER  table bd_project.coach  add foreign key (contract_id) references bd_project.coach_contract(contract_id);
ALTER  table bd_project.player add foreign key (contract_id) references bd_project.player_contract(contract_id);
ALTER  table bd_project.player_contract add foreign key (player_id)references bd_project.player(player_id);
ALTER  table bd_project.player_contract add foreign key (team_id)references bd_project.football_team(team_id);
ALTER  table bd_project.coach_contract add foreign key (coach_id)references bd_project.coach(coach_id);
ALTER  table bd_project.coach_contract add foreign key (team_id)references bd_project.football_team(team_id);
