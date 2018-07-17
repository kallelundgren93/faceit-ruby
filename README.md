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
"player_id"=>"8ed9d1fa-351c-4cff-86f8-82d907a2e598", "nickname"=>"FrekvenZ", "avatar"=>"https://d50m6q67g4bn3.cloudfront.net/avatars/8ed9d1fa-351c-4cff-86f8-82d907a2e598_1447861864100", "country"=>"se", "cover_image"=>"https://d50m6q67g4bn3.cloudfront.net/users_covers/8ed9d1fa-351c-4cff-86f8-82d907a2e598_1451521480559", "cover_featured_image"=>"", 
"infractions"=>{"last_infraction_date"=>"Sun Jan 22 22:37:16 UTC 2017", "afk"=>0, 
"leaver"=>0, "qm_not_checkedin"=>1, "qm_not_voted"=>0}, 
"platforms"=>{"steam"=>"STEAM_1:1:34352020"}, 
"games"=>{"csgo"=>{"game_profile_id"=>"d2c40bc0-22be-4f34-a4ef-f9e5e7171121", 
"region"=>"EU", 
"regions"=>{"EU"=>{"selected_ladder_id"=>"8230146b-db40-4d2c-aa41-a413925768e0"}}, 
"skill_level_label"=>"6", "game_player_id"=>"76561198028969769", 
"skill_level"=>6, "faceit_elo"=>1516, "game_player_name"=>"Lunkenn"}, 
"lol_EUW"=>{"game_profile_id"=>"8c0a78c2-3785-4f12-9a4d-0dc2876051e9", 
"region"=>"", 
"regions"=>{"EUW"=>{"selected_ladder_id"=>"756d3c69-4fd8-486b-b982-7903eaaf8ed6"}}, 
"skill_level_label"=>"5", "game_player_id"=>"30426811", "skill_level"=>5, "faceit_elo"=>1000, 
"game_player_name"=>"Lunkiboii"}}, "settings"=>{"language"=>"en"}, 
"friends_ids"=>["1b18544e-d9e4-4f2a-995d-790a4af7523c"], 
"bans"=>[], "new_steam_id"=>"[U:1:68704041]", 
"steam_id_64"=>"76561198028969769", 
"steam_nickname"=>"Lunkenn", "membership_type"=>"unlimited", 
"faceit_url"=>"https://www.faceit.com/{lang}/players/FrekvenZ"
```

#### Getting information
```res = client.get_player("8ed9d1fa-351c-4cff-86f8-82d907a2e598")```

#### Extracting it:
```res['player_id']```

#### Result:
```"8ed9d1fa-351c-4cff-86f8-82d907a2e598"```

### GET /players/?nickname={} Get player by nickname
```
client.get_player_by_nickname("FrekvenZ")

#OBS Case sensitive!!!!!!!!
```

#### Example result:
```
{"player_id"=>"8ed9d1fa-351c-4cff-86f8-82d907a2e598", "nickname"=>"FrekvenZ", "avatar"=>"https://d50m6q67g4bn3.cloudfront.net/avatars/8ed9d1fa-351c-4cff-86f8-82d907a2e598_1447861864100", "country"=>"se", 
"cover_image"=>"https://d50m6q67g4bn3.cloudfront.net/users_covers/8ed9d1fa-351c-4cff-86f8-82d907a2e598_1451521480559", "cover_featured_image"=>"", 
"infractions"=>{"last_infraction_date"=>"Sun Jan 22 22:37:16 UTC 2017", "afk"=>0, 
"leaver"=>0, "qm_not_checkedin"=>1, "qm_not_voted"=>0}, 
"platforms"=>{"steam"=>"STEAM_1:1:34352020"}, 
"games"=>{"csgo"=>{"game_profile_id"=>"d2c40bc0-22be-4f34-a4ef-f9e5e7171121", 
"region"=>"EU", "regions"=>{"EU"=>{"selected_ladder_id"=>"8230146b-db40-4d2c-aa41-a413925768e0"}}, 
"skill_level_label"=>"6", "game_player_id"=>"76561198028969769", "skill_level"=>6, 
"faceit_elo"=>1516, "game_player_name"=>"Lunkenn"}, 
"lol_EUW"=>{"game_profile_id"=>"8c0a78c2-3785-4f12-9a4d-0dc2876051e9", "region"=>"", "regions"=>{"EUW"=>{"selected_ladder_id"=>"756d3c69-4fd8-486b-b982-7903eaaf8ed6"}}, 
"skill_level_label"=>"5", "game_player_id"=>"30426811", "skill_level"=>5, "faceit_elo"=>1000, "game_player_name"=>"Lunkiboii"}}, "settings"=>{"language"=>"en"}, 
"friends_ids"=>["1b18544e-d9e4-4f2a-995d-790a4af7523c"], "bans"=>[], 
"new_steam_id"=>"[U:1:68704041]", "steam_id_64"=>"76561198028969769", 
"steam_nickname"=>"Lunkenn", "membership_type"=>"unlimited", 
"faceit_url"=>"https://www.faceit.com/{lang}/players/FrekvenZ"}
```

#### Getting information
```
res = client.get_player_by_nickname("FrekvenZ")
```

#### Extracting it:
```
res['cover_image']
```

#### Result:
```
"https://d50m6q67g4bn3.cloudfront.net/users_covers/8ed9d1fa-351c-4cff-86f8-82d907a2e598_1451521480559"
```

### GET /players/{player_id}/history Retrieve all matches of a player
```
client.get_player_history("8ed9d1fa-351c-4cff-86f8-82d907a2e598", "csgo", {from: 946684800, offset: 0, limit: 1})
```
##### <i>There are also <b>to:</b> and <b>from:</b> options, from: will be 1 month if not specified and to: current_timestamp. OBS! both these options require UNIX timestamp</i>
<i>Offset and limit is optional.</i>

#### Example result:
```
"items"=>[{"match_id"=>"18aa5180-f8a1-43e6-80aa-0fd79a090e6b", "game_id"=>"csgo", 
"match_type"=>"5v5", "game_mode"=>"", "game_type"=>"QuickMatch", "best_of"=>1, 
"played"=>1, "max_players"=>10, "teams_size"=>5, 
"teams"=>{"faction1"=>{"team_id"=>"9e73ddbe-17a8-456a-918d-53c744128f30", 
"nickname"=>"team_MayTec", "avatar"=>"", "type"=>"mix", 
"players"=>[{"player_id"=>"590fbf1e-c737-4bf8-9fb8-0c1069c1c1d6", 
"nickname"=>"gERy2001", "avatar"=>"https://d50m6q67g4bn3.cloudfront.net/avatars/590fbf1e-c737-4bf8-9fb8-0c1069c1c1d6_1519456094500", "skill_level"=>0, "game_player_id"=>"76561197961534207", 
"game_player_name"=>"gery2k14 boiss =D", "faceit_url"=>"https://www.faceit.com/{lang}/players/gERy2001"}, {

"player_id"=>"70068c58-1cf6-4d4e-b2ed-0b3e8f5ed28e", 
"nickname"=>"Chik_i", "avatar"=>"https://d50m6q67g4bn3.cloudfront.net/avatars/70068c58-1cf6-4d4e-b2ed-0b3e8f5ed28e_1525184062428", "skill_level"=>0, 
"game_player_id"=>"76561198371886762", "game_player_name"=>"ChiK_i", "faceit_url"=>"https://www.faceit.com/{lang}/players/Chik_i"}, 
{"player_id"=>"962b1651-f0c2-4408-b944-2205947215df", "nickname"=>"_CoasT_", "avatar"=>"https://d50m6q67g4bn3.cloudfront.net/avatars/962b1651-f0c2-4408-b944-2205947215df_1520787013582", "skill_level"=>0, "game_player_id"=>"76561198428426852", "game_player_name"=>"Getrudes", "faceit_url"=>"https://www.faceit.com/{lang}/players/_CoasT_"}, 
{"player_id"=>"9e73ddbe-17a8-456a-918d-53c744128f30", "nickname"=>"MayTec", "avatar"=>"https://d50m6q67g4bn3.cloudfront.net/avatars/9e73ddbe-17a8-456a-918d-53c744128f30_1480559442664", "skill_level"=>0, "game_player_id"=>"76561198000939712", "game_player_name"=>"MayTec", "faceit_url"=>"https://www.faceit.com/{lang}/players/MayTec"}, 
{"player_id"=>"f6ce6dc5-4a0b-458c-aa15-0b3210521fd6", "nickname"=>"ProDy10", "avatar"=>"https://d50m6q67g4bn3.cloudfront.net/avatars/f6ce6dc5-4a0b-458c-aa15-0b3210521fd6_1504386982531", "skill_level"=>0, "game_player_id"=>"76561198265543744", "game_player_name"=>"76561198265543744", "faceit_url"=>"https://www.faceit.com/{lang}/players/ProDy10"}]}, "faction2"=>{"team_id"=>"3fb9afda-c451-446d-a425-7672d6b990b3", "nickname"=>"team_RealiNs8T", "avatar"=>"", "type"=>"mix", "players"=>[{"player_id"=>"1b18544e-d9e4-4f2a-995d-790a4af7523c", "nickname"=>"RealiNs8T", "avatar"=>"https://d50m6q67g4bn3.cloudfront.net/avatars/1b18544e-d9e4-4f2a-995d-790a4af7523c_1447177984631", "skill_level"=>0, "game_player_id"=>"76561197960390498", "game_player_name"=>"iNs8T - Gamersmotcancer.se", "faceit_url"=>"https://www.faceit.com/{lang}/players/RealiNs8T"}, {"player_id"=>"55a832ad-2c65-4e04-a0c4-0729b0314151", "nickname"=>"NiNYa", "avatar"=>"https://d50m6q67g4bn3.cloudfront.net/avatars/55a832ad-2c65-4e04-a0c4-0729b0314151_1524082270135", "skill_level"=>0, "game_player_id"=>"76561198001957640", "game_player_name"=>"ninya ♥ znajd3r", "faceit_url"=>"https://www.faceit.com/{lang}/players/NiNYa"}, 
{"player_id"=>"8ed9d1fa-351c-4cff-86f8-82d907a2e598", "nickname"=>"FrekvenZ", "avatar"=>"https://d50m6q67g4bn3.cloudfront.net/avatars/8ed9d1fa-351c-4cff-86f8-82d907a2e598_1447861864100", "skill_level"=>0, "game_player_id"=>"76561198028969769", "game_player_name"=>"Lunkenn", "faceit_url"=>"https://www.faceit.com/{lang}/players/FrekvenZ"}, 
{"player_id"=>"9cbe80fd-aa67-40f9-a825-7c12f2997958", "nickname"=>"SebbeSmith", "avatar"=>"https://d50m6q67g4bn3.cloudfront.net/avatars/9cbe80fd-aa67-40f9-a825-7c12f2997958_1428340598939", "skill_level"=>0, "game_player_id"=>"76561198062755726", "game_player_name"=>"CB =DD", "faceit_url"=>"https://www.faceit.com/{lang}/players/SebbeSmith"}, 
{"player_id"=>"d0453c94-7c37-4d3e-a8b5-4be934552ae5", "nickname"=>"goffe-", "avatar"=>"https://d50m6q67g4bn3.cloudfront.net/avatars/d0453c94-7c37-4d3e-a8b5-4be934552ae5_1488982166682", "skill_level"=>0, "game_player_id"=>"76561197997347339", "game_player_name"=>"Goffeee", "faceit_url"=>"https://www.faceit.com/{lang}/players/goffe-"}]}}, 
"playing_players"=>["590fbf1e-c737-4bf8-9fb8-0c1069c1c1d6", "70068c58-1cf6-4d4e-b2ed-0b3e8f5ed28e", 
"962b1651-f0c2-4408-b944-2205947215df", "9e73ddbe-17a8-456a-918d-53c744128f30",
"f6ce6dc5-4a0b-458c-aa15-0b3210521fd6", "1b18544e-d9e4-4f2a-995d-790a4af7523c", 
"55a832ad-2c65-4e04-a0c4-0729b0314151", "8ed9d1fa-351c-4cff-86f8-82d907a2e598", 
"9cbe80fd-aa67-40f9-a825-7c12f2997958", "d0453c94-7c37-4d3e-a8b5-4be934552ae5"], 
"competition_id"=>"", "competition_name"=>"5v5", "competition_type"=>"QuickMatch", 
"organizer_id"=>"", "status"=>"finished", "started_at"=>1525872813, 
"finished_at"=>1525875266, 
"faceit_url"=>"https://www.faceit.com/{lang}/csgo/room/18aa5180-f8a1-43e6-80aa-0fd79a090e6b"}], 
"start"=>0, "end"=>1, "from"=>946684800, "to"=>1531837941
```

#### Getting information
```
res = client.get_player_history("8ed9d1fa-351c-4cff-86f8-82d907a2e598", "csgo", {from: 946684800, offset: 0, limit: 1})
```

#### Extracting it:
```
res['items'][0]['max_players']
```

#### Result:
```
10
```
