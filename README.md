# Welcome to faceit-ruby
Hello!
This is a implementation for most of the endpoints the Faceit Data v4 api offers, feel free to contribute or fork to fit your application.

## Installation

<p>Put this in your gemfile:</p>

```
gem 'faceit-ruby', git: 'https://github.com/kallelundgren93/faceit-ruby.git'
```


<p>Then run: </p>
<p><code>bundle install</code></p>

<p>Then create an app on <a href="https://developers.faceit.com/">Developer Faceit</a> to get a apikey, then select to create the apikey for Serverside</p>

<h2>Usage</h2>
<p>First you need to intialize the client:</p>

```client = Faceit::Client.new api_key: "YOUR-API-KEY"```

<p>Then you can start working towards the api</p>

## Searches endpoints

### GET /search/organizers Search for organizers

```client.search_organizers({name: "Swedish Pro League", offset: "0", limit: "2"})```
<i>Offset and limit is optional.</i>

#### Example result:
```
"Faceit::Response:0x007fca705819b0 
@items=[# Faceit::Organizer:0x007fca705819d8 @id="4bba8091-77f3-40a5-a986-715d160e2b53", 
@name="Swedish Pro League", @partner=true, 
@avatar="https://d50m6q67g4bn3.cloudfront.net/organizer_avatar/4bba8091-77f3-40a5-a986-715d160e2b53_1528027743156", 
@games=["csgo"], @countries=["SE"], @active=true, @regions=[]"
```

#### Getting information
```res = client.search_organizers({name: "Swedish Pro League", offset: "0", limit: "2"})```
  
#### Extracting it:
```res.items.first.avatar```

#### Result:
```"https://d50m6q67g4bn3.cloudfront.net/organizer_avatar/4bba8091-77f3-40a5-a986-715d160e2b53_1528027743156"```
  

### GET /search/players Search for players

```client.search_players({nickname: "FrekvenZ", offset: "0", limit: "2"})```
<i>Offset and limit is optional.</i>

#### Example result:
```
"Faceit::Response:0x007fca701c1848 
@items=[#Faceit::Player:0x007fca701c18e8 @id="8ed9d1fa-351c-4cff-86f8-82d907a2e598", @nickname="FrekvenZ", @avatar="https://d50m6q67g4bn3.cloudfront.net/avatars/8ed9d1fa-351c-4cff-86f8-82d907a2e598_1447861864100", 
@country="se", @games=[{"name"=>"csgo", "skill_level"=>"6"}, {"name"=>"lol_EUW", "skill_level"=>"5"}], 
@status="AVAILABLE", @verified=false"
```

#### Getting information
```res = client.search_players({nickname: "FrekvenZ", offset: "0", limit: "2"})```
  
#### Extracting it:
```res.items.first.games```

#### Result:
```[{"name"=>"csgo", "skill_level"=>"6"}, {"name"=>"lol_EUW", "skill_level"=>"5"}]```

### GET /search/teams Search for teams
```client.search_teams({nickname: "Astralis (Astralis)", offset: "0", limit: "2"})```
<i>Offset and limit is optional.</i>

#### Example result:
```
Faceit::Response:0x007fca6e061f68 
@items=[#Faceit::Team:0x007fca6e0627b0 @id="46367ae8-1345-4482-90e9-3f2e35e137fc", 
@name="Astralis", @verified=false, @avatar="", @game="csgo", 
@faceit_url="https://www.faceit.com/{lang}/teams/46367ae8-1345-4482-90e9-3f2e35e137fc", 
@chat_room_id="team-46367ae8-1345-4482-90e9-3f2e35e137fc">, #Faceit::Team:0x007fca6e062788 
@id="79bcd0c8-c30c-48b3-8796-b329b9b960f6", @name="Astralis", @verified=false, @avatar="https://d50m6q67g4bn3.cloudfront.net/teams_avatars/79bcd0c8-c30c-48b3-8796-b329b9b960f6_1468258988760", @game="dota2", @faceit_url="https://www.faceit.com/{lang}/teams/79bcd0c8-c30c-48b3-8796-b329b9b960f6", 
@chat_room_id="team-79bcd0c8-c30c-48b3-8796-b329b9b960f6"
```

#### Getting information
```res = client.search_teams({nickname: "Astralis (Astralis)", offset: "0", limit: "2"})```

#### Extracting it:
```res.items.first.faceit_url```

#### Result:
```"https://www.faceit.com/{lang}/teams/46367ae8-1345-4482-90e9-3f2e35e137fc"```

### GET /search/tournaments Search for tournaments
```client.search_tournaments({name: "Weekly", offset: "0", limit: "2"})```
<i>Offset and limit is optional.</i>

#### Example result:
```
"Faceit::Response:0x007fca6d1436a8 
@items=[#Faceit::Tournament:0x007fca6d1437c0 @id="99a90e8f-d1b9-44cf-a667-898f54bfb387", 
@competition_type="tournament", @name="Weekly Battle-Cup", @game="dota2", @region="US", 
@organizer_id="611751d3-099f-4fb0-8e6e-fb6e1cf95d61", @organizer_type="organization", 
@status="paid", @started_at=1522972800, @prize_type="points", @total_prize="5000", @players_joined=2, 
@players_checkedin=3, @slots=16>, Faceit::Tournament:0x007fca6d1436f8 @id="0d5f846a-74e2-446e-9e24-e010aaf0f208", @competition_type="tournament", @name="Weekly Battle-Cup", @game="dota2", @region="US", 
@organizer_id="611751d3-099f-4fb0-8e6e-fb6e1cf95d61", @organizer_type="organization", 
@status="paid", @started_at=1523578500, @prize_type="points", @total_prize="5000", 
@players_joined=nil, @players_checkedin=2, @slots=16"
```

#### Getting information
```res = client.search_tournaments({name: "Weekly", offset: "0", limit: "2"})```

#### Extracting it:
```res.items.first.total_prize```

#### Result:
```"5000"```

## Players Endpoint
### GET /players/{player_id} Retrieve player details

```client.get_player("8ed9d1fa-351c-4cff-86f8-82d907a2e598")```

#### Example result:
```
"player_id"=>"8ed9d1fa-351c-4cff-86f8-82d907a2e598", "nickname"=>"FrekvenZ", "avatar"=>"https://d50m6q67g4bn3.cloudfront.net/avatars/8ed9d1fa-351c-4cff-86f8-82d907a2e598_1447861864100", "country"=>"se", "cover_image"=>"https://d50m6q67g4bn3.cloudfront.net/users_covers/8ed9d1fa-351c-4cff-86f8-82d907a2e598_1451521480559", "cover_featured_image"=>"", "infractions"=>{"last_infraction_date"=>"Sun Jan 22 22:37:16 UTC 2017", "afk"=>0, "leaver"=>0, "qm_not_checkedin"=>1, "qm_not_voted"=>0}, "platforms"=>{"steam"=>"STEAM_1:1:34352020"}, "games"=>{"csgo"=>{"game_profile_id"=>"d2c40bc0-22be-4f34-a4ef-f9e5e7171121", "region"=>"EU", "regions"=>{"EU"=>{"selected_ladder_id"=>"8230146b-db40-4d2c-aa41-a413925768e0"}}, "skill_level_label"=>"6", "game_player_id"=>"76561198028969769", "skill_level"=>6, "faceit_elo"=>1516, "game_player_name"=>"Lunkenn"}, "lol_EUW"=>{"game_profile_id"=>"8c0a78c2-3785-4f12-9a4d-0dc2876051e9", "region"=>"", "regions"=>{"EUW"=>{"selected_ladder_id"=>"756d3c69-4fd8-486b-b982-7903eaaf8ed6"}}, "skill_level_label"=>"5", "game_player_id"=>"30426811", "skill_level"=>5, "faceit_elo"=>1000, "game_player_name"=>"Lunkiboii"}}, "settings"=>{"language"=>"en"}, "friends_ids"=>["1b18544e-d9e4-4f2a-995d-790a4af7523c", "49e9e9f8-21b0-4a78-b4a5-3258bb22de6f", "f3027cf0-5bd6-41cb-a229-0d6204148070", "6df895f6-eac2-4b43-9061-368bbbc3e4e9", "0a222aa6-8420-4073-9ac9-589f7621fca9", "6fa1f2e2-fba2-4979-858e-8be68073a75e", "9a037763-c0e6-4c1b-baf4-41e1caac1434", "d0453c94-7c37-4d3e-a8b5-4be934552ae5", "9db7e7ff-dc5e-4ef9-b2b2-313d49bb287d", "14d57daa-fc8d-4caa-9143-c00c247d5f5e", "a396de50-99e3-4dc4-a6f8-e26e953acf49", "f5c890e5-034d-4986-829f-17989ee5f9cf", "ca738962-fc89-404b-bca5-b4d024500b78", "ebd33792-1fc2-4466-b070-0129c77e8f9e", "ccf1bb7f-c07b-4a2c-a159-4aaf7871ce11", "5e258d18-64e6-45ad-8c49-9bcc248edefb", "b167359c-349c-4873-bef1-ecc8d75e83bd", "50682302-0997-461b-821c-fc5f9c566c2b", "afceaba6-db8d-483b-bfce-6aa88429e601", "37b89883-a408-449f-90e6-bf5a4ca87316", "1ba5b4b0-c368-4219-b994-de62153c8ebe", "7275077e-3fbc-4518-b1ee-8ccde6e9b4d0", "b9e423b5-6d81-4f67-bcf3-9713b1040917", "87459256-6fce-40b6-aa96-b75d23fc9a51", "f33bd600-1b4c-4d97-b39b-9136bf605d14", "645afdcf-9c68-4d74-a4ec-3a0f824f7caf", "2c61aec1-ea94-41c2-8598-12d148a9bfd2", "4c9936fc-8030-422a-9a98-111cd1ea19ca", "214571fe-8fc9-424a-8e73-584c8c5761ed", "16b4c644-7732-4f81-ae5f-1851f155f161", "2672a57a-48e1-49d4-9c18-9501d2c515af", "9fbd4220-eadb-4f98-95a8-780164522366", "25a3affa-4faa-4866-ab76-17d78bbfa887", "a58efd4b-5a72-430d-b4dc-300f870a2d03", "87d0b21a-500f-44ed-9b2c-12383e1434aa", "74161d98-37c9-4b72-aaf8-b495d696cbe1", "9431b65d-0af2-434e-b007-b6b4ba0f9299", "9b635542-c4e4-484f-9a65-1caedb711cf3", "3a435d26-c400-4310-86ec-07ff0e6a7627", "fdad12d5-1d40-46ea-b9cd-30f033388598"], "bans"=>[], "new_steam_id"=>"[U:1:68704041]", "steam_id_64"=>"76561198028969769", "steam_nickname"=>"Lunkenn", "membership_type"=>"unlimited", "faceit_url"=>"https://www.faceit.com/{lang}/players/FrekvenZ"
```

#### Getting information
```res = client.get_player("8ed9d1fa-351c-4cff-86f8-82d907a2e598")```

#### Extracting it:
```res['player_id']```

#### Result:
```"8ed9d1fa-351c-4cff-86f8-82d907a2e598"```

### GET /players/{player_id} Retrieve player details

```client.get_player("8ed9d1fa-351c-4cff-86f8-82d907a2e598")```

#### Example result:
```
"player_id"=>"8ed9d1fa-351c-4cff-86f8-82d907a2e598", "nickname"=>"FrekvenZ", "avatar"=>"https://d50m6q67g4bn3.cloudfront.net/avatars/8ed9d1fa-351c-4cff-86f8-82d907a2e598_1447861864100", "country"=>"se", "cover_image"=>"https://d50m6q67g4bn3.cloudfront.net/users_covers/8ed9d1fa-351c-4cff-86f8-82d907a2e598_1451521480559", "cover_featured_image"=>"", "infractions"=>{"last_infraction_date"=>"Sun Jan 22 22:37:16 UTC 2017", "afk"=>0, "leaver"=>0, "qm_not_checkedin"=>1, "qm_not_voted"=>0}, "platforms"=>{"steam"=>"STEAM_1:1:34352020"}, "games"=>{"csgo"=>{"game_profile_id"=>"d2c40bc0-22be-4f34-a4ef-f9e5e7171121", "region"=>"EU", "regions"=>{"EU"=>{"selected_ladder_id"=>"8230146b-db40-4d2c-aa41-a413925768e0"}}, "skill_level_label"=>"6", "game_player_id"=>"76561198028969769", "skill_level"=>6, "faceit_elo"=>1516, "game_player_name"=>"Lunkenn"}, "lol_EUW"=>{"game_profile_id"=>"8c0a78c2-3785-4f12-9a4d-0dc2876051e9", "region"=>"", "regions"=>{"EUW"=>{"selected_ladder_id"=>"756d3c69-4fd8-486b-b982-7903eaaf8ed6"}}, "skill_level_label"=>"5", "game_player_id"=>"30426811", "skill_level"=>5, "faceit_elo"=>1000, "game_player_name"=>"Lunkiboii"}}, "settings"=>{"language"=>"en"}, "friends_ids"=>["1b18544e-d9e4-4f2a-995d-790a4af7523c", "49e9e9f8-21b0-4a78-b4a5-3258bb22de6f", "f3027cf0-5bd6-41cb-a229-0d6204148070", "6df895f6-eac2-4b43-9061-368bbbc3e4e9", "0a222aa6-8420-4073-9ac9-589f7621fca9", "6fa1f2e2-fba2-4979-858e-8be68073a75e", "9a037763-c0e6-4c1b-baf4-41e1caac1434", "d0453c94-7c37-4d3e-a8b5-4be934552ae5", "9db7e7ff-dc5e-4ef9-b2b2-313d49bb287d", "14d57daa-fc8d-4caa-9143-c00c247d5f5e", "a396de50-99e3-4dc4-a6f8-e26e953acf49", "f5c890e5-034d-4986-829f-17989ee5f9cf", "ca738962-fc89-404b-bca5-b4d024500b78", "ebd33792-1fc2-4466-b070-0129c77e8f9e", "ccf1bb7f-c07b-4a2c-a159-4aaf7871ce11", "5e258d18-64e6-45ad-8c49-9bcc248edefb", "b167359c-349c-4873-bef1-ecc8d75e83bd", "50682302-0997-461b-821c-fc5f9c566c2b", "afceaba6-db8d-483b-bfce-6aa88429e601", "37b89883-a408-449f-90e6-bf5a4ca87316", "1ba5b4b0-c368-4219-b994-de62153c8ebe", "7275077e-3fbc-4518-b1ee-8ccde6e9b4d0", "b9e423b5-6d81-4f67-bcf3-9713b1040917", "87459256-6fce-40b6-aa96-b75d23fc9a51", "f33bd600-1b4c-4d97-b39b-9136bf605d14", "645afdcf-9c68-4d74-a4ec-3a0f824f7caf", "2c61aec1-ea94-41c2-8598-12d148a9bfd2", "4c9936fc-8030-422a-9a98-111cd1ea19ca", "214571fe-8fc9-424a-8e73-584c8c5761ed", "16b4c644-7732-4f81-ae5f-1851f155f161", "2672a57a-48e1-49d4-9c18-9501d2c515af", "9fbd4220-eadb-4f98-95a8-780164522366", "25a3affa-4faa-4866-ab76-17d78bbfa887", "a58efd4b-5a72-430d-b4dc-300f870a2d03", "87d0b21a-500f-44ed-9b2c-12383e1434aa", "74161d98-37c9-4b72-aaf8-b495d696cbe1", "9431b65d-0af2-434e-b007-b6b4ba0f9299", "9b635542-c4e4-484f-9a65-1caedb711cf3", "3a435d26-c400-4310-86ec-07ff0e6a7627", "fdad12d5-1d40-46ea-b9cd-30f033388598"], "bans"=>[], "new_steam_id"=>"[U:1:68704041]", "steam_id_64"=>"76561198028969769", "steam_nickname"=>"Lunkenn", "membership_type"=>"unlimited", "faceit_url"=>"https://www.faceit.com/{lang}/players/FrekvenZ"
```

#### Getting information
```res = client.get_player("8ed9d1fa-351c-4cff-86f8-82d907a2e598")```

#### Extracting it:
```res['player_id']```

#### Result:
```"8ed9d1fa-351c-4cff-86f8-82d907a2e598"```

